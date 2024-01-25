package kr.spring.matching.service;

import java.util.List;
import java.util.Map;

import kr.spring.matching.vo.EmpVO;

public interface MatchingService {
	public void insertEmp(EmpVO empVO);
	public List<EmpVO> listEmp(Map<String,Object> map);
	public EmpVO selectEmp(int mem_num);
	public int selectEmpCount();
}
