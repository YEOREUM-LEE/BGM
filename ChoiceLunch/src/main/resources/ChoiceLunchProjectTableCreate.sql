
CREATE TABLE USERDATA 
(
  userid VARCHAR2(20) NOT NULL  -- 유저 id ,pk
, password VARCHAR2(20) NOT NULL   -- 패스워드
, age NUMBER                       -- 연령, 추후 분석용
, gender VARCHAR2(2)               -- 성별, 추후 성별 선호도 조사용
, recommend_count NUMBER           -- 지금까지 총 몇번의 추천을 하였는지
, NONRECOMMEND_COUNT NUMBER        -- 지금까지 총 몇번의 비추천을 하였는지
, RLASTCOMMEND_DAY DATE            -- 레스토랑을 마지막으로 추천,비추천한 날짜
, MLASTCOMMEND_DAY DATE            -- 메뉴를 마지막으로 추천,비추천한 날짜
, JOINDATE DATE NOT NULL           -- 가입일
, CONSTRAINT USERDATA_PK PRIMARY KEY 
  (
   userid
  )
  ENABLE 
);



CREATE TABLE RESTAURANT
(
  RESTAURANT_ID NUMBER NOT NULL PRIMARY KEY   --레스토랑id, pk
, RESTAURANT_NAME VARCHAR2(200) NOT NULL       --레스토랑 이름
, RCATEGORY VARCHAR2(20)                      --레스토랑 카테고리
, IMAGE VARCHAR2(100)                         --레스토랑 이미지이름
, MAPIMAGE VARCHAR2(100)                      --레스토랑 지도파일 이름
, RECOMMEND NUMBER                            --추천횟수
, NONRECOMMEND NUMBER                         --비추천횟수
, ADDRESS VARCHAR2(200)                        --주소
, text VARCHAR2 (500)                         --설명
, CONTACT VARCHAR2(20)                        --연락처
, userid VARCHAR2(20)                         --등록자
, regdate date                                --식당 소개글 등록일
);

create sequence RESTAURANT_SEQ;


CREATE TABLE MENU 
(
  MENU_ID NUMBER NOT NULL                 -- 메뉴 id,pk
, MENU_NAME VARCHAR2(100) NOT NULL         -- 메뉴 이름
, RESTAURANT_ID NUMBER                    -- 메뉴를 판매하는 레스토랑 id
, RESTAURANT_NAME VARCHAR2(200)            -- 메뉴를 판매하는 레스토랑의 이름
, MCATEGORY VARCHAR2(20)                  -- 메뉴의 카테고리
, PRICE NUMBER                            -- 가격
, IMAGE VARCHAR2(100)                     -- 메뉴 사진
, RECOMMEND NUMBER                        -- 추천 횟수
, NONRECOMMEND NUMBER                     -- 비추천 횟수
, userid VARCHAR2(20)                     -- 등록자 id
, REGDATE DATE                            -- 등록일
, CONSTRAINT MENU_PK PRIMARY KEY            
  (
    MENU_ID 
  )
  ENABLE 
);

create sequence MENU_SEQ;

--리뷰 등록 테이블
CREATE TABLE REPLY 
(
  REPLY_ID NUMBER NOT NULL            -- 리뷰 id ,pk
, USERID VARCHAR2(20) NOT NULL        -- 등록자 id
, MENU_ID NUMBER NOT NULL             -- 리뷰에 해당하는 메뉴 id
, REGDATE DATE                        -- 리뷰 등록일
, TEXT VARCHAR2(500)                  -- 리뷰 내용
, IMAGE VARCHAR2(100)                 -- 첨부이미지
, REORNON NUMBER (2)                  -- 추천,비추천여부 (0:비추천, 1:추천)
, CONSTRAINT REPLY_PK PRIMARY KEY 
  (
    REPLY_ID 
  )
  ENABLE 
);
create sequence REPLY_SEQ;

-- 메뉴 추천 정보
CREATE TABLE MCOMMEND 
(
  USERID VARCHAR2(20) NOT NULL  -- 추천자 
, GENDER VARCHAR2(2)            -- 추천자 성별
, MENU_ID NUMBER NOT NULL       -- 추천한 메뉴 id
, REORNON NUMBER                 -- 0 비추 1 추천
, REGDATE DATE                  -- 등록일
);


-- 레스토랑 추천정보 
CREATE TABLE RCOMMEND 
(
  USERID VARCHAR2(20) NOT NULL   -- 추천자
, GENDER VARCHAR2(2)             -- 추천자 성별
, RESTAURANT_ID NUMBER NOT NULL  -- 추천한 레스토랑 id
, REORNON NUMBER                 -- 0 비추 1 추천
, REGDATE DATE                   -- 등록일
);
