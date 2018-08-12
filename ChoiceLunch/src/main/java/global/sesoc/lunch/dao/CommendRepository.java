package global.sesoc.lunch.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.lunch.dto.Commend;

@Repository
public class CommendRepository {
	
	@Autowired
	SqlSession session;
	
	public int insertRcommend(Commend commend) {
		CommendMapper mapper = session.getMapper(CommendMapper.class);
		int result = mapper.insertRcommend(commend);
		return result;
	}
	
	public int insertMcommend(Commend commend) {
		CommendMapper mapper = session.getMapper(CommendMapper.class);
		int result = mapper.insertMcommend(commend);
		return result;
	}

}
