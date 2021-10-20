package kr.or.ddit.freeboard.service;

import java.util.List;

import kr.or.ddit.freeboard.vo.FreeboardVO;

public interface FreeboardService {
	//메소드 시그니처
	List<FreeboardVO> list();
	
	//자유게시판(FreeboardVO) 상세보기
	FreeboardVO detail(String rnum);

	//자유게시글 변경
	int update(FreeboardVO freeboardVo);

	//자우게시글 댓글 등록
	int reInsert(FreeboardVO freeboardVo);

	//댓글 목록
	List<FreeboardVO> reList(String pNum);

}
