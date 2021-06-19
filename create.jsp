<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--

  データベースへのコネクションを取得

--%>
<sql:setDataSource driver="org.h2.Driver" url="jdbc:h2:sdev" />

<fmt:requestEncoding value="utf-8" />
<%-- リンクで渡されたパラメータを、変数 formCode に格納する --%>
<%-- (1) --%>
<fmt:requestEncoding value="utf-8" />
<c:set var="formName" value="${param.name}" />
<c:set var="formPass" value="${param.password}" />
<c:set var="formAdress" value="${param.adress}" />
<c:set var="formCardName" value="${param.cardName}" />
<c:set var="formCardNumber" value="${param.cardNumber}" />
<c:set var="formCvc" value="${param.cvc}" />
<c:set var="formYear" value="${param.year}" />
<c:set var="formMonth" value="${param.month}" />

<sql:update>
  INSERT INTO USER_INFO (NAME, PASSWORD, ADRESS, CARD_NAME, CARD_NUMBER, CVC, EXPIRED_YEAR, EXPIRED_MONTH ) VALUES (?,?,?,?,?,?,?,?);
  <sql:param value="${formName}" />
  <sql:param value="${formPass}" />
  <sql:param value="${formAdress}" />
  <sql:param value="${formCardName}" />
  <sql:param value="${formCardNumber}" />
  <sql:param value="${formCvc}" />
  <sql:param value="${formYear}" />
  <sql:param value="${formMonth}" />
</sql:update>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="refresh" content="1;URL=list.jsp">
<TITLE>口コミ</TITLE>
</head>
<BODY bgcolor="#FFFFFF">

<h1>登録ありがとうございます！！</h1>

</BODY>
</html>
