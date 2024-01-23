package kr.spring.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.spring.board.vo.BoardVO;

@Mapper
public interface BoardMapper {
	//작성글
		public List<BoardVO> selectList(Map<String,Object> map);
		public int selectRowCount(Map<String,Object> map);
		public void insertBoard(BoardVO board);
		public BoardVO selectBoard(int board_num);
		public void updateHit(int board_num);
		public void updateBoard(BoardVO board);
		public void deleteBoard(int board_num);
		public void deleteFile(int board_num);
}
