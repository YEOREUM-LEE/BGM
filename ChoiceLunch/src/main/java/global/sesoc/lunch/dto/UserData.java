package global.sesoc.lunch.dto;

public class UserData {

	String userid;
	String password;
	String gender;
	int age;
	int recommend_count;
	int nonrecommend_count;
	String rlastcommend_day;
	String mlastcommend_day;
	String joindate;

	public UserData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getRecommend_count() {
		return recommend_count;
	}

	public void setRecommend_count(int recommend_count) {
		this.recommend_count = recommend_count;
	}

	public int getNonrecommend_count() {
		return nonrecommend_count;
	}

	public void setNonrecommend_count(int nonrecommend_count) {
		this.nonrecommend_count = nonrecommend_count;
	}

	public String getRlastcommend_day() {
		return rlastcommend_day;
	}

	public void setRlastcommend_day(String rlastcommend_day) {
		this.rlastcommend_day = rlastcommend_day;
	}

	public String getMlastcommend_day() {
		return mlastcommend_day;
	}

	public void setMlastcommend_day(String mlastcommend_day) {
		this.mlastcommend_day = mlastcommend_day;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	@Override
	public String toString() {
		return "UserData [userid=" + userid + ", password=" + password + ", gender=" + gender + ", age=" + age
				+ ", recommend_count=" + recommend_count + ", nonrecommend_count=" + nonrecommend_count
				+ ", rlastcommend_day=" + rlastcommend_day + ", mlastcommend_day=" + mlastcommend_day + ", joindate="
				+ joindate + "]";
	}

}
