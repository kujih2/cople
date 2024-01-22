package kr.spring.wiki.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WikiVO {
	private int doc_num;
	@NotBlank
	private String doc_name;
	private int update_num;
	private String update_content;
	private int doc_status;
	private int update_status;
	private int update_writer;
	private String update_summary;
	private Date update_date;
}
