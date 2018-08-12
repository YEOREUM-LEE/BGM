package global.sesoc.lunch.dao;

import java.util.List;

import global.sesoc.lunch.dto.Reply;

public interface ReplyMapper {
	
	public int insertReply(Reply reply);  //리플 등록
	public int deleteReply(int reply_id);  //리플 삭제
	public int deleteReplys(int menu_id); //메뉴에 달린 리플 전부 삭제(메뉴 삭제시)
	public int updateReply(Reply reply); // 리플 수정 
	public List<Reply> getReplylist(int menu_id); //메뉴별 리플 리스트 출력
	public String getImageName(int reply_id);
	

}
