
--시퀀스관리
CREATE TABLE SQ_MNG
(
TABLE_NAME VARCHAR(20) NOT NULL COMMENT '테이블_이름',
NEXT_ID INTEGER COMMENT '다음_ID'
)COMMENT '시퀀스_관리';

ALTER TABLE SQ_MNG
ADD PRIMARY KEY (TABLE_NAME);

--회원
CREATE TABLE USERS
(
U_SQ VARCHAR(20) NOT NULL COMMENT '회원번호',
U_EMAIL VARCHAR(100) NOT NULL COMMENT '회원ID',
JOIN_DT DATETIME NULL COMMENT '가입일',
U_NM VARCHAR(100) NULL COMMENT '이름',
PHONE_NO VARCHAR(50) NULL COMMENT '휴대전화',
U_PW VARCHAR(100) NULL COMMENT '비밀번호',
LOGIN_DT DATETIME NULL COMMENT '최근접속일',
U_ST CHAR(1) NULL COMMENT '계정상태',
U_OUT_DT DATETIME NULL COMMENT '탈퇴일'
)COMMENT '회원';

ALTER TABLE USERS
ADD PRIMARY KEY (U_SQ);

--전자정부 첨부파일
CREATE TABLE COMTNFILE
(
ATCH_FILE_ID VARCHAR(20) NOT NULL COMMENT '첨부_파일_ID',
CREAT_DT DATETIME NULL COMMENT '생성_일자',
USE_AT CHAR(1) NULL COMMENT '사용_여부'
)COMMENT '전자정부 첨부파일';

ALTER TABLE COMTNFILE ADD PRIMARY KEY (ATCH_FILE_ID);

--전자정부 첨부파일상세
CREATE TABLE COMTNFILEDETAIL
(
ATCH_FILE_ID VARCHAR(20) NOT NULL COMMENT '첨부_파일_ID',
FILE_SN INTEGER NOT NULL COMMENT '파일_연번',
FILE_STRE_COURS VARCHAR(2000) NULL COMMENT '파일_저장_경로',
STRE_FILE_NM VARCHAR(30) NULL COMMENT '저장_파일_명',
ORIGNL_FILE_NM VARCHAR(20) NULL COMMENT '원_파일_명',
FILE_EXTSN VARCHAR(20) NULL COMMENT '파일_확장자',
FILE_CN VARCHAR(4000) NULL COMMENT '파일_내용',
FILE_SIZE INTEGER NULL COMMENT '파일_크기'
)COMMENT '전자정부 첨부파일상세';

ALTER TABLE COMTNFILEDETAIL
ADD PRIMARY KEY (ATCH_FILE_ID, FILE_SN);

ALTER TABLE COMTNFILEDETAIL
ADD CONSTRAINT R_11 FOREIGN KEY (ATCH_FILE_ID) REFERENCES COMTNFILE (ATCH_FILE_ID);


--게시판관리
CREATE TABLE ADMIN_POST
(
POST_SQ VARCHAR(20) NOT NULL COMMENT '게시판번호',
IMG_SQ VARCHAR(20) NULL COMMENT '이미지번호',
POST_DT DATETIME NULL COMMENT '게시글작성일',
POST_CATEGORY_ST CHAR(1) NULL COMMENT '카테고리',
POST_TITLE VARCHAR(100) NULL COMMENT '제목',
POST_SUB_TITLE VARCHAR(100) NULL COMMENT '서브타이틀',
POST_CTT VARCHAR(500) NULL COMMENT '내용',
POST_FL CHAR(1) NULL COMMENT '삭제여부',
CPN_SQ VARCHAR(20) NULL COMMENT '쿠폰번호'
)COMMENT '게시판관리';

ALTER TABLE ADMIN_POST 
ADD PRIMARY KEY (POST_SQ);

ALTER TABLE ADMIN_POST
ADD CONSTRAINT R_2 FOREIGN KEY (IMG_SQ) REFERENCES COMTNFILE (ATCH_FILE_ID);


--배너관리
CREATE TABLE ADMIN_BANNER
(
B_SQ VARCHAR(20) NOT NULL COMMENT '게시판번호',
IMG_SQ VARCHAR(20) NULL COMMENT '이미지번호',
B_DT DATETIME NULL COMMENT '게시글작성일',
B_NM VARCHAR(30) NULL COMMENT '카테고리',
B_FL CHAR(1) NULL COMMENT '제목'
)COMMENT '배너관리';

ALTER TABLE ADMIN_BANNER 
ADD PRIMARY KEY (B_SQ);

ALTER TABLE ADMIN_BANNER
ADD CONSTRAINT R_3 FOREIGN KEY (IMG_SQ) REFERENCES COMTNFILE (ATCH_FILE_ID);

