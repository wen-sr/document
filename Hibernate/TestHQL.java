package org.tarena.test;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.junit.Test;
import org.tarena.entity.Account;

public class TestHQL {
	//查询所有账务账号信息
	//select * from ACCOUNT
	@Test
	public void test1(){
		String hql = "from Account";
		Session session = HibernateUtil.openSession();
		Query query = session.createQuery(hql);
		//如果查询出多条结果
		List<Account> list = query.list();
		for(Account a : list){
			System.out.println(a.getId()+" "+a.getRealName()+" "+a.getIdcardNo());
		}
		session.close();
	}
	
	//按真实名模糊查询
	//select * from ACCOUNT 
	//where REAL_NAME like ?
	@Test
	public void test2(){
//		String hql = "from Account " +
//				"where realName like ?";
		String hql = "from Account " +
			"where realName like :name";
		Session session = HibernateUtil.openSession();
		Query query = session.createQuery(hql);
		//设置查询参数
//		query.setString(0, "zhang%");//从0开始表示第一个？
		query.setString("name", "zhang%");
		//如果查询出多条结果
		List<Account> list = query.list();
		for(Account a : list){
			System.out.println(a.getId()+" "+a.getRealName()+" "+a.getIdcardNo());
		}
		session.close();
	}
	
	//查询部分字段
	//select ID,REAL_NAME,IDCART_NO from ACCOUNT
	@Test
	public void test3(){
		String hql = "select id,realName,idcardNo " +
				"from Account";
		Session session = HibernateUtil.openSession();
		Query query = session.createQuery(hql);
		//部分查询，默认采用Object[]封装一行记录的字段值
		List<Object[]> list = query.list();
		for(Object[] objs : list){
			System.out.println(objs[0]+" "+objs[1]+" "+objs[2]);
		}
		session.close();
	}
	
	//查询部分字段
	//select ID,REAL_NAME,IDCART_NO from ACCOUNT
	@Test
	public void test4(){
		String hql = "select " +
				"new Account(id,realName,idcardNo) " +
				"from Account";
		Session session = HibernateUtil.openSession();
		Query query = session.createQuery(hql);
		//部分查询，采用指定的Account构造方法封装一行记录的字段值
		List<Account> list = query.list();
		for(Account a : list){
			System.out.println(a.getId()+" "+a.getRealName()+" "+a.getIdcardNo());
		}
		session.close();
	}
	
}
