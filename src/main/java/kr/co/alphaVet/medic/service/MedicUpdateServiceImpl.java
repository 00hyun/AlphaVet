package kr.co.alphaVet.medic.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.DisDetailMapper;
import kr.co.mapper.DocDetailMapper;
import kr.co.mapper.DocFileMapper;
import kr.co.mapper.DrugMapper;
import kr.co.mapper.PraMapper;
import kr.co.mapper.PreInMapper;
import kr.co.mapper.PreOutMapper;
import kr.co.mapper.ReceiptMapper;
import kr.co.mapper.TestDetailMapper;
import kr.co.mapper.VaccineMapper;

@Service
public class MedicUpdateServiceImpl implements MedicUpdateService {

	@Inject
	private ReceiptMapper receiptMapper;

	@Inject
	private DisDetailMapper disDetailMapper;

	@Inject
	private PreOutMapper preOutMapper;

	@Inject
	private PreInMapper preInMapper;

	@Inject
	private PraMapper praMapper;

	@Inject
	private DrugMapper drugMapper;

	@Inject
	private TestDetailMapper testDetailMapper;

	@Inject
	private VaccineMapper vaccineMapper;

	@Inject
	private DocDetailMapper docDetailMapper;

	@Inject
	private DocFileMapper docFileMapper;

	@Override
	public String conductReceiptStatus(String recNm, String patId)
			throws Exception {
		Map<String, Object> queryParams = new HashMap<>();

		queryParams.put("recNm", recNm);
		queryParams.put("patId", patId);

		try {
			int checkNum = receiptMapper.updateInStatus(queryParams);

			return checkNum < 1 ? "FAILED" : "OK";
		} catch (Exception e) {
			return "FAILED";
		}

	}

	@Override
	public String medicOut(Map<String, Object> json, String empId)
			throws Exception {
		String praCon = (String) json.get("praCon");
		String recNm = (String) json.get("recNm");
		String recStatus = (String) json.get("recStatus");

		List<Map<String, String>> disArr = (List<Map<String, String>>) json
				.get("disArr");
		List<Map<String, Object>> drugArr = (List<Map<String, Object>>) json
				.get("drugArr");
		List<Map<String, Object>> testArr = (List<Map<String, Object>>) json
				.get("testArr");
		List<Map<String, Object>> vaccineArr = (List<Map<String, Object>>) json
				.get("vaccineArr");

		Map<String, Object> praConParams = new HashMap<>();
		praConParams.put("praCon", praCon);
		praConParams.put("recNm", recNm);

		praMapper.updatePraCon(praConParams);

		if (disArr != null && disArr.size() > 0) {
			for (Map<String, String> map : disArr) {
				map.put("empId", empId);
				map.put("recNm", recNm);
				disDetailMapper.insertDisDetail(map);
			}
		}

		if (drugArr != null && drugArr.size() > 0) {
			for (Map<String, Object> map : drugArr) {
				String drugIo = (String) map.get("drugIo");
				map.put("empId", empId);
				map.put("recNm", recNm);
				if ("O".equals(drugIo)) {
					preOutMapper.insertPreOut(map);
				} else if ("I".equals(drugIo)) {
					preInMapper.insertPreIn(map);
				}
				drugMapper.consumeDrug(map);
			}
			praMapper.preOutCheck(recNm);
			praMapper.calcPreInPrice(recNm);
		}

		if (testArr != null && testArr.size() > 0) {
			for (Map<String, Object> map : testArr) {
				map.put("empId", empId);
				map.put("recNm", recNm);
				testDetailMapper.insertTestDetail(map);
			}
			praMapper.calcTestDetailPrice(recNm);
		}

		if (vaccineArr != null && vaccineArr.size() > 0) {
			for (Map<String, Object> map : vaccineArr) {
				map.put("empId", empId);
				map.put("recNm", recNm);
				vaccineMapper.insertVaccine(map);
			}
			praMapper.calcVaccinePrice(recNm);
		}

		Map<String, Object> recParams = new HashMap<>();
		recParams.put("recStatus", recStatus);
		recParams.put("empId", empId);
		recParams.put("recNm", recNm);

		int checkReceipt = receiptMapper.updateOutStatus(recParams);
		
		if (checkReceipt < 1) {
			return "FAILED";
		}
		
		String praCd = praMapper.selectPraByRec(recNm).getPraCd();
		int checkDocDetail = docDetailMapper.insertDocDetail(praCd);
		
		if (checkDocDetail < 1) {
			return "FAILED";
		}
		
		int checkDocFile = docFileMapper.insertDocFile(praCd);

		if (checkDocFile < 1) {
			return "FAILED";
		} else {
			return "OK";
		}
	}

}