--쿠폰관리
CREATE TABLE ADMIN_CPN
(
CPN_SQ VARCHAR(20) NOT NULL COMMENT '쿠폰번호',
CPN_START_DT DATETIME NULL COMMENT '생성일',
CPN_NM VARCHAR(50) NULL COMMENT '쿠폰명',
CPN_CDT VARCHAR(50) NULL COMMENT '사용조건',
CPN_RATE INTEGER NULL COMMENT '할인율',
CPN_END_DT DATETIME NULL COMMENT '만료기간',
CPN_ST CHAR(1) NULL COMMENT '쿠폰상태'
)COMMENT '쿠폰관리';

ALTER TABLE ADMIN_CPN
ADD PRIMARY KEY (CPN_SQ);


--쿠폰내역
CREATE TABLE U_CPN
(
U_CPN_SQ VARCHAR(20) NOT NULL COMMENT '쿠폰내역번호',
U_CPN_DT DATETIME NULL COMMENT '발급일',
CPN_SQ VARCHAR(20) NULL COMMENT '쿠폰번호',
U_SQ VARCHAR(20) NULL COMMENT '회원번호',
U_CPN_FL CHAR(1) NULL COMMENT '사용여부'
)COMMENT '쿠폰내역';

ALTER TABLE U_CPN
ADD PRIMARY KEY (U_CPN_SQ);

ALTER TABLE U_CPN
ADD CONSTRAINT R_5 FOREIGN KEY (CPN_SQ) REFERENCES ADMIN_CPN (CPN_SQ);

ALTER TABLE U_CPN
ADD CONSTRAINT R_6 FOREIGN KEY (U_SQ) REFERENCES USERS (U_SQ);

--오프라인클래스
CREATE TABLE OFF_CLASS
(
C_SQ VARCHAR(20) NOT NULL COMMENT '클래스번호',
U_SQ VARCHAR(20) NULL COMMENT '회원번호', 
IMG_SQ VARCHAR(20) NULL COMMENT '이미지번호',
C_DT DATETIME NULL COMMENT '클래스등록일',
C_ST CHAR(1) NULL COMMENT '클래스상태',
C_GB CHAR(1) NULL COMMENT '클래스구분',
C_CATEGORY_ST CHAR(1) NULL COMMENT '카테고리',
C_AREA_ST CHAR(1) NULL COMMENT '지역',
C_TITLE VARCHAR(30) NULL COMMENT '타이틀제목',
u_start_dt DATETIME NULL COMMENT '클래스시작일',
C_END_DT DATETIME NULL COMMENT '클래스종료일',
C_TIME VARCHAR(50) NULL COMMENT '클래스시간',
C_SMALL_NO INTEGER NULL COMMENT '최소인원',
C_BIG_NO INTEGER NULL COMMENT '최대인원',
C_APPLY_NO INTEGER NULL COMMENT '신청인원',
C_ADR VARCHAR(256) NULL COMMENT '주소',
C_COST_NO INTEGER NULL COMMENT '클래스비용',
C_WEB_ADR VARCHAR(256) NULL COMMENT '외부링크',
c_del_yn CHAR(1) NULL COMMENT '삭제여부'
)COMMENT '오프라인클래스';


ALTER TABLE OFF_CLASS 
ADD PRIMARY KEY (C_SQ);

ALTER TABLE OFF_CLASS
ADD CONSTRAINT R_7 FOREIGN KEY (U_SQ) REFERENCES USERS (U_SQ);

ALTER TABLE OFF_CLASS
ADD CONSTRAINT R_8 FOREIGN KEY (IMG_SQ) REFERENCES COMTNFILE (ATCH_FILE_ID);


--클래스후기
CREATE TABLE CLASS_R
(
R_SQ VARCHAR(20) NOT NULL COMMENT '후기번호',
C_SQ VARCHAR(20) NULL COMMENT '클래스번호',
U_SQ VARCHAR(20) NULL COMMENT '회원번호',
R_DT DATETIME NULL COMMENT '작성일',
SCO_1 INTEGER NULL COMMENT '커리큘럼평점',
SCO_2 INTEGER NULL COMMENT '친절도평점',
SCO_3 INTEGER NULL COMMENT '시간준수평점',
SCO_4 INTEGER NULL COMMENT '전달력평점',
R_CTT VARCHAR(300) NULL COMMENT '후기내용',
R_FL CHAR(1) NULL COMMENT '삭제여부'
)COMMENT '클래스후기';

ALTER TABLE CLASS_R 
ADD PRIMARY KEY (R_SQ);

ALTER TABLE CLASS_R
ADD CONSTRAINT R_9 FOREIGN KEY (C_SQ) REFERENCES OFF_CLASS (C_SQ);

