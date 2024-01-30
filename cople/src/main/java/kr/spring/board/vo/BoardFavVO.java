package kr.spring.board.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardFavVO {
	private int board_num;
	private int mem_num;
	private int re_num;
	private int re_sub_num;
	private int fav_status;
	private Date fav_date;
}
