package global.sesoc.lunch.dto;

public class Restaurant {

	int restaurant_id;
	String restaurant_name;
	String address;
	String contact;
	String rcategory;
	String text;
	String image;
	String mapimage;
	String regdate;
	int recommend;
	int nonrecommend;
	String userid; // 등록자

	public Restaurant() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getRestaurant_id() {
		return restaurant_id;
	}

	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}

	public String getRestaurant_name() {
		return restaurant_name;
	}

	public void setRestaurant_name(String restaurant_name) {
		this.restaurant_name = restaurant_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getRcategory() {
		return rcategory;
	}

	public void setRcategory(String rcategory) {
		this.rcategory = rcategory;
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

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getMapimage() {
		return mapimage;
	}

	public void setMapimage(String mapimage) {
		this.mapimage = mapimage;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Restaurant [restaurant_id=" + restaurant_id + ", restaurant_name=" + restaurant_name + ", address="
				+ address + ", contact=" + contact + ", rcategory=" + rcategory + ", text=" + text + ", image=" + image
				+ ", mapimage=" + mapimage + ", regdate=" + regdate + ", recommend=" + recommend + ", nonrecommend="
				+ nonrecommend + ", userid=" + userid + "]";
	}

}