ALTER TABLE CLASS_R
ADD CONSTRAINT R_10 FOREIGN KEY (U_SQ) REFERENCES USERS (U_SQ);


--후기댓글
CREATE TABLE R_CMT
(
CMT_SQ VARCHAR(20)  NOT NULL COMMENT '댓글번호',
R_SQ VARCHAR(20) NOT NULL COMMENT '후기번호',
U_SQ VARCHAR(20) NULL COMMENT '회원번호',
CMT_DT DATETIME NULL COMMENT '댓글작성일',
CMT_CTT VARCHAR(200) NULL COMMENT '댓글내용'
)COMMENT '클래스후기댓글';

ALTER TABLE R_CMT
ADD PRIMARY KEY (CMT_SQ);

ALTER TABLE R_CMT
ADD CONSTRAINT R_11 FOREIGN KEY (R_SQ) REFERENCES CLASS_R (R_SQ);

ALTER TABLE R_CMT
ADD CONSTRAINT R_12 FOREIGN KEY (U_SQ) REFERENCES USERS (U_SQ);


--알람신청
CREATE TABLE ALARM
(
ALARM_SQ VARCHAR(20) NOT NULL COMMENT '알람신청번호',
ALARM_DT DATETIME NULL COMMENT '신청일',
U_SQ VARCHAR(20) NULL COMMENT '회원번호',
C_SQ VARCHAR(20) NULL COMMENT '클래스번호',
ALARM_FL CHAR(1) NULL COMMENT '발송여부',
ALARM_SEND_DT DATETIME NULL COMMENT '발송일'
)COMMENT '알람신청';

ALTER TABLE ALARM 
ADD PRIMARY KEY (ALARM_SQ);

ALTER TABLE ALARM
ADD CONSTRAINT R_13 FOREIGN KEY (C_SQ) REFERENCES OFF_CLASS (C_SQ);

ALTER TABLE ALARM
ADD CONSTRAINT R_14 FOREIGN KEY (U_SQ) REFERENCES USERS (U_SQ);


--찜
CREATE TABLE JJIM
(
JJIM_SQ VARCHAR(20) NOT NULL COMMENT '찜번호',
U_SQ VARCHAR(20) NULL COMMENT '회원번호',
C_SQ VARCHAR(20) NULL COMMENT '클래스번호'
);

ALTER TABLE JJIM 
ADD PRIMARY KEY (JJIM_SQ);

ALTER TABLE JJIM
ADD CONSTRAINT R_15 FOREIGN KEY (C_SQ) REFERENCES OFF_CLASS (C_SQ);

ALTER TABLE JJIM
ADD CONSTRAINT R_16 FOREIGN KEY (U_SQ) REFERENCES USERS (U_SQ);

--결제내역
CREATE TABLE PAY
(
PAY_SQ VARCHAR(20) NOT NULL COMMENT '주문번호',
C_SQ VARCHAR(20) NULL COMMENT '클래스번호',
U_SQ VARCHAR(20) NULL COMMENT '회원번호',
CPN_SQ VARCHAR(20) NULL COMMENT '쿠폰번호',
PAY_DT DATETIME NULL COMMENT '결제일',
PAY_ST CHAR(1) NULL COMMENT '결제상태',
PAY_METHOD_ST CHAR(1) NULL COMMENT '결제방법',
PAY_COST_NO INTEGER NULL COMMENT '최종결제금액',
DEL_YN CHAR(1) NULL COMMENT '삭제여부'
)COMMENT '결제내역';

ALTER TABLE PAY 
ADD PRIMARY KEY (PAY_SQ);

ALTER TABLE PAY
ADD CONSTRAINT R_17 FOREIGN KEY (C_SQ) REFERENCES OFF_CLASS (C_SQ);

ALTER TABLE PAY
ADD CONSTRAINT R_18 FOREIGN KEY (U_SQ) REFERENCES USERS (U_SQ);

--ALTER TABLE PAY
--ADD CONSTRAINT R_19 FOREIGN KEY (CPN_SQ) REFERENCES ADMIN_CPN (CPN_SQ);


--취소환불내역
CREATE TABLE RC
(
RC_SQ VARCHAR(20) NOT NULL COMMENT  '취소환불내역번호',
PAY_SQ VARCHAR(20) NULL COMMENT  '주문번호',
CANCEL_DT DATETIME NULL COMMENT  '취소완료일',
REFUND_START_DT DATETIME NULL COMMENT  '환불신청일',
REFUND_END_DT DATETIME NULL COMMENT  '환불완료일'
)COMMENT  '취소환불내역';

ALTER TABLE RC 
ADD PRIMARY KEY (RC_SQ);

