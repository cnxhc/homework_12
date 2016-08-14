package com.jkxy.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jkxy.common.PageParam;
import com.jkxy.entity.Poets;


@Repository
public interface QueryDao {
	//分页
	//List<Poets> selectByPoet(String query_context, PageParam pageParam);
	List<Poets> selectByPoet(String query_context,int start,int cnt);
	List<Poets> selectByTitle(String query_context);

	List<Poets> selectByContent(String query_context);

	int getRowCountByPoet(String query_context);
}
