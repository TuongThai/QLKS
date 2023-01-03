/**
 * 
 */
package com.hotel.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.hotel.dao.LoginDAO;
import com.hotel.model.EmployeeModel;

/**
 * @author Administrator
 *
 */
@Service
public class LoginService {
	
	private LoginDAO loginDAO;

	public LoginDAO getLoginDAO() {
		return loginDAO;
	}

	public void setLoginDAO(LoginDAO loginDAO) {
		this.loginDAO = loginDAO;
	}
	
	public EmployeeModel login(String taiKhoan, String matKhau) {

		// thiet lap cau truy van sql
		String queryString = "select r from EmployeeModel r where r.maNV = :taiKhoan and r.matKhau = :matKhau";

		// lay phong theo ma phong
		EmployeeModel employee = loginDAO.login(taiKhoan, matKhau, queryString);

		return employee;
	}
	
	public EmployeeModel checkCookie(HttpServletRequest request) {
		// lấy tất cả cookie từ request này
        Cookie [] cookies=request.getCookies();
        EmployeeModel account=null;
        String username="",  password="";
        // lặp lại từng cookie
        for (Cookie ck:cookies) {
        	//chỉ hiển thị cookie có tên 'username' và 'password'
            if(ck.getName().equalsIgnoreCase("username"))
                username=ck.getValue();
            if(ck.getName().equalsIgnoreCase("password"))
                password=ck.getValue();
        }
        //xem username và password không trống 
        if(!username.isEmpty() && !password.isEmpty())
            account= login(username, password);// thì nó gọi pt login kiểm tra đăng nhập
        return account;
    }
	
	public void setCookie(EmployeeModel employee, HttpServletResponse response) {
		// tạo cookie và lưu thông tin đăng nhập và thời gian sống là 3000s
		Cookie ckUsername=new Cookie("username",employee.getMaNV());
        ckUsername.setMaxAge(3000);
        response.addCookie(ckUsername);
        Cookie ckPassword=new Cookie("password",employee.getMatKhau());
        ckUsername.setMaxAge(3000);
        response.addCookie(ckPassword);
	}
}