ALTER TABLE RC
ADD CONSTRAINT R_20 FOREIGN KEY (PAY_SQ) REFERENCES PAY (PAY_SQ);

--수정내역관리(관리자 회원등급 변경, 결제내역 상태 변경)
CREATE TABLE ADMIN_UPDATE
(
UPDATE_SQ VARCHAR(20) NOT NULL COMMENT '수정내역번호',
U_SQ VARCHAR(20) NULL COMMENT '회원번호',
UPDATE_DT DATETIME NULL COMMENT '수정일',
UPDATE_CTT VARCHAR(500) NULL COMMENT '내용'
)COMMENT '수정내역관리';

ALTER TABLE admin_update 
ADD PRIMARY KEY (UPDATE_SQ);

ALTER TABLE admin_update
ADD CONSTRAINT R_21 FOREIGN KEY (U_SQ) REFERENCES USERS (U_SQ);


--프로그램관리
CREATE TABLE PRM_MNG
(
PGM_ID VARCHAR(20) NOT NULL COMMENT '프로그램_ID',
PGM_NAME VARCHAR(30) NULL COMMENT '프로그램_이름',
PGM_URL VARCHAR(50) NULL COMMENT '프로그램URL',
PGM_DES VARCHAR(200) NULL COMMENT '프로그램_내용',
PGM_PARAM VARCHAR(20) NULL COMMENT '프로그램_변수',
RG_ID VARCHAR(20) NULL COMMENT '등록_ID',
RG_DT DATETIME NULL COMMENT '등록_일자',
MOD_ID VARCHAR(20) NULL COMMENT '수정_ID',
MOD_DT DATETIME NULL COMMENT '수정_일자'
)COMMENT '프로그램_관리';

ALTER TABLE PRM_MNG
ADD PRIMARY KEY (PGM_ID);


--권한관리
CREATE TABLE RL_MNG
(
RL_ID VARCHAR(20) NOT NULL COMMENT '권한_ID',
RL_CD VARCHAR(20) NULL COMMENT '권한_코드',
RL_NAME VARCHAR(30) NULL COMMENT '권한_이름',
RL_DES VARCHAR(200) NULL COMMENT '권한_내용',
RL_CLS CHAR(1) NULL COMMENT '권한_분류',
RG_ID VARCHAR(20) NULL COMMENT '등록_ID',
RG_DT DATETIME NULL COMMENT '등록_일자',
MOD_ID VARCHAR(20) NULL COMMENT '수정_ID',
MOD_DT DATETIME NULL COMMENT '수정_일자'
)COMMENT '권한_관리';


ALTER TABLE RL_MNG
ADD PRIMARY KEY (RL_ID);


--권한사용자매핑  
CREATE TABLE RL_USER_MPPG
(
MPPG_ID VARCHAR(20) NOT NULL COMMENT '매핑_ID',
RL_ID VARCHAR(20) NOT NULL COMMENT '권한_ID',
U_SQ VARCHAR(20) NOT NULL COMMENT '사용자_ID',
RG_ID VARCHAR(20) NULL COMMENT '등록_ID',
RG_DT DATETIME NULL COMMENT '등록_일자'
)COMMENT '권한_사용자_매핑';

ALTER TABLE RL_USER_MPPG
ADD PRIMARY KEY (RL_ID, U_SQ, MPPG_ID);

ALTER TABLE RL_USER_MPPG
ADD CONSTRAINT R_22 FOREIGN KEY (RL_ID) REFERENCES RL_MNG (RL_ID);

ALTER TABLE RL_USER_MPPG
ADD CONSTRAINT R_23 FOREIGN KEY (U_SQ) REFERENCES USERS (U_SQ);


--접속로그
CREATE TABLE ACCESS_LOG
(
ACCESS_LOG_ID VARCHAR(20) NOT NULL COMMENT '접속_로그_ID',
ACCESS_IP VARCHAR(20) NULL COMMENT '접속_IP',
ACCESS_DT DATETIME NULL COMMENT '접속_일시',
U_SQ VARCHAR(20) NOT NULL COMMENT '사용자_ID'
)COMMENT '접속_로그';

ALTER TABLE ACCESS_LOG
ADD PRIMARY KEY (U_SQ,ACCESS_LOG_ID);

ALTER TABLE ACCESS_LOG
ADD CONSTRAINT R_24 FOREIGN KEY (U_SQ) REFERENCES USERS (U_SQ);

