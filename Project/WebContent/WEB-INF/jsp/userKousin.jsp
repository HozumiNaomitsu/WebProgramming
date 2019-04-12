<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ情報更新</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/UserKousin.css">

</head>
<body>
	<nav class="navbar navbar-dark bg-dark">
		<a class="navbar-brand" href="#">${userInfo.name }さん</a> <a
			href="LogoutB" class="btn-border-bottom">ログアウト</a>
	</nav>

	<h1 class="USER_kousin">ユーザ情報更新</h1>

	<div class="container">

		<c:if test="${errMsg != null}">
			<div class="alert alert-danger" role="alert">${errMsg}</div>
		</c:if>


		<form action="UpdateB" method="post">

			<!--hiddenは画面上には出ないが情報を受け渡したいときに使う  -->
			<input type="hidden" name="loginId" value="${user.loginId}">

			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">ユーザID</label>
				<div class="col-sm-10">${user.loginId}</div>
			</div>


				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">パスワード</label>
					<div class="col-sm-10">
						<input type="password" name="password" class="form-control"
							id="inputPassword" placeholder="Password">
					</div>
				</div>


				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">パスワード（確認）</label>
					<div class="col-sm-10">
						<input type="password" name="password2" class="form-control"
							id="inputPassword" placeholder="Password">
					</div>
				</div>
			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">ユーザ名</label>
				<div class="col-sm-10">
					<input type="text" name="name" class="form-control"
						value="${user.name}">
				</div>
			</div>

			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">生年月日</label>
				<div class="col-sm-10">
					<input type="date" name="birthDate" class="form-control"
						name="example" value="${user.birthDate}">
				</div>
			</div>





			<div align="center">
				<input type="submit" value="更新">
			</div>
		</form>
		<a href="UserListB" class="btn-border-bottom">戻る</a>
	</div>

</body>
</html>