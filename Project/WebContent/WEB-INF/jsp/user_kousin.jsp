<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href=css/"USER_kousin.css">

</head>
<body>
	<nav class="navbar navbar-dark bg-dark">
		<a class="navbar-brand" href="#">ユーザ名さん</a> <a href="#"
			class="btn-border-bottom">ログアウト</a>
	</nav>

	<h1 class="USER_kousin">ユーザ情報更新</h1>

	<div class="container">

		<form>

			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">ユーザID</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="staticEmail"
						value=id0001>
				</div>
			</div>

			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">パソワード</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputPassword"
						placeholder="Password">
				</div>
			</div>


			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">パスワード（確認）</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputPassword"
						placeholder="Password">
				</div>
			</div>

			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">ユーザ名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="staticEmail" value=緋村剣心>
				</div>
			</div>

			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">生年月日</label>
				<div class="col-sm-10">
					<input type="date" class="form-control" name="example"
						value="1800/01/01">
				</div>
			</div>




		</form>



		<div align="center">
			<input type="button" value="更新">
		</div>

		<a href="#" class="btn-border-bottom">戻る</a>
	</div>
</body>
</html>