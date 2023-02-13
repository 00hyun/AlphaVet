package kr.co.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

import kr.co.vo.MemPatiVO;
import kr.co.vo.PatientVO;

@Mapper
public interface PatientMapper {

	public PatientVO selectPatient(String patId) throws Exception;
	
	// 내부 조인을 이용하고,
	// 오늘 한 의사에게 진료 중인 조건의 환자 데이터를 가져오는 인터페이스
	public PatientVO selectPatientInMedic(String empId) throws Exception;

	public List<MemPatiVO> patientList();	// patient와 member가 조인된 리스트를 가져오는 함수
	
	public MemPatiVO selectPat(String patId);	// 한 명의 환자의 patient 데이터와 member 데이터를 가져오는 함수
	
}
