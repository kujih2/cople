package kr.spring.board.service;

import java.util.List;
import java.util.Map;

import kr.spring.board.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertBoard(BoardVO board);
	public BoardVO detailBoard(int board_num);
	public void updateHit(int board_num);
	public void updateBoard(BoardVO board);
	public void deleteBoard(int board_num);
}
