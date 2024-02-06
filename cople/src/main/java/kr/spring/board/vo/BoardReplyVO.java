package kr.spring.board.vo;

import kr.spring.util.DurationFromNow;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardReplyVO {
	private int re_num;
	private int re_parent_num;
	private String re_content;
	private int re_depth;
	private String re_rdate;
	private String re_mdate;
	private String re_ip;
	private int re_isdeleted;
	private int board_num;
	private int mem_num;
	
	private String id;
	private String nick_name;
	
	public void setRe_rdate(String re_rdate) {
		this.re_rdate = DurationFromNow.getTimeDiffLabel(re_rdate);
	}
	
	public void setRe_mdate(String re_mdate) {
		this.re_mdate = DurationFromNow.getTimeDiffLabel(re_mdate);
	}
	
}
