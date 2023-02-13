package kr.co.alphaVet.test.service;

import java.util.List;
import java.util.Map;

public interface TestService {

		public int insertProfileImg(String filePath) throws Exception;

		public List<Map<String, String>> selectFile() throws Exception;

}
