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

<c:set var="formName" value="${param.name}" />

<sql:query var="rs">
SELECT *
  FROM PURCHASE_HISTORY WHERE CUSTOMER_NAME=?;
<sql:param value="${formName}" />
</sql:query>
<c:set var="row" value="${rs.rows}" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<TITLE>購入した商品</TITLE>
<STYLE type="text/css">
body {background-color:white;}
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
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<h3>購入履歴</h3>
<BODY>
    <TABLE>
        <TR>
          <TH>商品コード</TH>
          <TH>購入日</TH>
        </TR>
    
          <c:forEach var="row" items="${rs.rows}">
    
          <TR>
            <TD>${row.PRODUCT_CODE}</TD>
            <td>${row.PURCHASE_DATE}</td>
          </TR>
    
          </c:forEach>
          
        </TABLE>

<BR>
<BR>

</BODY>
</HTML>
