package kr.spring.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.board.dao.BoardMapper;
import kr.spring.board.vo.BoardFavVO;
import kr.spring.board.vo.BoardReplyVO;
import kr.spring.board.vo.BoardVO;

@Service
@Transactional
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardMapper boardMapper;
	
	/*---------------
	 * 게시판
	 *---------------*/
	@Override
	public List<BoardVO> selectList(Map<String, Object> map) {
		return boardMapper.selectList(map);
	}
	@Override
	public int selectRowCount(Map<String, Object> map) {
		return boardMapper.selectRowCount(map);
	}
	@Override
	public void insertBoard(BoardVO board) {
		boardMapper.insertBoard(board);
	}
	@Override
	public BoardVO detailBoard(int board_num) {
		return boardMapper.detailBoard(board_num);
	}
	@Override
	public void updateHit(int board_num) {
		boardMapper.updateHit(board_num);
	}
	@Override
	public void updateBoard(BoardVO board) {
		boardMapper.updateBoard(board);
	}
	@Override
	public void deleteBoard(int board_num) {
		boardMapper.deleteBoard(board_num);
	}
	
	/*---------------
	 * 좋아요
	 *---------------*/
	@Override
	public BoardFavVO selectFav(BoardFavVO fav) {
		return boardMapper.selectFav(fav);
	}
	@Override
	public int selectFavCount(int board_num) {
		return boardMapper.selectFavCount(board_num);
	}
	@Override
	public int selectHateCount(int board_num) {
		return boardMapper.selectHateCount(board_num);
	}
	@Override
	public int selectFavHateSum(int board_num) {
		return boardMapper.selectFavHateSum(board_num);
	}
	@Override
	public void insertFav(BoardFavVO fav) {
		boardMapper.insertFav(fav);
	}
	@Override
	public void switchFav(BoardFavVO fav) {
		boardMapper.switchFav(fav);
	}
	@Override
	public void updateFav(BoardFavVO fav) {
		boardMapper.updateFav(fav);
	}
	@Override
	public void deleteFav(BoardFavVO boardFav) {
		boardMapper.deleteFav(boardFav);
	}
	
	/*---------------
	 * 댓글
	 *---------------*/
	@Override
	public List<BoardReplyVO> selectListReply(Map<String, Object> map) {
		return boardMapper.selectListReply(map);
	}
	@Override
	public int selectRowCountReply(Map<String, Object> map) {
		return boardMapper.selectRowCountReply(map);
	}
	@Override
	public BoardReplyVO selectReply(int re_num) {
		return boardMapper.selectReply(re_num);
	}
	@Override
	public void insertReply(BoardReplyVO boardReplyVO) {
		boardMapper.insertReply(boardReplyVO);
	}
	@Override
	public void insertReplies(BoardReplyVO boardReplyVO) {
		boardMapper.insertReplies(boardReplyVO);
	}
	@Override
	public void updateReply(BoardReplyVO boardReplyVO) {
		// TODO Auto-generated method stub
	}
	
	//마이 페이지
	@Override
	public List<BoardVO> selectWriter(Map<String, Object> map) {
		return boardMapper.selectWriter(map);
	}
	@Override
	public int selectWriterRowCount(Map<String, Object> map) {
		return boardMapper.selectWriterRowCount(map);
	}
	
}