--메뉴관리
CREATE TABLE MENU_MNG
(
MENU_ID VARCHAR(20) NOT NULL COMMENT '메뉴_ID',
MENU_DIV CHAR(1) NULL COMMENT '메뉴_구분',
MENU_NAME VARCHAR(30) NULL COMMENT '메뉴_이름',
MENU_DES VARCHAR(200) NULL COMMENT '메뉴_내용',
UPR_MENU_ID VARCHAR(20) NULL COMMENT '상위_메뉴_ID',
MENU_LUP INTEGER NULL COMMENT '메뉴_정렬',
PGM_ID VARCHAR(20) NULL COMMENT '프로그램_ID',
OT_URL VARCHAR(50) NULL COMMENT '외부URL',
USE_YN CHAR(1) NULL COMMENT '사용_여부',
MENU_LVL INTEGER NULL COMMENT '메뉴_레벨',
RG_ID VARCHAR(20) NULL COMMENT '등록_ID',
RG_DT DATETIME NULL COMMENT '등록_일자',
MOD_ID VARCHAR(20) NULL COMMENT '수정_ID',
MOD_DT DATETIME NULL COMMENT '수정_일자'
)COMMENT '메뉴_관리';

ALTER TABLE MENU_MNG
ADD PRIMARY KEY (MENU_ID);

--ALTER TABLE MENU_MNG
--ADD CONSTRAINT R_25 FOREIGN KEY (PGM_ID) REFERENCES PRM_MNG (PGM_ID);


--메뉴권한매핑
CREATE TABLE MENU_RL_MPPG
(
MPPG_ID VARCHAR(20) NOT NULL COMMENT '매핑_ID',
RL_ID VARCHAR(20) NOT NULL COMMENT '권한_ID',
MENU_ID VARCHAR(20) NOT NULL COMMENT '메뉴_ID',
RL_DIV CHAR(1) NULL COMMENT '권한_구분',
RG_ID VARCHAR(20) NULL COMMENT '등록_ID',
RG_DT DATETIME NULL COMMENT '등록_일자'
)COMMENT '메뉴_권한_매핑';

ALTER TABLE MENU_RL_MPPG
ADD PRIMARY KEY (MENU_ID,RL_ID,MPPG_ID);

ALTER TABLE MENU_RL_MPPG
ADD CONSTRAINT R_26 FOREIGN KEY (MENU_ID) REFERENCES MENU_MNG (MENU_ID);

ALTER TABLE MENU_RL_MPPG
ADD CONSTRAINT R_27 FOREIGN KEY (RL_ID) REFERENCES RL_MNG (RL_ID);


--메뉴통계
CREATE TABLE MENU_STATS
(
STATS_ID VARCHAR(20) NOT NULL COMMENT '통계_ID',
MENU_ID VARCHAR(20) NOT NULL COMMENT '메뉴_ID',
ACCESS_URL VARCHAR(100) NULL COMMENT '접속_URL',
ACCESS_IP VARCHAR(20) NULL COMMENT '접속_IP',
U_SQ VARCHAR(20) NULL COMMENT '사용자_ID',
VISIT_DT DATETIME NULL COMMENT '방문_일자'
)COMMENT '메뉴_통계';

ALTER TABLE menu_stats
ADD PRIMARY KEY (MENU_ID,STATS_ID);

ALTER TABLE menu_stats
ADD CONSTRAINT R_28 FOREIGN KEY (MENU_ID) REFERENCES MENU_MNG (MENU_ID);


--공통코드대분류
CREATE TABLE COMMON_CD_LCLS
(
LCLS_ID VARCHAR(20) NOT NULL COMMENT '대분류_ID',
LCLS_NM VARCHAR(50) NULL COMMENT '대분류_명',
LCLS_CD VARCHAR(20) NULL COMMENT '대분류_코드',
LCLS_EPL VARCHAR(50) NULL COMMENT '대분류_설명',
USE_YN CHAR(1) NULL COMMENT '사용_여부',
RG_ID VARCHAR(20) NULL COMMENT '등록_ID',
RG_DT DATETIME NULL COMMENT '등록_일자',
MOD_ID VARCHAR(20) NULL COMMENT '수정_ID',
MOD_DT DATETIME NULL COMMENT '수정_일자'
)COMMENT '공통_코드_대분류';

ALTER TABLE COMMON_CD_LCLS
ADD PRIMARY KEY (LCLS_ID);


--공통코드소분류
CREATE TABLE COMMON_CD_SCLS
(
MCLS_ID VARCHAR(20) NOT NULL COMMENT '소분류_ID',
LCLS_ID VARCHAR(20) NOT NULL COMMENT '대분류_ID',
LCLS_CD VARCHAR(20) NULL COMMENT '대분류_코드',
MCLS_NM VARCHAR(50) NULL COMMENT '소분류_명',
MCLS_CD VARCHAR(20) NULL COMMENT '소분류_코드',
MCLS_EPL VARCHAR(50) NULL COMMENT '소분류_설명',
ORD INTEGER DEFAULT '0' COMMENT '순서',
USE_YN CHAR(1) NULL COMMENT '사용_여부',
RG_ID VARCHAR(20) NULL COMMENT '등록_ID',
RG_DT DATETIME NULL COMMENT '등록_일자',
MOD_ID VARCHAR(20) NULL COMMENT '수정_ID',
MOD_DT DATETIME NULL COMMENT '수정_일자'
);

