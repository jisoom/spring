package kr.or.ddit.freeboard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.freeboard.mapper.FreeboardMapper;
import kr.or.ddit.freeboard.service.FreeboardService;
import kr.or.ddit.freeboard.vo.FreeboardVO;

@Service
public class FreeboardServiceImpl implements FreeboardService {
	@Autowired
	FreeboardMapper freeboardMapper;
	
	@Override
	public List<FreeboardVO> list(){
		return freeboardMapper.list();
	}
	
	//자유게시판(FreeboardVO) 상세보기
	@Override
	public FreeboardVO detail(String rnum) {
		return this.freeboardMapper.detail(rnum);
	}
	
	//자유게시글 변경
	@Override
	public int update(FreeboardVO freeboardVo) {
		return freeboardMapper.update(freeboardVo);
	}
	
	//자유게시글 댓글 등록
	@Override
	public int reInsert(FreeboardVO freeboardVo) {
		return freeboardMapper.reInsert(freeboardVo);
	}
	
	//댓글 목록
	@Override
	public List<FreeboardVO> reList(String pNum){
		return freeboardMapper.reList(pNum);
	}
}









