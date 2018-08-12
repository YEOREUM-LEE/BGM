package global.sesoc.lunch;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		
		return "home";
	}
	
	//로그인 상태면 메인메뉴로가기를 index로 보내고 중간에 로그아웃이 되면 처음 화면으로 보낸다.
	@RequestMapping(value="goMain",method=RequestMethod.GET)
	public String goMain(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String loginid=(String)session.getAttribute("loginid");
		if(loginid!=null)
		return "index";
		else
			return "redirect:/";
	}
	
	
	public String TestMethod() {
	System.out.println("테스트 메소드");
		return "22";
	}
	

	public String TestMethod2() {
		return "112";
	}
	

	
	
	
}