ALTER TABLE COMMON_CD_SCLS
ADD PRIMARY KEY (LCLS_ID,MCLS_ID);

ALTER TABLE COMMON_CD_SCLS
ADD CONSTRAINT R_30 FOREIGN KEY (LCLS_ID) REFERENCES COMMON_CD_LCLS (LCLS_ID);

Insert into COMMON_CD_LCLS (LCLS_ID,LCLS_NM,LCLS_CD,LCLS_EPL,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEL-000000','권한그룹명','RCD','권한그룹명','Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000000','CODEL-000000','RCD','인증 되지 않은 사용자','N','인증 되지 않은 사용자',1,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000001','CODEL-000000','RCD','회원','U','회원권한',2,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000002','CODEL-000000','RCD','멘토','M','멘토권한',3,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000003','CODEL-000000','RCD','관리자','A','관리자권한',4,'Y','USR-000000',sysdate,null,sysdate);

Insert into COMMON_CD_LCLS (LCLS_ID,LCLS_NM,LCLS_CD,LCLS_EPL,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEL-000001','계정상태','UST','계정상태','Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000003','CODEL-000001','UST','정상','1','정상회원',1,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000004','CODEL-000001','UST','휴면','2','휴면회원',2,'Y','USR-000000',sysdate,null,null);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000005','CODEL-000001','UST','탈퇴','3','탈퇴회원',3,'Y','USR-000000',sysdate,null,null);


Insert into COMMON_CD_LCLS (LCLS_ID,LCLS_NM,LCLS_CD,LCLS_EPL,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEL-000002','클래스상태','CST','클래스상태','Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000006','CODEL-000002','CST','클래스오픈전','1','클래스오픈전',1,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000007','CODEL-000002','CST','클래스오픈중','2','클래스오픈중',2,'Y','USR-000000',sysdate,null,null);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000008','CODEL-000002','CST','클래스신청마감','3','클래스신청마감',3,'Y','USR-000000',sysdate,null,null);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000009','CODEL-000002','CST','클래스종료','4','클래스종료',4,'Y','USR-000000',sysdate,null,null);

Insert into COMMON_CD_LCLS (LCLS_ID,LCLS_NM,LCLS_CD,LCLS_EPL,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEL-000003','클래스구분','CGB','클래스구분','Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000010','CODEL-000003','CGB','내부','1','내부클래스',1,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000011','CODEL-000003','CGB','외부','2','외부클래스',2,'Y','USR-000000',sysdate,null,null);


Insert into COMMON_CD_LCLS (LCLS_ID,LCLS_NM,LCLS_CD,LCLS_EPL,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEL-000004','클래스카테고리','CCT','클래스카테고리','Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000012','CODEL-000004','CCT','헤어','1','헤어',1,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000013','CODEL-000004','CCT','메이크업','2','메이크업',2,'Y','USR-000000',sysdate,null,null);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000014','CODEL-000004','CCT','속눈썹/반영구','3','속눈썹/반영구',3,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000015','CODEL-000004','CCT','피부/왁싱','4','피부/왁싱',4,'Y','USR-000000',sysdate,null,null);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000016','CODEL-000004','CCT','네일','5','네일',5,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000017','CODEL-000004','CCT','기타','6','기타',6,'Y','USR-000000',sysdate,null,null);


Insert into COMMON_CD_LCLS (LCLS_ID,LCLS_NM,LCLS_CD,LCLS_EPL,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEL-000005','지역','ARA','지역','Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000018','CODEL-000005','ARA','서울','1','서울',1,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000019','CODEL-000005','ARA','경기','2','경기',2,'Y','USR-000000',sysdate,null,null);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000020','CODEL-000005','ARA','강원','3','강원',3,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000021','CODEL-000005','ARA','충청','4','충청',4,'Y','USR-000000',sysdate,null,null);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000022','CODEL-000005','ARA','전라','5','전라',5,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000023','CODEL-000005','ARA','경상','6','경상',6,'Y','USR-000000',sysdate,null,null);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000024','CODEL-000005','ARA','제주도','7','제주도',7,'Y','USR-000000',sysdate,null,null);


