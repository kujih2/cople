package kr.spring.matching.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmpVO {
	
	private int emp_num;
	private int comsize_status;
	private String comsize;
	private int compeople_status;
	private String compeople;
	private int field_status;
	private int field;
	private int role_status;
	private String role;
	private int career_status;
	private String career;
	private int salary_status;
	private String salary;
	private int periodtime_status;
	private String periodtime;
	private int education_status;
	private String education;
	private int major_status;
	private String major;
	private int certification_status;
	private String certification;
	private int location_status;
	private String location;
	private String location_api;
	private int workstart_status;
	private String workstart;
	
	private int mem_num;
	private String filename;
	private MultipartFile upload;
	private String advice;
	
	
}
