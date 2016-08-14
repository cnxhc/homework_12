package com.jkxy.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jkxy.common.PageParam;
import com.jkxy.entity.Poets;
import com.jkxy.service.QueryService;

@Controller
public class QueryController {
	@Resource
	QueryService queryService;

	@RequestMapping(value = "query")
	public String query(HttpServletRequest request) {
		String query_method = request.getParameter("query_method");
		String query_context = request.getParameter("query_context");
		String currPageStr = request.getParameter("page");
		int currPage = 1;
		try {
			currPage = Integer.parseInt(currPageStr);
		} catch (Exception e) {

		}
		/*try {
			query_context = new String(query_context.getBytes("iso8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		// 获取总记录数
		int rowCount = queryService.getRowCountByPoet(query_context);
		System.out.println(rowCount);
		System.out.println(query_context);
		if (query_method.equals("poet")) {
			List<Poets> poets = queryService.queryByPoet(query_context, (currPage - 1) * PageParam.getPageSize(),
					PageParam.getPageSize());
			if (poets.size() > 0) {
				PageParam pageParam = new PageParam();
				pageParam.setRowCount(rowCount);
				if (pageParam.getTotalPage() < currPage) {
					currPage = pageParam.getTotalPage();
				}
				pageParam.setCurrPage(currPage);

				// pageParam.setData(poets);
				request.setAttribute("pageParam", pageParam);
				request.setAttribute("poets", poets);
				return "queryByPoet_success";
			} else {
				return "fail";
			}
		} else if (query_method.equals("title")) {
			List<Poets> poets = queryService.queryByTitle(query_context);
			request.setAttribute("poets", poets);
			if (poets.size() > 0) {
				return "queryByTitle_success";
			} else {
				return "fail";
			}
		} else if (query_method.equals("content")) {
			List<Poets> poets = queryService.queryByContent(query_context);
			request.setAttribute("poets", poets);
			if (poets.size() > 0) {
				return "queryByContent_success";
			} else {
				return "fail";
			}
		}
		return "";
	}
}
