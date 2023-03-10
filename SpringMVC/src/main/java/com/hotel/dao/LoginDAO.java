package com.hotel.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.model.EmployeeModel;

/**
 * @author Tien
 *
 */
@Repository(value = "loginDAO")
@Transactional(rollbackFor = Exception.class)
public class LoginDAO {
	
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public EmployeeModel login(String taiKhoan, String matKhau, String queryString) {
	
		// lay session tu sessionFactory
		Session session = sessionFactory.getCurrentSession(); //tạo đối tượng session để thao tác với csdl

		// tao query
		Query<?> query = session.createQuery(queryString);// nhận dữ liệu vào
		//Thiết lập tham số
		query.setParameter("taiKhoan", taiKhoan);
		query.setParameter("matKhau", matKhau);

		// thực hiện kiểm tra
		EmployeeModel employee = (EmployeeModel) query.uniqueResult();

		return employee;
	}
}
