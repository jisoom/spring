package kr.or.ddit.cus.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.cus.mapper.CusMapper;
import kr.or.ddit.cus.service.CusService;
import kr.or.ddit.cus.vo.CusVO;

@Service
public class CusServiceImpl implements CusService{
	
	@Autowired
	private CusMapper cusMapper;
	
	//고객 테이블(CUS)로 insert
	@Override
	public int insert(CusVO cusVo) throws Exception {
		
		int affectedRowCnt = this.cusMapper.insert(cusVo);
		if(affectedRowCnt > 0) { //성공
			return cusVo.getCusNum(); //고객번호 리턴
		}else { //실패
			return 0;
		}
		
	}
	
	//고객 정보 상세보기
	@Override
	public CusVO detail(String cusNum) throws Exception {
		return this.cusMapper.detail(cusNum);
	}
	
	//고객 정보 수정(이미지 변경 안함)
	@Override
	public int update(CusVO cusVo) throws Exception {
		return this.cusMapper.update(cusVo);
	}
	
	//고객 정보 수정(이미지 변경)
	@Override
	public int updateWithImage(CusVO cusVo) throws Exception {
		return this.cusMapper.updateWithImage(cusVo);
	};
	
	//고객 목록 조회
	@Override
	public List<CusVO> selectAllList(Map<String, Object> map) throws Exception {
		return this.cusMapper.selectAllList(map);
	}
	
	//CUS테이블의 전체 행의 수
	@Override
	public int cusTotal(Map<String, Object> map) throws Exception{
		return this.cusMapper.cusTotal(map);
	}
	
	//고객정보 삭제
	@Override
	public int delete(String cusNum) throws Exception {
		return this.cusMapper.delete(cusNum);
	};
	
	//특정 고객이 소유하고 있는 자동차 댓수(몇 대인지)
	@Override
	public int selectCountCar(String cusNum) throws Exception{
		return this.cusMapper.selectCountCar(cusNum);
	};
}
