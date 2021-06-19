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
<%-- 製品コードを変数[formCode]に格納する --%>
<c:set var="formCode" value="${param.hiddenCode}" />
<%-- 価格を変数[formPrice]に格納する --%>
<c:set var="formScore" value="${param.score}" />
<%-- [購入者]を変数[formCustomerName]に格納する --%>
<c:set var="formComment" value="${param.comment}" />
<%--

  口コミテーブルからのデータの取得

  [PRODUCT_REVIEW]テーブルから前ページで選択したリンクと一致する商品の
  [COMMENT],[SCORE]を検索するSQL文

--%>
<sql:update>
  INSERT INTO PRODUCT_REVIEW (PRODUCT_CODE, COMMENT, SCORE) VALUES (?, ?, ?);
  <sql:param value="${formCode}" />
  <sql:param value="${formComment}" />
  <sql:param value="${formScore}" />
</sql:update>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="refresh" content="1;URL=list.jsp">
<TITLE>口コミ</TITLE>
</head>
<BODY bgcolor="#FFFFFF">
<jsp:include page="header.jsp" flush="true" />


<h1>レビュー投稿ありがとうございます！！</h1>

</BODY>
</html>
