package kr.spring.matching.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.matching.vo.EmpVO;

@Mapper
public interface MatchingMapper {
	
	public void insertEmp(EmpVO empVO);
	public List<EmpVO> listEmp(Map<String,Object> map);
	@Select("SELECT count(*) FROM emp JOIN member USING(mem_num) WHERE auth=2")
	public int selectEmpCount();
	@Select("SELECT * FROM emp WHERE mem_num=#{mem_num}")
	public EmpVO selectEmp(int mem_num);

}
