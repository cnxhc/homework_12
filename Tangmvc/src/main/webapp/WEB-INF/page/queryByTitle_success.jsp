<%@page import="com.jkxy.entity.Poets"%>
<%@page import="com.jkxy.entity.Poetries"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>显示诗词信息</title>
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/Tangmvc/css/style.css" />
</head>
<body>
	<div class="content">
		<img alt="图片"
			src="http://localhost:8080/Tangmvc/image/main_top_bg.png">
		<div class="context">
			<h1>查询内容</h1>
			<center>
				<table>
					<tr style="background: #ccccca">
						<td style="width: 80px; text-align: center;">诗人名</td>
						<td style="width: 180px; text-align: center;">诗词名称</td>
						<td style="width: 500px; text-align: center;">诗词内容</td>
					</tr>
					<c:forEach items="${poets}" var="item">
						<c:forEach items="${item.poetries}" var="subItem">
							<tr style="background: #f0f8ff">
								<td style="text-align: center;">${item.name}</td>
								<td style="text-align: center;"><<${subItem.title}>><br /></td>
								<td style="text-align: center;">${subItem.content}<br /></td>
							</tr>
						</c:forEach>
					</c:forEach>
				</table>
			</center>
		</div>
	</div>
</body>
</html>