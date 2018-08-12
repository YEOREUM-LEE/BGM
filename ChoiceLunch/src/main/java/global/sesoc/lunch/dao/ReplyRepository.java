package global.sesoc.lunch.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.lunch.dto.Reply;

@Repository
public class ReplyRepository {

	@Autowired
	SqlSession session;

	public int insertReply(Reply reply) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		int result = mapper.insertReply(reply);
		return result;
	}

	public int deleteReply(int reply_id) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		int result = mapper.deleteReply(reply_id);
		return result;
	}

	public List<Reply> getReplylist(int menu_id) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		List<Reply> result = mapper.getReplylist(menu_id);
		return result;
	}

	public String getImageName(int reply_id) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		String result = mapper.getImageName(reply_id);
		return result;
	}

	public int deleteReplys(int menu_id) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		int result = mapper.deleteReplys(menu_id);
		return result;
	}

	// 수정기능 필요하면 넣을 것
}
