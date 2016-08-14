<%@page import="com.jkxy.entity.Poets"%>
<%@page import="com.jkxy.common.PageParam"%>
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
						<!-- <td style="width: 500px; text-align: center;">诗词内容</td> -->
					</tr>
					<c:forEach items="${poets}" var="item">
						<c:forEach items="${item.poetries}" var="subItem">
							<tr style="background: #f0f8ff">
								<td style="text-align: center;">${item.name}</td>
								<td style="text-align: center;"><<${subItem.title }>><br /></td>
							</tr>
						</c:forEach>
					</c:forEach>
				</table>

				 <span>第</span>
						<%
							PageParam pageParam = (PageParam)request.getAttribute("pageParam");
							String query_context=request.getParameter("query_context");
							//query_context=new String(query_context.getBytes("iso8859-1"),"utf-8");
							int currPage = pageParam.getCurrPage();
							int totalPage = pageParam.getTotalPage();
							for(int i = 1; i <= totalPage; i ++){
								if(i == currPage){
									%><span class="current"><%=currPage %></span><%
								}else{
									%><a href="query.html?query_context=<%=query_context%>&query_method=poet&page=<%=i %>"><%=i %></a><%
								}
								
							}
						%>
						<span>页</span> 
			</center>
		</div>
	</div>
</body>
</html>