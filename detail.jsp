<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--

  データベースへのコネクションを取得

--%>
<sql:setDataSource driver="org.h2.Driver" url="jdbc:h2:sdev" />


<%--

  販売画面で選択した衣料品の情報を取得する

  商品コードを取得し、変数[formProductCode]に格納する

--%>
<fmt:requestEncoding value="utf-8" />
<c:set var="formProductCode" value="${param.selectedProductCode}" />
<%--

  商品の在庫を検索する
  [PRODUCT_STOCK]テーブルから[PRODUCT_CODE], [MAKER_ID], [PC_NAME],
   [PC_TYPE], [SAL_VALUE], [SPEC], [STOCK_NUM]を検索するSQL文

--%>
<sql:query var="rs">
SELECT STOCK_NUM
  FROM PRODUCT_STOCK WHERE PRODUCT_CODE = ?;
<sql:param value="${formProductCode}" />
</sql:query>

<%-- 在庫数を変数[stockNum]に格納する --%>
<c:choose>
  <c:when test="${rs.rowCount == 0}">
    <c:set var="stockNum" value="0" />
  </c:when>
  <c:otherwise>
    <c:set var="row" value="${rs.rows[0]}" />
    <c:set var="stockNum" value="${row.STOCK_NUM}" />
  </c:otherwise>
</c:choose>

<%--

  商品の情報を検索する
  [PRODUCT_INFO]テーブルから [PRODUCT_CODE], [PRODUCT_NAME],
  [CATEGORY_NAME], [MAKER_NAME], [DETAIL], [MATERIAL], [SIZE], [IMAGE],
  [PRICE] を [PRODUCT_CODE]の昇順で検索するSQL文。

--%>
<sql:query var="rs">
SELECT PRODUCT_CODE, PRODUCT_NAME, CATEGORY_NAME, MAKER_NAME, DETAIL, MATERIAL, SIZE, IMAGE, PRICE
  FROM PRODUCT_INFO WHERE PRODUCT_CODE=? ORDER BY PRODUCT_CODE;
<sql:param value="${formProductCode}" />
</sql:query>
<sql:query var="rs2">
SELECT COMMENT, SCORE
  FROM PRODUCT_REVIEW WHERE PRODUCT_CODE = ? ORDER BY ID DESC;
<sql:param value="${formProductCode}" />
</sql:query>
<%-- 一行目を変数rowに代入 --%>
<c:set var="row" value="${rs.rows[0]}" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<TITLE>詳細情報</TITLE>
<%--

  表示方法の設定

--%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BootstrapのCSS読み込み -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<TITLE>衣料品販売</TITLE>
<style>
  
  .evaluation{
    display: flex;
    flex-direction: row-reverse;
    justify-content: center;
    border-top:#ffcc00 2px solid;
  }
  .evaluation input[type='radio']{
    display: none;
  }
  .evaluation label{
    position: relative;
    padding: 10px 10px 0;
    color: gray;
    cursor: pointer;
    font-size: 50px;
  }
  .evaluation label .text{
    position: absolute;
    left: 0;
    top: 0;
    right: 0;
    text-align: center;
    font-size: 12px;
    color: gray;
  }
  .evaluation label:hover,
  .evaluation label:hover ~ label,
  .evaluation input[type='radio']:checked ~ label{
    color: #ffcc00;
  }
  .explain {
    font-family: serif;
  }
  .explain span{
    font-family: sans-serif;
  }
  .evaluation{
    float: left;
    padding-top: 30px;
  }
  table{
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
}

table tr{
  border-bottom: solid 1px #eee;
  cursor: pointer;
}

table tr:hover{
  background-color: #d4f0fd;
}

table th,table td{
  text-align: center;
  width: 25%;
  padding: 15px 0;
}

</style>
</head>
<BODY>
  <jsp:include page="header.jsp" flush="true" />

		<H2>詳細画面</H2>

  <%--

    詳細情報を出力する

  --%>
  <%-- 画像を出力 --%>
  <div class="container" style="margin-top: 100px;">
  <div class="row">
  <div class="col-4">
  <img src="image/${row.IMAGE}" style="max-height: 300px;"  /><BR>
  </div>
  <div class="col-8">
  
  <%-- メーカーを出力 --%>
  <div class="explain">
    <h2><span>製品情報</span></h2>
    <span>メーカー</span>：${row.MAKER_NAME}<BR>
    <%-- 製品名を出力 --%>
    <span>製品名</span>：${row.PRODUCT_NAME}<BR>
    <%-- 素材を出力 --%>
    <span>素材</span>：${row.MATERIAL}<BR>
    <%-- カテゴリを出力 --%>
    <span>カテゴリ</span>：${row.CATEGORY_NAME}<BR>
    <%-- 説明を出力 --%>
    <span>説明</span>：${row.DETAIL}<BR>

    <%-- 販売価格を出力 --%>
    <span>価格</span>：¥${row.PRICE}<BR><br>

  </div>


  <%--

    在庫数を確認して結果を表示する
    在庫数が1より少ないかどうかで在庫の確認を行っている

  --%>

  <c:choose>
    <c:when test="${stockNum < 1}">
  <%-- 商品の在庫が存在しない場合は、品切れの情報を出力する --%>
  申し訳ございません。${row.PRODUCT_NAME} は品切れです。<BR>
    </c:when>
    <c:otherwise>

    <FORM action="confirmation.jsp" method="POST">
      <input type="hidden" name="hiddenCode" value="${row.PRODUCT_CODE}" />
      <input type="hidden" name="hiddenPrice" value="${row.PRICE}" />
      <INPUT class="btn btn-warning" type="submit" name="buttonBuy" value="購入する">
    </FORM>
    
  </c:otherwise>
  </c:choose>
  <form type="get" action="review.jsp">
    <input type="hidden" name="hiddenCode" value="${row.PRODUCT_CODE}" />
    <div class="form-group">
      <div class="evaluation">
        <input id="star1" type="radio" name="score" value="5" />
        <label for="star1"><span class="text">最高</span>★</label>
        <input id="star2" type="radio" name="score" value="4" />
        <label for="star2"><span class="text">良い</span>★</label>
        <input id="star3" type="radio" name="score" value="3" />
        <label for="star3"><span class="text">普通</span>★</label>
        <input id="star4" type="radio" name="score" value="2" />
        <label for="star4"><span class="text">悪い</span>★</label>
        <input id="star5" type="radio" name="score" value="1" />
        <label for="star5"><span class="text">最悪</span>★</label>
      </div>
    </div>
    <div class="form-group">
      <textarea name="comment" class="form-control" rows="3" placeholder="使用した感想をお願いします♪"></textarea>
    </div>
    <INPUT class="btn btn-warning" type="submit" name="buttonSubmit" value="口コミを投稿">
</form>
  <TABLE>
    <TR>
      <TH>採点</TH>
      <TH>口コミ</TH>
    </TR>

      <c:forEach var="row" items="${rs2.rows}">

      <TR>
        <TD>${row.SCORE}</TD>
        <TD>${row.COMMENT}</TD>
      </TR>

      </c:forEach>
      
    </TABLE>
  </div>

  
</div>
</div>
</BODY>
</HTML>
