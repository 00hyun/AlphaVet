package kr.co.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.ReceiptVO;

@Mapper
public interface ReceiptMapper {

	public ReceiptVO selectReceipt(int recNm) throws Exception;

	public ReceiptVO selectReceiptInMedic(String patId) throws Exception;

	public int updateInStatus(Map<String, Object> queryParams) throws Exception;

	public int updateOutStatus(Map<String, Object> recParams) throws Exception;

}
