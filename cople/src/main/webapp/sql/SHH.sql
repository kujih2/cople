create table commu_board(
 board_num number not null,
 board_status number(1) not null,
 save_temp number(1) not null,
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