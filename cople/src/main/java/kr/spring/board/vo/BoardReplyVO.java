package kr.spring.board.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardReplyVO {
	private int re_num;
	private  String re_content;
	private int re_group_num;
	private int re_group_order;
	private int re_depth;
	private Date re_rdate;
	private Date re_mdate;
	private String re_ip;
	private int report_status;
	private int re_isdeleted;
	private int board_num;
	private int mem_num;
	
}
