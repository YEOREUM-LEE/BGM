package global.sesoc.lunch;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.lunch.dao.CommendRepository;
import global.sesoc.lunch.dao.MenuRepository;
import global.sesoc.lunch.dao.UserRepository;
import global.sesoc.lunch.dto.Commend;
import global.sesoc.lunch.dto.Menu;

@Controller
public class Menu_AjaxController {

	@Autowired
	MenuRepository repository;
	
	@Autowired
	UserRepository repository2;
	
	@Autowired
	CommendRepository repository3;

	//메뉴를 마지막으로 추천한 날짜를 체크 만약 오늘과 같다면(리턴값이 null이면) no를 반환
	@RequestMapping(value = "Mchecklastrecommendday", method = RequestMethod.GET)
	public @ResponseBody String Mchecklastrecommendday(String userid) {
		String result = "ok";
		String check = repository2.lastmCommendDay(userid);
		if (check == null)
			result = "no";
		return result;
	}

	//check r : 추천   n : 비추천
	// 유저데이터에 추천정보 갱신(횟수), 음식 정보에 추천정보갱신, 추천정보관련 테이블에 정보 삽입
	@RequestMapping(value = "updateCommendMenu", method = RequestMethod.GET)
	public @ResponseBody Map<String, Integer> updateCommend(String userid, int menu_id, String check,
			HttpServletRequest request) {
	
		HttpSession session = request.getSession();
		Map<String, Integer> result = new HashMap<>();
		Commend commend = new Commend();
		if (check.equals("r")) {
			repository2.updateRecommend(userid);   //유저 정보에 추천횟수 증가
			repository.updateRecommend(menu_id);   //메뉴 정보에 메뉴추천 횟수 증가
			commend.setReornon(1);                 
		} else {
			repository2.updateNonRecommend(userid); //유저정보에 비추천횟수 증가
			repository.updateNonRecommend(menu_id); // 메뉴 정보에 메뉴 비추천 횟수 증가
			commend.setReornon(0);                  
		}
		commend.setRm_id(menu_id);
		repository2.updateMLCD(userid);             //유저 정보에 마지막 메뉴추천일 갱신

		String loginid = (String) session.getAttribute("loginid");
		String logingender = (String) session.getAttribute("logingender");
		commend.setUserid(loginid);            
		commend.setGender(logingender);
		repository3.insertMcommend(commend); // 추천한 사람에 대한 정보를 저장(메뉴추천정보 테이블에)

		Menu menu = repository.getCommend(menu_id);  //갱신된 추천, 비추천 수를 담아서 리턴
		result.put("rec", menu.getRecommend());
		result.put("nonrec", menu.getNonrecommend());

		return result;         //추천 .비추천횟수 정보 갱신 된 것을 리턴
	}

	//핵심 메소드, 랜덤 리스트를 보내줌
	@RequestMapping(value = "getRandomList", method = RequestMethod.GET)
	public @ResponseBody List<Menu> getRandomList(String mcategory, String price) {
		//System.out.println("mc" + mcategory + ", pirce: " + price);

		
		if (price != null && mcategory != null) {
			if (price.equals("") && mcategory != "") {
				//System.out.println("카테고리로만 검색, 가격은 프리");
				List<Menu> categorylist = repository.getCategoryMenuList(mcategory);
				Collections.shuffle(categorylist);
				return categorylist;
			} else if (mcategory.equals("") && price != "") {
				//System.out.println("가격으로 검색, 카테고리는 프리");
				List<Menu> pricelist = repository.getPriceMenuList(Integer.parseInt(price));
				Collections.shuffle(pricelist);
				return pricelist;
			} else if ((!price.equals("") && !mcategory.equals(""))) {
				//System.out.println("카테고리, 가격모두 설정");
				Menu menu = new Menu();
				menu.setMcategory(mcategory);
				menu.setPrice(Integer.parseInt(price));
				List<Menu> choiceList = repository.getChoiceMenuList(menu);
				Collections.shuffle(choiceList);
				return choiceList;

			}
		}

		
		//System.out.println("전체검색");
		List<Menu> result = repository.getAllMenulist();
		Collections.shuffle(result);
		return result;

	}
}
