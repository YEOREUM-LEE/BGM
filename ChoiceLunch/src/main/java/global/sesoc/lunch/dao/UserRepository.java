package global.sesoc.lunch.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.lunch.dto.UserData;

@Repository
public class UserRepository {

	@Autowired
	SqlSession session;

	public int insertUser(UserData user) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		int result = mapper.insertUser(user);
		return result;
	}

	public UserData login(UserData user) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		UserData result = mapper.login(user);
		return result;
	}

	public String idcheck(String userid) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		String result = mapper.idcheck(userid);
		return result;
	}
	
	public int updateRecommend(String userid) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		int result = mapper.updateRecommend(userid);
		return result;
	}

	public int updateNonRecommend(String userid) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		int result = mapper.updateNonRecommend(userid);
		return result;
	}

	public String lastmCommendDay(String userid) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		String result = mapper.lastmCommendDay(userid);
		return result;
	}
	
	public String lastrCommendDay(String userid) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		String result = mapper.lastrCommendDay(userid);
		return result;
	}

	public int updateMLCD(String userid) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		int result = mapper.updateMLCD(userid);
		return result;
	}
	
	public int updateRLCD(String userid) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		int result = mapper.updateRLCD(userid);
		return result;
	}

	

}