INSERT INTO COMMON_CD_LCLS ( LCLS_ID, LCLS_NM, LCLS_CD, LCLS_EPL, USE_YN, RG_ID, RG_DT )VALUES( 'CODEL-000006', '게시판카테고리', 'BCT', '게시판카테고리', 'Y', 'USR-000000', sysdate );
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000025','CODEL-000006','BCT','제품정보','1','제품정보',1,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000026','CODEL-000006','BCT','자격증','2','자격증',2,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000027','CODEL-000006','BCT','박람회','3','박람회',3,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000028','CODEL-000006','BCT','공지사항','4','공지사항',4,'Y','USR-000000',sysdate,'USR-000000',sysdate);

INSERT INTO COMMON_CD_LCLS ( LCLS_ID, LCLS_NM, LCLS_CD, LCLS_EPL, USE_YN, RG_ID, RG_DT )VALUES( 'CODEL-000007', '쿠폰상태', 'CPN', '쿠폰상태', 'Y', 'USR-000000', sysdate );
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000029','CODEL-000007','CPN','사용가능','Y','사용가능',1,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000030','CODEL-000007','CPN','만료','N','만료',2,'Y','USR-000000',sysdate,'USR-000000',sysdate);

INSERT INTO COMMON_CD_LCLS ( LCLS_ID, LCLS_NM, LCLS_CD, LCLS_EPL, USE_YN, RG_ID, RG_DT )VALUES( 'CODEL-000008', '결제상태', 'PAY', '결제상태', 'Y', 'USR-000000', sysdate );
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000031','CODEL-000008','PAY','결제완료','1','결제완료',1,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000032','CODEL-000008','PAY','취소완료','2','취소완료',2,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000033','CODEL-000008','PAY','환불신청중','3','환불신청중',3,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000034','CODEL-000008','PAY','환불완료','4','환불완료',4,'Y','USR-000000',sysdate,'USR-000000',sysdate);

