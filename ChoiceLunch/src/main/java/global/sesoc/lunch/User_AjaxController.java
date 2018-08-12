package global.sesoc.lunch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.lunch.dao.UserRepository;
import global.sesoc.lunch.dto.UserData;

@Controller
public class User_AjaxController {

	@Autowired
	UserRepository repository;
	
	@RequestMapping(value="idCheck", method=RequestMethod.GET)
	public @ResponseBody String idCheck(String userid) {
		String result=repository.idcheck(userid);
		return result;
	}
	
	@RequestMapping(value="AjaxLogin",method=RequestMethod.POST)
	public @ResponseBody UserData AjaxLogin(@RequestBody UserData user) {
		UserData result=repository.login(user);
		return result;
	}
	
	
	
}
