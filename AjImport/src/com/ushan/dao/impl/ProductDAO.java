package com.ushan.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ushan.bean.Product;


public class ProductDAO extends HibernateDaoSupport {
	private String domainPakage = "com.ushan.bean.";
	public static Logger logger = Logger.getLogger(ProductDAO.class);
	
	public void add(Product product){
		Transaction tr = getSession().beginTransaction();
		logger.info("Enter to Create Product");
		getSession().save(product);
		tr.commit();
	}
	
	public List<Product> getAllProducts(){
		logger.info("Enter to getAll Products");
		/*Criteria criteria = getSession().createCriteria(Product.class);
		criteria.add(Restrictions.eq("date", product.getDate()));
		return criteria.list();*/
		Query query = null;
		List<Product> productList = null;
		try {
			String queryString = "SELECT product FROM "+domainPakage+"Product product";
			query = getSession().createQuery(queryString);
			productList = query.list();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return productList;
	}
}
