package global.sesoc.lunch.dto;

public class Reply {

	int reply_id;
	String userid;
	int menu_id;
	String text;
	String image;
	String regdate;
	int reornon; // 0 : 비추천 1: 추천

	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Reply(int reply_id, String userid, int menu_id, String text, String image, String regdate, int reornon) {
		super();
		this.reply_id = reply_id;
		this.userid = userid;
		this.menu_id = menu_id;
		this.text = text;
		this.image = image;
		this.regdate = regdate;
		this.reornon = reornon;
	}

	public int getReply_id() {
		return reply_id;
	}

	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getReornon() {
		return reornon;
	}

	public void setReornon(int reornon) {
		this.reornon = reornon;
	}

	@Override
	public String toString() {
		return "Reply [reply_id=" + reply_id + ", userid=" + userid + ", menu_id=" + menu_id + ", text=" + text
				+ ", image=" + image + ", regdate=" + regdate + ", reornon=" + reornon + "]";
	}

}
