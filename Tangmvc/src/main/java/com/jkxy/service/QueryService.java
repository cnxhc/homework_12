package com.jkxy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jkxy.dao.QueryDao;
import com.jkxy.entity.Poets;

@Service
public class QueryService {
	@Resource
	QueryDao dao;
	public List<Poets> queryByPoet(String query_context,int start,int cnt) {
		List<Poets> poets=dao.selectByPoet(query_context,start,cnt);
		return poets;
	}
	public List<Poets> queryByTitle(String query_context) {
		List<Poets> poets=dao.selectByTitle(query_context);
		return poets;
	}

	public List<Poets> queryByContent(String query_context) {
		//String like_context="%"+query_context+"%";
		List<Poets> poets=dao.selectByContent(query_context);
		return poets;
	}

	public int getRowCountByPoet(String queryContext){
		return dao.getRowCountByPoet(queryContext);
	}


}
