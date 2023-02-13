package kr.co.alphaVet.test.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mapper.MediTestMapper;

@Service
public class TestServiceImpl implements TestService {

	@Inject
	private MediTestMapper mapper;

	@Override
	public int insertProfileImg(String filePath) throws Exception {
		return mapper.uploadFile(filePath);
	}

	@Override
	public List<Map<String, String>> selectFile() throws Exception {
		return mapper.selectFile();
	}
	
}
