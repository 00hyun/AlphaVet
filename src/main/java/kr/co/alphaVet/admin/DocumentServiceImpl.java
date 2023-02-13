package kr.co.alphaVet.admin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.vo.DocumentVO;
import kr.common.CommonDao;

@Service
public class DocumentServiceImpl implements DocumentService{

	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	@Override
	public List<DocumentVO> docList() {
		return commonDao.selectList("documentMapper_selectDocList");
	}
}
