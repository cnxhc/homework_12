<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全唐诗主页面</title>
</head>
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/Tangmvc/css/style.css" />
<body>
	<div class="content">
		<img alt="图片"
			src="http://localhost:8080/Tangmvc/image/main_top_bg.png">
		<div class="context">
			<form action="query.html" method="post">
				<select name="query_method">
					<option value="poet">作者</option>
					<option value="title">诗词名称</option>
					<option value="content">诗词名句</option>
				</select> <input type="text" name="query_context" required="required">
				<input type="submit">
			</form>
		</div>
	</div>
</body>
</html>