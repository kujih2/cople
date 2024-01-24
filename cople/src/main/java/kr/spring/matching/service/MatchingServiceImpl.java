package kr.spring.matching.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.matching.dao.MatchingMapper;
import kr.spring.matching.vo.EmpVO;

@Service
@Transactional
public class MatchingServiceImpl implements MatchingService{
	
	@Autowired
	MatchingMapper machingMapper;
	
	@Override
	public void insertEmp(EmpVO empVO) {
		machingMapper.insertEmp(empVO);
	}

}
