<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>ログイン画面</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/UserLogin.css">

</head>

<body>
	<h1 class="Login">ログイン画面</h1>
	<div class="container">

		<c:if test="${errMsg != null}">
			<div class="alert alert-danger" role="alert">${errMsg}</div>
		</c:if>

		<form action="LoginB" method="post">
			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">ログインID</label>
				<div class="col-sm-10">
					<input type="text" name="loginId" class="form-control" size="30"
						maxlength="30">
				</div>
			</div>

			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">パスワード</label>
				<div class="col-sm-10">
					<input type="password" name="password" class="form-control"
						id="inputPassword" placeholder="Password">
				</div>
			</div>


			<div align="center">
				<input type="submit" value="ログイン">
			</div>
		</form>
	</div>
</body>
</html>