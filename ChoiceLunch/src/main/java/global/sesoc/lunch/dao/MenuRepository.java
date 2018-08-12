package global.sesoc.lunch.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import global.sesoc.lunch.dto.Menu;

@Repository
public class MenuRepository {

	@Autowired
	SqlSession session;

	public int insertMenu(Menu menu) {
		MenuMapper mapper = session.getMapper(MenuMapper.class);
		int result = mapper.insertMenu(menu);

		return result;
	}

	public int updateMenu(Menu menu) {
		MenuMapper mapper = session.getMapper(MenuMapper.class);
		int result = mapper.updateMenu(menu);
		return result;
	}

	public int deleteMenu(int menu_id) {
		MenuMapper mapper = session.getMapper(MenuMapper.class);
		int result = mapper.deleteMenu(menu_id);
		return result;
	}

	public List<Menu> getMenulist(int restaurant_id) {
		MenuMapper mapper = session.getMapper(MenuMapper.class);
		List<Menu> result = mapper.getMenulist(restaurant_id);
		return result;
	}

	public Menu getMenu(int menu_id) {
		MenuMapper mapper = session.getMapper(MenuMapper.class);
		Menu result = mapper.getMenu(menu_id);
		return result;
	}

	public int updateRecommend(int menu_id) {
		MenuMapper mapper = session.getMapper(MenuMapper.class);
		int result = mapper.updateRecommend(menu_id);
		return result;
	}

	public int updateNonRecommend(int menu_id) {
		MenuMapper mapper = session.getMapper(MenuMapper.class);
		int result = mapper.updateNonRecommend(menu_id);
		return result;
	}

	public Menu getCommend(int menu_id) {
		MenuMapper mapper = session.getMapper(MenuMapper.class);
		Menu result = mapper.getCommend(menu_id);
		return result;
	}

	public List<Menu> getAllMenulist() {
		MenuMapper mapper = session.getMapper(MenuMapper.class);
		List<Menu> result = mapper.getAllMenulist();
		return result;
	}

	public List<Menu> getCategoryMenuList(String mcategory) {
		MenuMapper mapper = session.getMapper(MenuMapper.class);
		List<Menu> result = mapper.getCategoryMenuList(mcategory);
		return result;
	}

	public List<Menu> getPriceMenuList(int price) {
		MenuMapper mapper = session.getMapper(MenuMapper.class);
		List<Menu> result = mapper.getPriceMenuList(price);
		return result;
	}

	public List<Menu> getChoiceMenuList(Menu menu) {
		MenuMapper mapper = session.getMapper(MenuMapper.class);
		List<Menu> result = mapper.getChoiceMenuList(menu);
		return result;
	}

	public List<Menu> getBestMenu() {
		MenuMapper mapper = session.getMapper(MenuMapper.class);
		List<Menu> result = mapper.getBestMenu();
		return result;
	}
	

}
