package com.test.loginEx;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 회원가입 컨트롤러
 */
@Controller
public class CustomerJoinContoller {
	
//	CustomerDAO dao = CustomerDAO.getInstance();
	@Autowired
	CustomerDAO dao;
	
	// 회원가입폼으로...
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String joinForm() {
		return "joinForm";
	}
	
	// 회원가입처리
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(Customer customer, Model model, HttpSession session) {
		int result = dao.insert(customer);
		if (result != 1) {
			model.addAttribute("errorMsg", "가입 실패");
			return "joinForm";
		} else {
			session.setAttribute("customer", customer);
		}
		return "redirect:/joinComplete";
	}
	
	// 회원가입완료
	@RequestMapping(value="joinComplete", method=RequestMethod.GET)
	public String join(Model model, HttpSession session) {
		// 세션확인
		Customer customer = (Customer) session.getAttribute("customer");
		if (customer != null) {
			// 가입이 처리된 VO를 모델에 담아 다음페이지로 이동시키는 것
			model.addAttribute("custId", customer.getCustid());
			// 세션 해제
			session.invalidate();
		} else {
			return "redirect:/";
		}
		return "joinComplete";
	}

	// ID체크폼으로...
	@RequestMapping(value="idcheck", method=RequestMethod.GET)
	public String idcheckForm(Model model) {
		// 검색 전후 확인용
		model.addAttribute("search", false);
		return "idcheck";
	}
	
	// ID체크 처리
	@RequestMapping(value="idcheck", method=RequestMethod.POST)
	public String idcheck(String searchId, Model model) {
		// ID를 검색하고
		Customer cust = dao.get(searchId);
		// 검색 ID와 검색 결과, 그리고 검색 확인용 값을 저장
		model.addAttribute("searchId", searchId);
		model.addAttribute("searchResult", cust);
		model.addAttribute("search", true);
		return "idcheck";
	}
}
