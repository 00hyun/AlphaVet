package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.vo.VaccineDetailVO;

@Mapper
public interface VaccineDetailMapper {

	public int selectDay(int vdNm) throws Exception;

	public List<VaccineDetailVO> selectVaccineList() throws Exception;

	public VaccineDetailVO selectVaccineByVdNm(int vdNm) throws Exception;

}
