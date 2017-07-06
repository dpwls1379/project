create table Gmember(
	id 			varchar2(20) 	primary key,
	pass 		varchar2(30) 	not null,
	name 		varchar2(10) 	not null,
	addr 		varchar2(50) 	not null,
	tel 		varchar2(20)	not null,
	email 		varchar2(50) 	not null,
	gender 		char(1) 		not null,
	birthday 	varchar2(8) 			
);

create table Gproduct(
	pro_num number primary key,
	pro_cate varchar2(30) not null,
	pro_name varchar2(30) not null,
	pro_price number not null,
	pro_sale number default 0,
	pro_info varchar2(4000) not null,
	pro_image varchar2(20) default 'default.jpg',
	pro_date date not null,
	pro_count number not null,
	pro_sell number default 0,
	pro_read number default 0
);

create table Gboardo(
	bo_num number primary key,		
	bo_subject varchar2(30) not null,
	bo_content varchar2(4000) not null,
	bo_date date not null,
	bo_image varchar2(30) default 'default.jpg',
	bo_read number default 0,
	bo_star number default 0,
	bo_del char(1) default 'n',
	id varchar2(20), 
	pro_num number references Gproduct(pro_num)
);
-- 아직 아이디 연동은 안한 상태라 id컬럼 그냥 생성
alter table Gboardo add foreign key (id) references Gmember(id);

create table Gboardx(
	bx_num number primary key,
	bx_subject varchar2(30) not null,	
	bx_content varchar2(4000) not null,
	bx_categ varchar2(30) not null,
	bx_date date not null,
	bx_read number default 0,
	bx_del char(1) default 'n',
	id varchar2(20) references Gmember(id),
	bn_num number default 1,
	bq_num number default 1,
	bx_rep number default 0
);
-- bn_num은 공지게시판번호, bq_num은 qna게시판번호

create sequence bq_num nocache;
create sequence bn_num nocache;
drop sequence bq_num;
drop sequence bn_num;
-- 시퀀스로 번호 증가설정

create table Greplyo (
	reo_num number primary key,
	reo_content varchar2(100) not null,
	reo_date date not null,
	reo_del char(1) default 'n',	
	bo_num number references Gboardo(bo_num),
	id varchar2(20)  references Gmember(id)
);
-- 상품평가쪽 댓글 게시판(삭제예정)--

create table Greplyx (
	rex_num number primary key,
	rex_content varchar2(100) not null,
	rex_date date not null,
	rex_del char(1) default 'n',
	id varchar2(20)  references Gmember(id),
	bx_num number references Gboardx(bx_num)
);
-- qna게시판쪽 댓글게시판

create table Gcart (
	ct_num number primary key,
	ct_del char(1) default 'n',
	pro_num number references Gproduct(pro_num),
	id varchar2(20) references Gmember(id),
	ct_count number
);

select * from Gcart;
-- gcart에 구매 완료 표시를 위해 ct_del 컬럼 추가!



create table Gbuy (
	buy_num number primary key,
	buy_addr varchar2(50) not null,
	buy_memo varchar2(80) default 'nothing',
	buy_date date not null,
	buy_deli varchar2(30),
	ct_num number references Gcart(ct_num),
	pro_num number references Gproduct(pro_num),
	id varchar2(20)  references Gmember(id)
);
-- buy_price 지움
-- 07/05 ct_num references연결(수정), buy_deli 컬럼추가

select * from Gcart natural join Gproduct where id='master';

create table Gevent(
	ev_num number default 1 primary key,
	ev_subject varchar2(30) not null,	
	ev_content varchar2(4000) not null,
	ev_image varchar2(30) default 'default.jpg',
	ev_date date not null,
	ev_read number default 0,
	ev_del char(1) default 'n'
);
select * from Gevent;
alter table Gevent modify ev_subject varchar2(100);
alter table Gevent modify ev_image varchar2(100);