INSERT INTO COMMON_CD_LCLS ( LCLS_ID, LCLS_NM, LCLS_CD, LCLS_EPL, USE_YN, RG_ID, RG_DT )VALUES( 'CODEL-000009', '결제방법', 'PBB', '결제방법', 'Y', 'USR-000000', sysdate );
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000035','CODEL-000009','PBB','신용카드','1','신용카드',1,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000036','CODEL-000009','PBB','계좌이체','2','계좌이체',2,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000037','CODEL-000009','PBB','휴대폰결제','3','휴대폰결제',3,'Y','USR-000000',sysdate,'USR-000000',sysdate);
Insert into COMMON_CD_SCLS (MCLS_ID,LCLS_ID,LCLS_CD,MCLS_NM,MCLS_CD,MCLS_EPL,ORD,USE_YN,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('CODEM-000038','CODEL-000009','PBB','삼성페이','4','삼성페이',4,'Y','USR-000000',sysdate,'USR-000000',sysdate);


Insert into RL_MNG (RL_ID,RL_CD,RL_NAME,RL_DES,RL_CLS,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('ROL-000000','unauthenticated','인증 되지 않은 사용자','인증 되지 않은 사용자','N','USR-000000',sysdate,null,null);
Insert into RL_MNG (RL_ID,RL_CD,RL_NAME,RL_DES,RL_CLS,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('ROL-000001','authenticated','회원','가입되어 승인된 일반권한','U','USR-000000',sysdate,null,null);
Insert into RL_MNG (RL_ID,RL_CD,RL_NAME,RL_DES,RL_CLS,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('ROL-000002','mento','멘토','멘토권한','M','USR-000000',sysdate,null,null);
Insert into RL_MNG (RL_ID,RL_CD,RL_NAME,RL_DES,RL_CLS,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('ROL-000003','admin','관리자권한','관리자권한','A','USR-000000',sysdate,null,null);


Insert into USERS (U_SQ, U_EMAIL, JOIN_DT, U_NM, PHONE_NO, U_PW, LOGIN_DT, U_ST) values ('USR-000000', 'beauate@naver.com', sysdate, '관리자', '01011112222', '06f1ac6173b0b9659e251e59a489078f4d60613f223410fb40c325716c9b9709', sysdate, '1');
Insert into USERS (U_SQ, U_EMAIL, JOIN_DT, U_NM, PHONE_NO, U_PW, LOGIN_DT, U_ST) values ('USR-000001', 'USR-000001', sysdate, '비회원', '01011112222', '06f1ac6173b0b9659e251e59a489078f4d60613f223410fb40c325716c9b9709', sysdate, '2');

INSERT INTO RL_USER_MPPG (MPPG_ID, RL_ID, U_SQ, RG_ID, RG_DT) VALUES ('RUM-000000', 'ROL-000003', 'USR-000000', 'admin', SYSDATE);
INSERT INTO RL_USER_MPPG (MPPG_ID, RL_ID, U_SQ, RG_ID, RG_DT) VALUES ('RUM-000001', 'ROL-000002', 'USR-000001', 'admin', SYSDATE);
INSERT INTO RL_USER_MPPG (MPPG_ID, RL_ID, U_SQ, RG_ID, RG_DT) VALUES ('RUM-000002', 'ROL-000001', 'USR-000002', 'admin', SYSDATE);
INSERT INTO RL_USER_MPPG (MPPG_ID, RL_ID, U_SQ, RG_ID, RG_DT) VALUES ('RUM-000003', 'ROL-000000', 'USR-000003', 'admin', SYSDATE);
INSERT INTO RL_USER_MPPG (MPPG_ID, RL_ID, U_SQ, RG_ID, RG_DT) VALUES ('RUM-000004', 'ROL-000003', 'USR-000004', 'admin', SYSDATE);
INSERT INTO RL_USER_MPPG (MPPG_ID, RL_ID, U_SQ, RG_ID, RG_DT) VALUES ('RUM-000005', 'ROL-000002', 'USR-000005', 'admin', SYSDATE);
INSERT INTO RL_USER_MPPG (MPPG_ID, RL_ID, U_SQ, RG_ID, RG_DT) VALUES ('RUM-000006', 'ROL-000001', 'USR-000006', 'admin', SYSDATE);

INSERT INTO PRM_MNG (PGM_ID, PGM_NAME, PGM_URL, PGM_DES, PGM_PARAM, RG_ID, RG_DT) VALUES ('PRG-000000', '프로그램관리', '/program/r/m/selectProgramList.do', '프로그램관리', 'program', 'admin', sysdate);
INSERT INTO PRM_MNG (PGM_ID, PGM_NAME, PGM_URL, PGM_DES, PGM_PARAM, RG_ID, RG_DT) VALUES ('PRG-000001', '권한그룹관리', '/role/r/m/selectRoleGroupList.do', '권한그룹관리', 'role', 'admin', sysdate);
INSERT INTO PRM_MNG (PGM_ID, PGM_NAME, PGM_URL, PGM_DES, PGM_PARAM, RG_ID, RG_DT) VALUES ('PRG-000002', '권한사용자관리', '/roleuser/z/m/selectRoleUserList.do', '권한사용자관리', 'roleuser', 'admin', sysdate);
INSERT INTO PRM_MNG (PGM_ID, PGM_NAME, PGM_URL, PGM_DES, PGM_PARAM, RG_ID, RG_DT) VALUES ('PRG-000003', '사용자별권한관리', '/userrole/z/m/selectUserRoleList.do', '사용자별권한관리', 'userrole', 'admin', sysdate);
INSERT INTO PRM_MNG (PGM_ID, PGM_NAME, PGM_URL, PGM_DES, PGM_PARAM, RG_ID, RG_DT) VALUES ('PRG-000004', '사용자관리', '/usermgr/r/m/userList.do', '사용자관리', 'usermgr', 'admin', sysdate);
INSERT INTO PRM_MNG (PGM_ID, PGM_NAME, PGM_URL, PGM_DES, PGM_PARAM, RG_ID, RG_DT) VALUES ('PRG-000005', '메뉴관리', '/menu/r/m/selectMenuList.do', '메뉴관리', 'menu', 'admin', sysdate);
INSERT INTO PRM_MNG (PGM_ID, PGM_NAME, PGM_URL, PGM_DES, PGM_PARAM, RG_ID, RG_DT) VALUES ('PRG-000006', '공통코드관리', '/code/r/m/selectCodeManageList.do', '공통코드관리', 'code', 'admin', sysdate);
INSERT INTO PRM_MNG (PGM_ID, PGM_NAME, PGM_URL, PGM_DES, PGM_PARAM, RG_ID, RG_DT) VALUES ('PRG-000007', '메인', '/home/a/t/main.do', '메인', 'home', 'admin', sysdate);

Insert into MENU_MNG (MENU_ID,MENU_DIV,MENU_NAME,MENU_DES,UPR_MENU_ID,MENU_LUP,PGM_ID,OT_URL,USE_YN,MENU_LVL,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('MEN-000000','1','일반메뉴','일반메뉴들의최상위메뉴',null,null,null,null,null,1,'enki',sysdate,null,null);
Insert into MENU_MNG (MENU_ID,MENU_DIV,MENU_NAME,MENU_DES,UPR_MENU_ID,MENU_LUP,PGM_ID,OT_URL,USE_YN,MENU_LVL,RG_ID,RG_DT,MOD_ID,MOD_DT) values ('MEN-000001','2','관리자메뉴','관리자메뉴의 최상위 메뉴',null,null,null,null,null,1,'enki',sysdate,null,null);

