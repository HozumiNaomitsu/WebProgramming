<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>ユーザ新規登録</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/UserSinki.css">

</head>

<body>
	<nav class="navbar navbar-dark bg-dark">
		<a class="navbar-brand" href="#">${userInfo.name }さん</a> <a href="LogoutB"
			class="btn-border-bottom">ログアウト</a>
	</nav>


	<h1 class="User_new">ユーザ新規登録</h1>



	<div class="container">
		<c:if test="${errMsg != null}">
			<div class="alert alert-danger" role="alert">${errMsg}</div>
		</c:if>

		<form action="CreateB" method="post">


			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">ログインID</label>
				<div class="col-sm-10">

					<!-- nameは必ず必要！ないと値を受け渡せない -->
					<input type="text" name="loginId" class="form-control" size="25"
						maxlength="20" value="${loginId}">
				</div>
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
						<input type="text" name="name" class="form-control" size="25"
							maxlength="20" value="${name}">
					</div>
				</div>

				<div class="form-group row">
					<label for="staticEmail" class="col-sm-2 col-form-label">生年月日</label>
					<div class="col-sm-10">
						<input type="date" name=birthDate class="form-control"
							value="${birthDate }">
					</div>
				</div>
				<input type="submit" value="登録">
		</form>
	</div>
	<a href="UserListB" class="btn-border-bottom">戻る</a>


</body>

</html>
