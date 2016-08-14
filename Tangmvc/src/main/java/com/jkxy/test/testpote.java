package com.jkxy.test;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.jkxy.entity.Poets;



public class testpote {
	public static void main(String[] args) {
		String resource="mybatis/config.xml";
		Reader reader=null;
		SqlSession session;
		try {
			reader=Resources.getResourceAsReader(resource);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		SqlSessionFactory sqlMapper=new SqlSessionFactoryBuilder().build(reader);
		session=sqlMapper.openSession();
		try {
			List<Poets> ap=session.selectList("selectByPoet");
			
			for(Poets temp:ap){
				/*System.out.println("作者真实姓名="+temp.getRealName()+
				",对应的用户名="+temp.getJikeUser().getUserName()); */
				
				System.out.println("作者真实姓名="+temp.getName());
				System.out.println("懒加载应用了");
				System.out.println("用户名="+temp.getPoetries().getTitle());
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.close();
		}
	}

}
