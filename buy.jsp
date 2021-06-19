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

<c:set var="formCode" value="${param.hiddenCode}" />

<c:set var="formPrice" value="${param.hiddenPrice}" />

<c:set var="formCustomerName" value="${param.customerName}" />

<c:set var="formName" value="${param.name}" />

<c:set var="formPassword" value="${param.password}" />
<sql:query var="rs">
SELECT *
  FROM USER_INFO WHERE NAME=?;
<sql:param value="${formName}" />
</sql:query>
<c:set var="row" value="${rs.rows[0]}" />
<sql:update>
INSERT INTO PURCHASE_HISTORY (PRODUCT_CODE,CUSTOMER_NAME,PURCHASE_DATE,PRODUCT_NUM,PRICE) VALUES(?, ?, ?, 1, ?);
<sql:param value="${formCode}" />
<sql:param value="${formCustomerName}" />
<sql:dateParam value="<%=new java.util.Date()%>" type="TIMESTAMP" />
<sql:param value="${formPrice}" />
</sql:update>
<sql:update>
UPDATE　PRODUCT_STOCK SET STOCK_NUM = STOCK_NUM-1   WHERE PRODUCT_CODE = ?;
<sql:param value="${formCode} " />
</sql:update>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<TITLE>購入結果</TITLE>
<STYLE type="text/css">
body {background-color:white;}
</STYLE>
<link href="css/buy.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<BODY>
<div class="container">
<jsp:include page="header.jsp" flush="true" />

<FONT size="3" color="#000000"><B>ご購入ありがとうございました。</B></FONT>

<BR>
<BR>


製品コード：${formCode}<BR>

購入価格：${formPrice}<BR>

顧客氏名：${formCustomerName}<BR>

お届け先：　${row.ADRESS}
</div>

</BODY>
</HTML>
