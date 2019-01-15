package com.test.loginEx;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerLoginController {
	@Autowired
	CustomerDAO dao;
	
	// 로그인폼으로...
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	
	// 로그인 처리
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String idcheck(String id, String password, 
			Model model, HttpSession session) {
		// ID와 PW로 검색을 하고 그 결과를 토대로
		Customer cust = dao.get(id);
		if (cust != null && cust.getPassword().equals(password)) {
			// 로그인 정보 세션에 저장
			session.setAttribute("loginId", cust.getCustid());
			session.setAttribute("loginName", cust.getName());
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "로그인 실패!!");
			return "loginForm";
		}
	}
	
	// 로그아웃
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate(); // 세션해제
		return "redirect:/";
	}
}
