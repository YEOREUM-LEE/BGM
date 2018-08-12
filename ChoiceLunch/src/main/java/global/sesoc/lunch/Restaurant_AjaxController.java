package global.sesoc.lunch;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.lunch.dao.CommendRepository;
import global.sesoc.lunch.dao.RestaurantRepository;
import global.sesoc.lunch.dao.UserRepository;
import global.sesoc.lunch.dto.Commend;
import global.sesoc.lunch.dto.Restaurant;

@Controller
public class Restaurant_AjaxController {

	@Autowired
	RestaurantRepository repository;
	
	@Autowired
	UserRepository repository2;
	
	@Autowired
	CommendRepository repository3;
	

	//만약 리턴값이 존재한다면(추천해도 된다면) ok를 리턴해주고, 안되면 no를 리턴 
	@RequestMapping(value = "Rchecklastrecommendday", method = RequestMethod.GET)
	public @ResponseBody String Rchecklastrecommendday(String userid) {
		String result = "ok"; 
		String check = repository2.lastrCommendDay(userid);
		if (check == null)
			result = "no";

		return result;
	}

	// 레스토랑 테이블 추천 갱신, 유저테이블 추천갱신(횟수), 레스토랑 추천정보 테이블에 정보 삽입
	@RequestMapping(value = "updateCommend", method = RequestMethod.GET)
	public @ResponseBody Map<String, Integer> updateCommend(String userid,int restaurant_id, String check,HttpServletRequest request) {
		HttpSession session = request.getSession();
		Map<String, Integer> result = new HashMap<>();
		Commend commend=new Commend();
		if (check.equals("r")) {
			repository2.updateRecommend(userid);  //유저 테이블에 추천횟수 증가
			repository.updateRecommend(restaurant_id); //레스토랑 테이블에 추천횟수 증가
			commend.setReornon(1);
		} else {
			repository2.updateNonRecommend(userid);     //유저 테이블에 비추천 횟수 증가
			repository.updateNonRecommend(restaurant_id); //레스토랑 테이블에 비추천 횟수 증가
			commend.setReornon(0);
		}
		
		commend.setRm_id(restaurant_id);
		repository2.updateRLCD(userid);               //유저테이블에 마지막 레스토랑 추천일 갱신
		
		String loginid=(String) session.getAttribute("loginid");
		String logingender=(String) session.getAttribute("logingender");
		commend.setUserid(loginid);
		commend.setGender(logingender);
		repository3.insertRcommend(commend);  //레스토랑 추천정보테이블에 새로운 추천정보 입력

		Restaurant restaurant = repository.getCommend(restaurant_id);
		result.put("rec", restaurant.getRecommend());
		result.put("nonrec", restaurant.getNonrecommend());

		return result;
	}

}
