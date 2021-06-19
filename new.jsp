<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<sql:setDataSource driver="org.h2.Driver" url="jdbc:h2:sdev" />

<HTML style="background-color: white;">
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BootstrapのCSS読み込み -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/new.css" rel="stylesheet">

<TITLE>衣料品販売</TITLE>
</HEAD>
<jsp:include page="header.jsp" flush="true" />
<body style="padding-top: 100px;">
<div class="container">
    <div class="row">
        <div class="col">
            <form  action="create.jsp" method="post">
                <h1>顧客情報登録</h1>
                <div class="form-group">
                    <label for="name">ユーザー名</label>
                    <input class="form-control" type="text" id="ccname" name="name" placeholder="ユーザー名" />
                </div>
                <div class="form-group">
                    <label for="password">パスワード</label>
                    <input class="form-control" type="text" id="password" name="password" placeholder="パスワード（数字）" />
                </div>
                <div class="form-group">
                    <label for="address">住所</label>
                    <input class="form-control" type="text" id="password" name="adress" placeholder="住所" />
                </div>
                <div class="form-group">
                <label for="cardname">カード名義</label>
                <input class="form-control" type="text" name="cardName" placeholder="Full Name" />
                </div>
            
                <div　class="form-group">
                <label for="cardnumber">カード番号</label>
                <input class="form-control" type="tel" name="cardNumber"  placeholder="**** **** **** ****" size="18" />
                </div>
                <div　class="form-group">
                   
                </div>
                <div　class="form-group">
                    <label for="cvc">CVC</label>
                    <input class="form-control" type="tel" id="cvc" name="cvc" autocomplete="cc-csc" placeholder="123" size="5" />
                </div>
                <br>
                <div class="form-group" style="margin-left:170px;">
                <label for="ccmonth">有効期限</label>
                <select name="month"  id="ccmonth" autocomplete="cc-exp-month">
                    <option>MM</option>
                    <option value="01">01</option>
                    <option  value="02">02</option>
                    <option value="03">03</option>
                    <option value="04">04</option>
                    <option value="05">05</option>
                    <option value="06">06</option>
                    <option value="07">07</option>
                    <option value="08">08</option>
                    <option value="09">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>
                / 
                <select name="year" id="ccyear" autocomplete="cc-exp-year">
                    <option>YYYY</option>
                    <option value="2020">2020</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                </select>
                </div>
                <div class="form-group" style="margin-left:170px;">
                   <input class="btn btn-success" type="submit" value="登録">
                </div>
            </form>
     </div>
     </div>
</div>
</body>

  </html>