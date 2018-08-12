package global.sesoc.lunch.dto;

public class Commend {

	String userid;
	String gender;
	int rm_id;
	int reornon;

	public Commend() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Commend(String userid, String gender, int rm_id, int reornon) {
		super();
		this.userid = userid;
		this.gender = gender;
		this.rm_id = rm_id;
		this.reornon = reornon;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getRm_id() {
		return rm_id;
	}

	public void setRm_id(int rm_id) {
		this.rm_id = rm_id;
	}

	public int getReornon() {
		return reornon;
	}

	public void setReornon(int reornon) {
		this.reornon = reornon;
	}

	@Override
	public String toString() {
		return "Commend [userid=" + userid + ", gender=" + gender + ", rm_id=" + rm_id + ", reornon=" + reornon + "]";
	}

}
