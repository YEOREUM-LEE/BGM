package global.sesoc.lunch.dao;

import java.util.List;

import global.sesoc.lunch.dto.Commend;
import global.sesoc.lunch.dto.Menu;


public interface MenuMapper {
	
	public int insertMenu(Menu menu);  // 메뉴정보 추가
	public int updateMenu(Menu menu);  //메뉴 정보 갱신
	public int deleteMenu(int menu_id); //메뉴정보 삭제
	public Menu getMenu(int menu_id);  //메뉴 단일 정보 모두 수집
	public List<Menu> getMenulist(int restaurant_id); //레스토랑별 메뉴정보 수집
	public List<Menu> getAllMenulist();  //모든 메뉴 리스트 수집
	public int updateRecommend(int menu_id);   //추천 횟수 추가
	public int updateNonRecommend(int menu_id);   //비추천 횟수 추가
	public Menu getCommend(int menu_id); //추천, 비추천 횟수 총합 출력
	public int updateFcommend(Commend Fcommend);  //식당 추천 or 비추천에 대한 정보 추가
	public int updateUserLastcommmend_day(String userid);  //추천 or 비추천 한 유저의 최종 추천일 갱신 
	public List<Menu> getCategoryMenuList(String mcategory); //카테고리를 설정했을때 해당 카테고리 메뉴 리스트
    public List<Menu> getPriceMenuList(int price);    
    public List<Menu> getChoiceMenuList(Menu menu);
    public List<Menu> getBestMenu();  // 최고의 베스트메뉴 가져오기(가장 많은 추천을 받은)
}
