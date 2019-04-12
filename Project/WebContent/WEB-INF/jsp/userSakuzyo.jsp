<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ削除確認</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/UserSakuzyo.css">

</head>
<body>
	<nav class="navbar navbar-dark bg-dark">
		<a class="navbar-brand" href="#">${userInfo.name }さん</a> <a href="LogoutB"
			class="btn-border-bottom">ログアウト</a>
	</nav>

	<h1 class=USER_sakuzyo>ユーザ削除確認</h1>
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<div>
					<p>ログインID::${user.loginId }</p>
					<p>を本当に削除してもよろしいでしょうか。
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 text-center">
				<a href="UserListB" type="submit">キャンセル</a>
			</div>

			<form action="DeleteB" method="post">
				<!--hiddenは画面上には出ないが情報を受け渡したいときに使う  -->
				<input type="hidden" name="loginId" value="${user.loginId}">


				<div class="col-md-6  text-center">
					<input type="submit" value="OK">
				</div>
			</form>
		</div>
	</div>
</body>
</html>