package kr.or.ddit.cus.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.cus.vo.CusVO;

public interface CusMapper {
	
	//고객 등록
	int insert(CusVO cusVo);
	
	//고객정보 상세보기
	CusVO detail(String cusNum);
	
	//고객정보 수정(이미지 변경 안함)
	int update(CusVO cusVo);
	
	//고객정보 수정(이미지 변경)
	int updateWithImage(CusVO cusVo);
	
	//고객 목록 조회
	List<CusVO> selectAllList(Map<String, Object> map);
	
	//CUS테이블의 전체 행의 수
	int cusTotal(Map<String, Object> map);
	
	//고객정보 삭제
	int delete(String cusNum);
	
	//특정 고객이 소유하고 있는 자동차 댓수(몇 대인지)
	int selectCountCar(String cusNum);
}
