package global.sesoc.lunch.dao;

import global.sesoc.lunch.dto.Commend;

public interface CommendMapper {
	 
	
	//reornon 0: 비추   1: 추천
 	public int insertRcommend(Commend commed);
	public int insertMcommend(Commend commed);
	// 일단 데이터 수집만하고 추후 여력이 있으면 성별 선호 식품이나 연령별 선호식품 추출등을 구현

}
