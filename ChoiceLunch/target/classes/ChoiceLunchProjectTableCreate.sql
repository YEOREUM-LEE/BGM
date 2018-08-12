
CREATE TABLE USERDATA 
(
  userid VARCHAR2(20) NOT NULL  -- ���� id ,pk
, password VARCHAR2(20) NOT NULL   -- �н�����
, age NUMBER                       -- ����, ���� �м���
, gender VARCHAR2(2)               -- ����, ���� ���� ��ȣ�� �����
, recommend_count NUMBER           -- ���ݱ��� �� ����� ��õ�� �Ͽ�����
, NONRECOMMEND_COUNT NUMBER        -- ���ݱ��� �� ����� ����õ�� �Ͽ�����
, RLASTCOMMEND_DAY DATE            -- ��������� ���������� ��õ,����õ�� ��¥
, MLASTCOMMEND_DAY DATE            -- �޴��� ���������� ��õ,����õ�� ��¥
, JOINDATE DATE NOT NULL           -- ������
, CONSTRAINT USERDATA_PK PRIMARY KEY 
  (
   userid
  )
  ENABLE 
);



CREATE TABLE RESTAURANT
(
  RESTAURANT_ID NUMBER NOT NULL PRIMARY KEY   --�������id, pk
, RESTAURANT_NAME VARCHAR2(200) NOT NULL       --������� �̸�
, RCATEGORY VARCHAR2(20)                      --������� ī�װ�
, IMAGE VARCHAR2(100)                         --������� �̹����̸�
, MAPIMAGE VARCHAR2(100)                      --������� �������� �̸�
, RECOMMEND NUMBER                            --��õȽ��
, NONRECOMMEND NUMBER                         --����õȽ��
, ADDRESS VARCHAR2(200)                        --�ּ�
, text VARCHAR2 (500)                         --����
, CONTACT VARCHAR2(20)                        --����ó
, userid VARCHAR2(20)                         --�����
, regdate date                                --�Ĵ� �Ұ��� �����
);

create sequence RESTAURANT_SEQ;


CREATE TABLE MENU 
(
  MENU_ID NUMBER NOT NULL                 -- �޴� id,pk
, MENU_NAME VARCHAR2(100) NOT NULL         -- �޴� �̸�
, RESTAURANT_ID NUMBER                    -- �޴��� �Ǹ��ϴ� ������� id
, RESTAURANT_NAME VARCHAR2(200)            -- �޴��� �Ǹ��ϴ� ��������� �̸�
, MCATEGORY VARCHAR2(20)                  -- �޴��� ī�װ�
, PRICE NUMBER                            -- ����
, IMAGE VARCHAR2(100)                     -- �޴� ����
, RECOMMEND NUMBER                        -- ��õ Ƚ��
, NONRECOMMEND NUMBER                     -- ����õ Ƚ��
, userid VARCHAR2(20)                     -- ����� id
, REGDATE DATE                            -- �����
, CONSTRAINT MENU_PK PRIMARY KEY            
  (
    MENU_ID 
  )
  ENABLE 
);

create sequence MENU_SEQ;

--���� ��� ���̺�
CREATE TABLE REPLY 
(
  REPLY_ID NUMBER NOT NULL            -- ���� id ,pk
, USERID VARCHAR2(20) NOT NULL        -- ����� id
, MENU_ID NUMBER NOT NULL             -- ���信 �ش��ϴ� �޴� id
, REGDATE DATE                        -- ���� �����
, TEXT VARCHAR2(500)                  -- ���� ����
, IMAGE VARCHAR2(100)                 -- ÷���̹���
, REORNON NUMBER (2)                  -- ��õ,����õ���� (0:����õ, 1:��õ)
, CONSTRAINT REPLY_PK PRIMARY KEY 
  (
    REPLY_ID 
  )
  ENABLE 
);
create sequence REPLY_SEQ;

-- �޴� ��õ ����
CREATE TABLE MCOMMEND 
(
  USERID VARCHAR2(20) NOT NULL  -- ��õ�� 
, GENDER VARCHAR2(2)            -- ��õ�� ����
, MENU_ID NUMBER NOT NULL       -- ��õ�� �޴� id
, REORNON NUMBER                 -- 0 ���� 1 ��õ
, REGDATE DATE                  -- �����
);


-- ������� ��õ���� 
CREATE TABLE RCOMMEND 
(
  USERID VARCHAR2(20) NOT NULL   -- ��õ��
, GENDER VARCHAR2(2)             -- ��õ�� ����
, RESTAURANT_ID NUMBER NOT NULL  -- ��õ�� ������� id
, REORNON NUMBER                 -- 0 ���� 1 ��õ
, REGDATE DATE                   -- �����
);
