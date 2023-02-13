package kr.co.alphaVet.admin.chart;

import java.util.List;
import java.util.Map;

public interface ChartService {
	public List<Map<String, Object>> animalTypeCnt(Map<String, Object> dataMap) throws Exception ;
	public List<Map<String, Object>> daysPayment(Map<String, Object> dataMap) throws Exception ;
	public List<Map<String, Object>> daysPra(Map<String, Object> dataMap) throws Exception ;
	public List<Map<String, Object>> drugCnt(Map<String, Object> dataMap) throws Exception ;
	public List<Map<String, Object>> praCntByEmp(Map<String, Object> dataMap) throws Exception;
}
