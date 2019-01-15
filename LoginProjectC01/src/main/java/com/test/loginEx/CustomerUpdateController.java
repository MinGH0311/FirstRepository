package com.test.loginEx;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerUpdateController {
	
	@Autowired
	CustomerDAO dao;
	
	// 업데이트 화면으로...
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(Model model, HttpSession session) {
		if (session.getAttribute("loginId") == null) {
			model.addAttribute("errorMsg", "세션 끊김");
			return "updateForm";
		}
		String id = (String) session.getAttribute("loginId");
		Customer cust = dao.get(id);
		model.addAttribute("customer", cust);
		return "updateForm";
	}

	// 개인정보 수정을 실행하는 메서드
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(Customer customer, Model model, HttpSession session) {
		if (session.getAttribute("loginId") == null) {
			model.addAttribute("errorMsg", "세션 끊김");
			return "updateForm";
		}
		String id = (String) session.getAttribute("loginId");
		customer.setCustid(id);
		int result = dao.update(customer);

		model.addAttribute("customer", dao.get(id));
		
		if (result != 1) {
			// 수정실패
			model.addAttribute("errorMsg", "수정 실패");
			return "updateForm";
		} else {
			// 수정성공
			return "updateComplete";
		}
	}
}
