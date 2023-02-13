package kr.co.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PetBoardVO {
	private int abNm;
	private String abType;
	private String abTitle;
	private String abCon;
	private String abWriter;
	private int abCommentCnt;
	private int abLikeCnt;
	private String abImg = "/resources/images/petBoard/러시안블루.jpg";
	private MultipartFile abImgFile;
	private int abHitCnt;
}
