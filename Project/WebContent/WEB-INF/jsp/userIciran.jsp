<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ一覧</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/UserIciran.css">
</head>

<body>

	<nav class="navbar navbar-dark bg-dark">

		<!-- LoginBサーブレットのセッションを見る -->
		<a class="navbar-brand" href="#">${userInfo.name }さん</a> <a
			href="LogoutB" class=" btn-border-bottom">ログアウト</a>
	</nav>

	<!--clsaaはcssの.User_Itiranに合わせる  -->
	<h1 class="User_itiran">ユーザ 一覧</h1>
	<c:if test="${errMsg != null}">
		<div class="alert alert-danger" role="alert">${errMsg}</div>
	</c:if>
	<div align="right">
		<p>
			<a href="CreateB" class="btn-border-bottom">新規登録</a>
		</p>
	</div>

	<div class="container">

		<form action="UserListB" method="post">
			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">ログインID</label>
				<div class="col-sm-10">
					<input type="text" name="loginId" class="form-control" id="staticEmail">
				</div>
			</div>

			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">ユーザ名</label>
				<div class="col-sm-10">
					<input type="text" name="name" class="form-control" id="staticEmail">
				</div>
			</div>

			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">生年月日</label>
				<div class="col-sm-10">
					<input type="date" name="birthDate" value="1800/01/01">～ <input
						type="date" name="birthDate1" value="1800/01/01">
				</div>
			</div>







			<div class="row">
				<div class="col-md-12 text-center">
					<input type="submit" value="検索">
				</div>
			</div>
		</form>


		<table class="table">
			<thead>
				<tr>
					<th scope="col">ユーザID</th>
					<th scope="col">ユーザ名</th>
					<th scope="col">生年月日</th>
					<th scope="col">詳細・更新・削除</th>
				</tr>
			</thead>

			<tbody>

				<c:forEach var="user" items="${usericiran}">
					<tr>
						<td>${user.loginId }</td>
						<td>${user.name }</td>
						<td>${user.birthDate }</td>

						<!-- 管理者でログインしている場合、詳細・更新・削除を表示 -->
						<c:if test="${userInfo.loginId == 'admin'}">
							<td>
								<!--詳細(サーブレット)  --> <a class="btn btn-primary"href="MoredetailB?id=${user.id}">詳細</a>
								 <!--更新(サーブレットの )--> <a class="btn btn-success" href="UpdateB?id=${user.id}">更新</a>
								 <!--削除(サーブレット  )--><a class="btn btn-danger" href="DeleteB?id=${user.id}">削除</a>
							</td>
						</c:if>
						<!-- 一般ユーザでログインしているかつ、自分の情報の場合、詳細・更新を表示  -->
						<c:if
							test="${userInfo.loginId != 'admin' && userInfo.loginId == user.loginId}">
							<td>
								<!--詳細(サーブレット)  --> <a class="btn btn-primary"href="MoredetailB?id=${user.id}">詳細</a>
								 <!--更新(サーブレット  )--> <a class="btn btn-success" href="UpdateB?id=${user.id}">更新</a>
							</td>
						</c:if>
						<!-- 一般ユーザでログインしているかつ、自分ではない情報の場合、詳細を表示、 -->
						<c:if
							test="${userInfo.loginId != 'admin' && userInfo.loginId != user.loginId}">
							<td><a class="btn btn-primary"href="MoredetailB?id=${user.id}">詳細</a></td>
						</c:if>

						<!--GetParameterのリンク　これで個々のボタンが繋がる  -->
						<!-- <td>
						<a class="btn btn-primary"href="MoredetailB?id=${user.id}">詳細</a>
						<a class="btn btn-success" href="UpdateB?id=${user.id}">更新</a>
						<a class="btn btn-danger" href="DeleteB?id=${user.id}">削除</a>
						</td> -->
					</tr>
				</c:forEach>


			</tbody>

		</table>
	</div>
</body>
</html>