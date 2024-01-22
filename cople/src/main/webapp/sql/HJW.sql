--회원관리
create table member(
 mem_num number not null,
 id varchar2(12) unique not null,
 nick_name varchar2(30),
 auth number(1) default 1 not null, --0:탈퇴회원,1:일반회원,2:현직자,3:강사,4:정지회원,9:관리자
 constraint member_pk primary key (mem_num)
);

create table member_detail(
 mem_num number not null,
 au_id varchar2(36) unique,
 name varchar2(30) not null,
 passwd varchar2(35) not null,
 phone varchar2(15) not null,
 email varchar2(50) not null,
 birth varchar2(10) not null,
 gender varchar2(1) not null,
 zipcode varchar2(5) not null,
 address1 varchar2(90) not null,
 address2 varchar2(90) not null,
 push varchar2(1) not null,
 photo blob,
 photo_name varchar2(100),
 certify_photo_name varchar2(100),
 market_score number default 36 not null,
 reg_date date default sysdate not null,
 modify_date date,
 constraint member_detail_pk primary key (mem_num),
 constraint member_detail_fk foreign key (mem_num) 
                               references spmember (mem_num)
);

create sequence member_seq;
