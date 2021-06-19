<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<sql:setDataSource driver="org.h2.Driver" url="jdbc:h2:sdev" />


<sql:query var="rs">
SELECT PRODUCT_CODE, PRODUCT_NAME, CATEGORY_NAME, MAKER_NAME, DETAIL, MATERIAL, SIZE, IMAGE, PRICE
  FROM PRODUCT_INFO ORDER BY PRODUCT_CODE;
</sql:query>

<HTML style="background-color: white;">
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BootstrapのCSS読み込み -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
<TITLE>衣料品販売</TITLE>
</HEAD>
<BODY>
	<div class="container" style="padding-top: 200px;">
	<div class="row">
	<jsp:include page="header.jsp" flush="true" />
	<div class="col-8">
		<h3>購入履歴確認</h3><br>
		<form  action="history.jsp" method="post">
			<div class="form-group">
				<label for="name">ユーザー名</label>
				<input class="form-control" type="text"name="name" placeholder="ユーザー名" />
			</div>
			<div class="form-group">
				<label for="password">パスワード</label>
				<input class="form-control" type="text" id="password" name="password" placeholder="パスワード（数字）" />
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