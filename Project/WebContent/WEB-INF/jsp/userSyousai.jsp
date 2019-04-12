<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>ユーザ情報詳細</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/UserSyousai.css">

</head>

<body>
	<nav class="navbar navbar-dark bg-dark">
		<a class="navbar-brand" href="#">${userInfo.name }さん</a> <a href="LogoutB"
			class="btn-border-bottom">ログアウト</a>
	</nav>

	<h1 class="USER_syousai">ユーザ情報詳細</h1>

	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<form>

					<div class="form-group row">
						<label for="staticEmail" class="col-sm-2 col-form-label">ユーザID</label>
						<div>
							<input type="text" name="loginId" readonly
								class="form-control-plaintext" id="staticEmail" value="${user.loginId }">
						</div>
					</div>

					<div class="form-group row">
						<label for="staticEmail" class="col-sm-2 col-form-label">ユーザ名</label>
						<div class="col-sm-10">
							<input type="text" name="name" readonlya
								class="form-control-plaintext" value="${user.name }">
						</div>
					</div>

					<div class="form-group row">
						<label for="staticEmail" class="col-sm-2 col-form-label">生年月日</label>
						<div class="col-sm-10">
							<input type="date" name="birthDate" readonly
								class="form-control-plaintext" value="${user.birthDate }">
						</div>
					</div>

					<div class="form-group row">
						<label for="staticEmail" class="col-sm-2 col-form-label">登録日時</label>
						<div class="col-sm-10">
							<input type="text" name="createDate" readonly
								class="form-control-plaintext" value="${user.createDate }">
						</div>
					</div>

					<div class="form-group row">
						<label for="staticEmail" class="col-sm-2 col-form-label">更新日時</label>
						<div class="col-sm-10">
							<input type="text" name="updateDate" readonly
								class="form-control-plaintext" value="${user.updateDate  }">
						</div>
					</div>
				</form>
			</div>
		</div>
<!-- hrefは戻るから表示先のサーブレット名 -->
		<a href="UserListB" class="btn-border-bottom">戻る</a>
	</div>
</body>

</html>