package kr.co.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PraImgVO {
	private String praCd;
	private String praImg1 = "";
	private String praImg2 = "";
	private String praImg3 = "";
	private String praImg4 = "";
	private String praImg5 = "";
	private String praImg6 = "";
	private String praImg7 = "";
	private String praImg8 = "";
	private String praImg9 = "";
	private String praImg10 = "";
	private String praImg11 = "";
	private String praImg12 = "";
	
	private MultipartFile praImgFile1;
	private MultipartFile praImgFile2;
	private MultipartFile praImgFile3;
	private MultipartFile praImgFile4;
	private MultipartFile praImgFile5;
	private MultipartFile praImgFile6;
	private MultipartFile praImgFile7;
	private MultipartFile praImgFile8;
	private MultipartFile praImgFile9;
	private MultipartFile praImgFile10;
	private MultipartFile praImgFile11;
	private MultipartFile praImgFile12;
}
