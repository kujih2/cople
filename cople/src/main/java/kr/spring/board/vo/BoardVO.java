package kr.spring.board.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;

import kr.spring.util.DurationFromNow;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	private int board_num;
	private int board_status;//글의 상태 0:일반글, 1:블라인글, 2:신고처리완료글, 9:관리자 글
	private String save_temp;//글 임시저장 여부
	@NotBlank
	private String title;
	@NotBlank
	private String content;
	private int hit;
	private String reg_date;
	private String modify_date;
	private String ip;
	private int mem_num;

	private String id;
	private String nick_name;
	private int auth;
	
	private int favhate_cnt;//좋아요/싫어요 합
	
	public void setReg_date(String reg_date) {
		this.reg_date = DurationFromNow.getTimeDiffLabel(reg_date);
	}
}
