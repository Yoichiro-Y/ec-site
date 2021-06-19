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

  詳細画面で入力した値を取得する

--%>
<fmt:requestEncoding value="utf-8" />
<%-- 製品コードを変数[formCode]に格納する --%>
<c:set var="formCode" value="${param.hiddenCode}" />
<%-- 価格を変数[formPrice]に格納する --%>
<c:set var="formPrice" value="${param.hiddenPrice}" />
<%-- [購入者]を変数[formCustomerName]に格納する --%>
<c:set var="formCustomerName" value="${param.customerName}" />
<sql:query var="rs">
SELECT PRODUCT_CODE, PRODUCT_NAME, CATEGORY_NAME, MAKER_NAME, DETAIL, MATERIAL, SIZE, IMAGE, PRICE
  FROM PRODUCT_INFO WHERE PRODUCT_CODE=? ORDER BY PRODUCT_CODE;
<sql:param value="${formCode}" />
</sql:query>
<c:set var="row" value="${rs.rows[0]}" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/buy.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<BODY>
<div class="container">
<div class="row">
<jsp:include page="header.jsp" flush="true" />
<h3>購入内容確認</h3>
<div class="col-4">
    <img src="image/${row.IMAGE}" style="max-height: 300px; padding-top: 50px;"  /><BR>
    
　　製品コード：${formCode}<BR><br>

    製品名: ${row.PRODUCT_NAME}<br>

    購入価格：${formPrice}<BR>
    
</div>
<div class="col-8">
    <form  action="buy.jsp" method="post">
        <input type="hidden" name="hiddenCode" value="${row.PRODUCT_CODE}" />
     　 <input type="hidden" name="hiddenPrice" value="${row.PRICE}" />
        <div class="form-group">
            <label for="name">ユーザー名</label>
            <input class="form-control" type="text"name="name" placeholder="ユーザー名" />
        </div>
        <div class="form-group">
            <label for="password">パスワード</label>
            <input class="form-control" type="text" id="password" name="password" placeholder="パスワード（数字）" />
        </div>
        <div class="form-group">
            <label for="name">お届け先氏名</label>
            <input class="form-control" type="text"name="customerName" placeholder="お届け先氏名" />
        </div>
        <div class="form-group">
            <input class="btn btn-success" type="submit" value="購入確定">
        </div>
     </form>
</div>
<BR>
<BR>
</div>
</div>
</BODY>
</HTML>