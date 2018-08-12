package global.sesoc.lunch.dao;

import global.sesoc.lunch.dto.UserData;

public interface UserMapper {
	
	public int insertUser(UserData user);  // 신규 가입
	public int updateUser(UserData user);   //회원정보 수정, 아직 미구현
	public UserData login(UserData user);  //로그인   --> 리턴자료 : 로그인 id, 성별, 마지막 추천일 (로그인동안 세션에 저장)
	public int deleteUser(UserData user); // 회원탈퇴  아직 미구현
	public String idcheck(String userid); //id 존재여부 확인
	public String lastrCommendDay(String userid); //마지막 추천일 체크(식당)
	public int updateRLCD(String userid); //마지막 추천일 갱신(식당)
	public int updateMLCD(String userid); //마지막 추천일 갱신(메뉴)
	public String lastmCommendDay(String userid); //마지막 추천일 체크(메뉴)
	public int updateRecommend(String userid);   //추천 횟수 추가
	public int updateNonRecommend(String userid);   //비추천 횟수 추가
	

}
