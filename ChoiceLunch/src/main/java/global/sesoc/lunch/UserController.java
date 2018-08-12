package global.sesoc.lunch;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.lunch.dao.UserRepository;
import global.sesoc.lunch.dto.UserData;

@Controller
public class UserController {

	@Autowired
	UserRepository repository;

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "User/Join";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(UserData user, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserData result = repository.login(user);
		session.setAttribute("loginid", result.getUserid());
		session.setAttribute("logingender", result.getGender());

		return "index";
	}

	//회원가입완료 후 일단 다시 로그인 페이지로 이동
	@RequestMapping(value = "joinUser", method = RequestMethod.POST)
	public String joinUser(UserData user) {
		repository.insertUser(user);
		return "redirect:/";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
