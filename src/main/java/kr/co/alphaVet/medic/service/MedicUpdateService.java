package kr.co.alphaVet.medic.service;

import java.util.Map;

public interface MedicUpdateService {

	public String conductReceiptStatus(String recNm, String patId)
			throws Exception;

	public String medicOut(Map<String, Object> json, String empId)
			throws Exception;

}
