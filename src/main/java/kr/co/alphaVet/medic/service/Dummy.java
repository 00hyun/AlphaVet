package kr.co.alphaVet.medic.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import kr.co.vo.EmpAuthVO;
import kr.co.vo.EmpVO;
import kr.co.vo.Pra_RoomVO;

public class Dummy {

	public List<Pra_RoomVO> PraRoomList() throws Exception {
		List<Pra_RoomVO> list = new ArrayList<>();
		Pra_RoomVO praRoomVO = new Pra_RoomVO();

		praRoomVO.setPraRoomNm(1);
		praRoomVO.setEmpId("e002");
		praRoomVO.setEmpName("나의사");
		praRoomVO.setCliCd("h001");
		praRoomVO.setAnimalCd("cat");

		list.add(praRoomVO);

		return list;
	}

	public Pra_RoomVO selectPraRoom(String empId) {
		// TODO Auto-generated method stub
		return null;
	}

}
