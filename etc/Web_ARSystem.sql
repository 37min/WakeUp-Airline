=============================================================================================
# Members TABLE
=============================================================================================
mNo, mId, mPw, mKorName, mEngLastName, mEngMidName, mSex, mAddress, mMobilePhone, mEmail

mNo (ȸ����ȣ, oracle sequence)
mId 							(���̵�, ����ũ)
mPw 							(���)
mKorName 					(�ѱ��̸�)
mEngLastName 			(������ ��)
mEngMidName 			(������ �̸�)
mSex 							(����)       0: ����, 1: ����
mAddress 					(�ּ�)
mMobilePhone 			(����)
mEmail 						(�̸�)

CREATE TABLE members
(
mNo NUMBER, --(ȸ����ȣ, oracle sequence)
mId VARCHAR2(20) UNIQUE,        --(���̵�, ����ũ)
mPw VARCHAR2(20) NOT NULL,        --(���)
mKorName VARCHAR2(20) NOT NULL,      --(�ѱ��̸�)
mEngLastName VARCHAR2(20) NOT NULL,    --(������ ��)
mEngMidName VARCHAR2(20) NOT NULL,    --(������ �̸�)
mSex NUMBER(1) NOT NULL,        --(����)
mAddress VARCHAR2(20) NOT NULL,      --(�ּ�)
mMobilePhone VARCHAR2(20) NOT NULL,    --(����)
mEmail  VARCHAR2(20) NOT NULL,      --(�̸�)
mMileage NUMBER DEFAULT 10000  --(���ϸ���)
);

INSERT INTO members(mNo, mId, mPw, mKorName, mEngLastName, mEngMidName, mSex, mAddress, mMobilePhone, mEmail)
            VALUES(SEQ_MNO.NEXTVAL,
            		   'taeja83',
                   'taeja83',
                   '������',
                   'Jho',
                   'Yoonjin',
                   0,
                   'â�ڸ� �����ٰ� ������ �簡�Ҷ���~',
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
# ���� ����Ʈ : ����/����/�λ�
# ������ ���� 9�ú��� ���� 18�ñ��� �Ž� 10�и��� ����ϵ��� �Ѵ�.
# ����ð��� 1�ð����� �Ѵ�. ������.
# �¼������ ���� ��� �����ϵ��� ����.
# ���� ����/�Ƶ����� �з��ϰ�, �Ƶ��� ���ο���� 50% �������� ������.
# �¼����� �⺻ 10�ڸ��� ����.
schNo 					(�������ȣ, oracle sequence)
schApName 			(������)
schDepartDate	 	(��Ʈ������ ó������)
schDepartTime 	(�Ž� 10�и��� ���)
schArrivalTime 	(��߽ð� + 1�ð�)
schFare 				(�Ϲݿ��, ������ 10�������� ����.)
schSeat 				(�¼��� 10)
schSeatResv			(����� �¼���, DEFAULT 0 )

CREATE TABLE flightSchedule
(
  schNo NUMBER(20) PRIMARY KEY,   --(�������ȣ, oracle sequence)
  schApName VARCHAR2(50),         --(������)
  schDepartDate VARCHAR2(50),     --(��Ʈ������ ó������)
  schDepartTime VARCHAR2(50),     --(�Ž� 10�и��� ���)
  schArrivalTime VARCHAR2(50),    --(��߽ð� + 1�ð�)
  schFare NUMBER(20) NOT NULL,    --(�Ϲݿ��, ������ 10�������� ����)
  shcSeat NUMBER(20) NOT NULL,    --(�¼���)
  schSeatResv NUMBER(20) NOT NULL --(����� �¼���, DEFAULT 0 )
);

CREATE SEQUENCE SEQ_schNo
START WITH 1
INCREMENT BY 1;

commit
=============================================================================================
# ReservList TABLE
=============================================================================================
# �����ȣ�� oracle SEQUENCE �̿�����.
# ������ ��ȣ�� FOREIGN KEY �� ����.
# ���� ID�� ��������.
# ������/���/���Ϸ� ���ڱ� ���¸� ������ �ִ´�.
# �����ȸ�� �������ΰ͸� �������� �ϸ�, �������ΰ��� ��Ұ����ؾ���.
# ������ ��ȸ�� �Ʒ��� ���� �׸��� ȭ�鿡 �����־�� �Ѵ�.
# �����ȣ, ������, �����, ������,  �����, ��߽ð�, �����ð�, �����ںз�(����/�Ƶ�), ���, �������
rNo (�����ȣ)
rScheNo(������ ��ȣ, fk)
rMemberId(���� ID)
rState (�������)

CREATE TABLE ReservList
(
rNo NUMBER NOT NULL, --(�����ȣ)
rScheNo NUMBER NOT NULL, --(������ ��ȣ, fk)
rMemberId VARCHAR2(20) NOT NULL, --(���� ID)
rState VARCHAR2(20) NOT NULL--(�������)
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