package global.sesoc.lunch.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import global.sesoc.lunch.dto.Restaurant;

@Repository
public class RestaurantRepository {

	@Autowired
	SqlSession session;

	public int insertRestaurant(Restaurant restaurant) {
		RestaurantMapper mapper = session.getMapper(RestaurantMapper.class);
		int result = mapper.insertRestaurant(restaurant);
		return result;

	}

	public List<Restaurant> RestaurantList() {
		RestaurantMapper mapper = session.getMapper(RestaurantMapper.class);
		List<Restaurant> result = mapper.RestaurantList();
		return result;
	}

	public Restaurant getRestaurant(int restaurant_id) {
		RestaurantMapper mapper = session.getMapper(RestaurantMapper.class);
		Restaurant result = mapper.getRestaurant(restaurant_id);
		return result;
	}

	public int updateRecommend(int restaurant_id) {
		RestaurantMapper mapper = session.getMapper(RestaurantMapper.class);
		int result = mapper.updateRecommend(restaurant_id);
		return result;
	}

	public int updateNonRecommend(int restaurant_id) {
		RestaurantMapper mapper = session.getMapper(RestaurantMapper.class);
		int result = mapper.updateNonRecommend(restaurant_id);
		return result;
	}

	public Restaurant getCommend(int restaurant_id) {
		RestaurantMapper mapper = session.getMapper(RestaurantMapper.class);
		Restaurant result = mapper.getCommend(restaurant_id);
		return result;
	}
	
	public List<Restaurant> rcategoryRestaurantList(String rcategory) {
		RestaurantMapper mapper = session.getMapper(RestaurantMapper.class);
		List<Restaurant> result = mapper.rcategoryRestaurantList(rcategory);
		return result;

	}


}
