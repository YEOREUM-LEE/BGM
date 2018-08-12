package global.sesoc.lunch.dao;

import java.util.List;


import global.sesoc.lunch.dto.Restaurant;

public interface RestaurantMapper {
	
	public int insertRestaurant(Restaurant restaurant);  //식당 정보 삽입
	public int updateRestaurant(Restaurant restaurant); //식당 정보 갱신 (구현 여부 미정)
	public int deleteRestaurant(Restaurant restaurant); //식당 정보 삭제(아직 미구현)
	public List<Restaurant> RestaurantList(); //전체 식당리스트
	public List<Restaurant> rcategoryRestaurantList(String rcategory);//카테고리별 레스토랑리스트
	public Restaurant getRestaurant(int restaurant_id);  //단일 식당 정보
	public int updateRecommend(int restaurant_id);   //추천 횟수 추가
	public int updateNonRecommend(int restaurant_id);   //비추천 횟수 추가
	public Restaurant getCommend(int restaurant_id); //추천, 비추천 횟수 총합 출력 
	
	
	

}
