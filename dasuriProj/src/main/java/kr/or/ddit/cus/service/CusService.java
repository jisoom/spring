package kr.or.ddit.cus.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.cus.vo.CusVO;

public interface CusService {

	//메소드 시그니처
	public int insert(CusVO cusVo) throws Exception;

	public CusVO detail(String cusNum) throws Exception;

	public int update(CusVO cusVo) throws Exception;

	public int updateWithImage(CusVO cusVo) throws Exception;

	public List<CusVO> selectAllList(Map<String, Object> map) throws Exception;

	public int cusTotal(Map<String, Object> map) throws Exception;

	public int delete(String cusNum) throws Exception;

	public int selectCountCar(String cusNum) throws Exception;

}
