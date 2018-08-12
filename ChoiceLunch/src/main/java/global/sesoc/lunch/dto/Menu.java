package global.sesoc.lunch.dto;

public class Menu {

	int menu_id;
	String menu_name;
	int price;
	Integer restaurant_id;
	String restaurant_name;
	String mcategory;
	String image;
	int recommend;
	int nonrecommend;
	String userid;
	String regdate;

	public Menu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Integer getRestaurant_id() {
		return restaurant_id;
	}

	public void setRestaurant_id(Integer restaurant_id) {
		this.restaurant_id = restaurant_id;
	}

	public String getRestaurant_name() {
		return restaurant_name;
	}

	public void setRestaurant_name(String restaurant_name) {
		this.restaurant_name = restaurant_name;
	}

	public String getMcategory() {
		return mcategory;
	}

	public void setMcategory(String mcategory) {
		this.mcategory = mcategory;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public int getNonrecommend() {
		return nonrecommend;
	}

	public void setNonrecommend(int nonrecommend) {
		this.nonrecommend = nonrecommend;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Menu [menu_id=" + menu_id + ", menu_name=" + menu_name + ", price=" + price + ", restaurant_id="
				+ restaurant_id + ", restaurant_name=" + restaurant_name + ", mcategory=" + mcategory + ", image="
				+ image + ", recommend=" + recommend + ", nonrecommend=" + nonrecommend + ", userid=" + userid
				+ ", regdate=" + regdate + "]";
	}

}
