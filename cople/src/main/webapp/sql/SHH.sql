--게시판 메인
create table commu_board(
 board_num number not null,
 board_status number(1) default 0 not null,
 save_temp varchar2(1 char) default 'N' not null,
 title varchar2(90) not null,
 content clob not null,
 hit number(8) default 0 not null,
 reg_date date default sysdate not null,
 modify_date date,
 ip varchar2(40) not null,
 mem_num number not null,
 constraint commu_board_pk primary key (board_num),
 constraint commu_board_fk foreign key (mem_num) references member (mem_num)
);
create sequence commu_board_seq;

--게시판 좋아요/싫어요 
create table commu_fav(
 board_num number not null,
 mem_num number not null,
 re_num number,
 re_sub_num number,
 fav_status number default 0 not null,
 fav_date date default sysdate not null,
 constraint fav_commu_board_fk1 foreign key (board_num) references commu_board (board_num) ON DELETE CASCADE,
 constraint fav_member_fk2 foreign key (mem_num) references member (mem_num) ON DELETE CASCADE
);

--게시판 댓글
create table commu_reply(
 re_num number not null,
 content varchar2(900) not null,
 reg_date date default sysdate not null,
 modify_date date,
 ip varchar2(40) not null,
 report_status number(1) default 0 not null,
 board_num number not null,
 mem_num number not null,
 constraint re
);