package com.ushan.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ushan.bean.ExpenseDetails;

public class ExpenseHistoryDAO extends HibernateDaoSupport{

	private String domainPakage = "com.ushan.bean.";
	public static Logger logger = Logger.getLogger(ExpenseHistoryDAO.class);
	
	public List<ExpenseDetails> getAllExpenseDetails(){
		logger.info("Enter to getAll ExpenseDetails");
		Criteria criteria = getSession().createCriteria(ExpenseDetails.class);
		List<ExpenseDetails> returnList = criteria.list();
		return returnList;
	}
}
