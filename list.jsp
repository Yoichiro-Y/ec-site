<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="utf-8" />
<c:set var="formCategory" value="${paramValues.category}" />
<%--

  データベースへのコネクションを取得

--%>
<sql:setDataSource driver="org.h2.Driver" url="jdbc:h2:sdev" />

<%--

  データベースからデータを取得して、変数rsに結果を入れる。

  [PRODUCT_INFO]テーブルから [PRODUCT_CODE], [PRODUCT_NAME],
  [CATEGORY_NAME], [MAKER_NAME], [DETAIL], [MATERIAL], [SIZE], [IMAGE],
  [PRICE] を [PRODUCT_CODE]の昇順で検索するSQL文。

--%>
<c:choose>
  <c:when test="${empty formCategory}">
    <sql:query var="rs">
      SELECT PRODUCT_CODE, PRODUCT_NAME, CATEGORY_NAME, MAKER_NAME, DETAIL, MATERIAL, SIZE, IMAGE, PRICE
      FROM PRODUCT_INFO ORDER BY PRODUCT_CODE DESC;
    </sql:query>
  </c:when>
  <c:otherwise>
    <sql:query var="rs">
     SELECT PRODUCT_CODE, PRODUCT_NAME, CATEGORY_NAME, MAKER_NAME, DETAIL, MATERIAL, SIZE, IMAGE, PRICE
     FROM PRODUCT_INFO WHERE CATEGORY_NAME=? ORDER BY PRODUCT_CODE;
     <sql:param value="${formCategory}" />
    </sql:query>
  </c:otherwise>
</c:choose>

<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BootstrapのCSS読み込み -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/list.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
<TITLE>衣料品販売</TITLE>
</HEAD>
<BODY>
  <jsp:include page="header.jsp" flush="true" />
	<CENTER>
      <H2>製品一覧</H2>
      <div class="row">
        <div class="col-3 position-fixed" id="sticky-sidebar">
            <ul>
              <li><a href="list.jsp" class="active bg-warning">カテゴリー</a></li>
              <li><a href="list.jsp?category=ジャケット">ジャケット</a></li>
              <li><a href="list.jsp?category=ボトムス">ボトムス</a></li>
              <li><a href="list.jsp?category=つなぎ">つなぎ</a></li>
              <li><a href="list.jsp?category=その他アイテム">その他アイテム</a></li>
            </ul>
        </div>
        <div class="col offset-3" id="main">
          <h4 class="title">製品一覧</h4>
          <div class="container">
            <c:forEach var="row" items="${rs.rows}">
              <FORM action="detail.jsp" method="POST">
                <div class="card my-3 item" style="width: 18rem">
                    <input type="hidden" name="selectedProductCode" value="${row.PRODUCT_CODE}">
                    <INPUT type="image" src="image/${row.IMAGE}" name="${row.PRODUCT_CODE}" class="item-image card-img-top">
                    <div class="card-body">
                      <p　class="card-title">${row.PRODUCT_NAME}</p>
                      <p　class="card-text">${row.MAKER_NAME}</p>
                      <p　class="card-text">¥${row.PRICE}</p>
                      <div class="circle-button">
                          <button class="btn btn-success">詳細</button>
                      </div>
                      </div>
                </div>
          　 </FORM>
            </c:forEach> <%-- rsのループ --%>
          </div>
        </div>
      </div>
	</CENTER>
</BODY>
</HTML>

