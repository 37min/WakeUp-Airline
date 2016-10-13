=============================================================================================
# Members TABLE
=============================================================================================
mNo, mId, mPw, mKorName, mEngLastName, mEngMidName, mSex, mAddress, mMobilePhone, mEmail

mNo (회원번호, oracle sequence)
mId 							(아이디, 유니크)
mPw 							(비번)
mKorName 					(한국이름)
mEngLastName 			(영문명 성)
mEngMidName 			(영문명 이름)
mSex 							(성별)       0: 남자, 1: 여자
mAddress 					(주소)
mMobilePhone 			(핸폰)
mEmail 						(이멜)

CREATE TABLE members
(
mNo NUMBER, --(회원번호, oracle sequence)
mId VARCHAR2(20) UNIQUE,        --(아이디, 유니크)
mPw VARCHAR2(20) NOT NULL,        --(비번)
mKorName VARCHAR2(20) NOT NULL,      --(한국이름)
mEngLastName VARCHAR2(20) NOT NULL,    --(영문명 성)
mEngMidName VARCHAR2(20) NOT NULL,    --(영문명 이름)
mSex NUMBER(1) NOT NULL,        --(성별)
mAddress VARCHAR2(20) NOT NULL,      --(주소)
mMobilePhone VARCHAR2(20) NOT NULL,    --(핸폰)
mEmail  VARCHAR2(20) NOT NULL,      --(이멜)
mMileage NUMBER DEFAULT 10000  --(마일리지)
);

INSERT INTO members(mNo, mId, mPw, mKorName, mEngLastName, mEngMidName, mSex, mAddress, mMobilePhone, mEmail)
            VALUES(SEQ_MNO.NEXTVAL,
            		   'taeja83',
                   'taeja83',
                   '조윤진',
                   'Jho',
                   'Yoonjin',
                   0,
                   '창자를 꺼내다가 젓깔을 당가불랑게~',
                   '010-3072-7276',
                   'taeja83@nate.com'
                   );

CREATE SEQUENCE SEQ_mNo
    START WITH 1
    INCREMENT BY 1;

SELECT * FROM members;

commit
=============================================================================================
# FlightSchedule table
=============================================================================================
# 공항 리스트 : 김포/제주/부산
# 비행기는 오전 9시부터 오후 18시까지 매시 10분마다 출발하도록 한다.
# 비행시간은 1시간으로 한다. 무조건.
# 좌석등급은 없고 모두 동일하도록 하자.
# 고객은 성인/아동으로 분류하고, 아동은 성인요금의 50% 운임으로 정하자.
# 좌석수는 기본 10자리로 하자.
schNo 					(스케쥴번호, oracle sequence)
schApName 			(비행기명)
schDepartDate	 	(스트링으로 처리하자)
schDepartTime 	(매시 10분마다 출발)
schArrivalTime 	(출발시간 + 1시간)
schFare 				(일반요금, 무조건 10만원으로 하자.)
schSeat 				(좌석수 10)
schSeatResv			(예약된 좌석수, DEFAULT 0 )

CREATE TABLE flightSchedule
(
  schNo NUMBER(20) PRIMARY KEY,   --(스케쥴번호, oracle sequence)
  schApName VARCHAR2(50),         --(비행기명)
  schDepartDate VARCHAR2(50),     --(스트링으로 처리하자)
  schDepartTime VARCHAR2(50),     --(매시 10분마다 출발)
  schArrivalTime VARCHAR2(50),    --(출발시간 + 1시간)
  schFare NUMBER(20) NOT NULL,    --(일반요금, 무조건 10만원으로 하자)
  shcSeat NUMBER(20) NOT NULL,    --(좌석수)
  schSeatResv NUMBER(20) NOT NULL --(예약된 좌석수, DEFAULT 0 )
);

CREATE SEQUENCE SEQ_schNo
START WITH 1
INCREMENT BY 1;

commit
=============================================================================================
# ReservList TABLE
=============================================================================================
# 예약번호는 oracle SEQUENCE 이용하자.
# 스케쥴 번호를 FOREIGN KEY 로 잡자.
# 고객의 ID를 참조하자.
# 예약중/취소/사용완료 세자기 상태를 가지고 있는다.
# 목록조회시 예약중인것만 나오도록 하며, 예약중인것은 취소가능해야함.
# 예약목록 조회시 아래와 같은 항목을 화면에 보여주어야 한다.
# 예약번호, 비행기명, 출발지, 도착지,  출발일, 출발시간, 도착시간, 예약자분류(성인/아동), 요금, 예약상태
rNo (예약번호)
rScheNo(스케쥴 번호, fk)
rMemberId(고객의 ID)
rState (예약상태)

CREATE TABLE ReservList
(
rNo NUMBER NOT NULL, --(예약번호)
rScheNo NUMBER NOT NULL, --(스케쥴 번호, fk)
rMemberId VARCHAR2(20) NOT NULL, --(고객의 ID)
rState VARCHAR2(20) NOT NULL--(예약상태)
);

CREATE SEQUENCE SEQ_rNo
    START WITH 1
    INCREMENT BY 1;

ALTER TABLE ReservList
add CONSTRAINT fk_supplier
  FOREIGN KEY (rScheNo)
  REFERENCES FlightSchedule(schNo);

commit

COMMIT;