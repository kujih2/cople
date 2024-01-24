package kr.spring.matching.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.matching.vo.EmpVO;

@Mapper
public interface MatchingMapper {
	
	public void insertEmp(EmpVO empVO);
	
}
