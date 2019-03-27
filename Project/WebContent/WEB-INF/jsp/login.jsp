<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>title</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/Login.css">

</head>

<body>
	<h1 class="Login">ログイン画面</h1>
	<div class="container">

		<form>
			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">ログインID</label>
				<div class="col-sm-10">
					<input type="text"  class="form-control"  name="example2" size="30" maxlength="30"
						value="input">
				</div>
			</div>

			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">パスワード</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputPassword"
						placeholder="Password">
				</div>
			</div>
		</form>
	</div>


	<div align="center">
		<input type="submit" value="ログイン">
	</div>

</body>
</html>