package kr.co.alphaVet.myhome.service;

import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import kr.co.mapper.MypageMapper;
import kr.co.vo.AlarmVO;
import kr.co.vo.BoardVO;
import kr.co.vo.EmpMemoVO;
import kr.co.vo.ReplyVO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Inject
	private MypageMapper mypageMapper;
	
	@Override
	public void insertBoard(BoardVO boardVO) {
		mypageMapper.insertBoard(boardVO);
	}

	@Override
	public BoardVO selectBoard(int boNm) {
		return mypageMapper.selectBoard(boNm);
	}

	@Override
	public List<BoardVO> selectNoticeList(String noticeCd) {
		return mypageMapper.selectNoticeList(noticeCd);
	}

	@Override
	public List<BoardVO> selectGyeongjosaList(String gyeongjosaCd) {
		return mypageMapper.selectGyeongjosaList(gyeongjosaCd);
	}

	@Override
	public List<BoardVO> selectComplainList(String complainCd) {
		return mypageMapper.selectComplainList(complainCd);
	}

	@Override
	public List<BoardVO> selectAcademicList(String academicCd) {
		return mypageMapper.selectAcademicList(academicCd);
	}
	
	/**
	 * 게시판 디테일
	 */
	@Override
	public BoardVO selectBoard2(BoardVO boardVO) {
		return mypageMapper.selectBoard2(boardVO);
	}

	@Override
	public void deleteBoard(int boNm) {
		mypageMapper.deleteBoard(boNm);
	}

	@Override
	public List<BoardVO> newBoardList() {
		return mypageMapper.newBoardList();
	}
	
	///댓글
	@Override
	public void insertReply(ReplyVO replyVO) {
		mypageMapper.insertReply(replyVO);
		
	}

	@Override
	public List<ReplyVO> replyList(ReplyVO replyVO) {
		return mypageMapper.replyList(replyVO);
	}

	@Override
	public void memoInsert(EmpMemoVO empMemoVO) {
		mypageMapper.memoInsert(empMemoVO);
	}

	@Override
	public List<EmpMemoVO> memoList(String empId) {
		return mypageMapper.memoList(empId);
	}

	@Override
	public void memoDelete(int empMemoNm) {
		mypageMapper.memoDelete(empMemoNm);
	}

	@Override
	public void memoCheckUpdate(EmpMemoVO empMemoVO) {
		mypageMapper.memoCheckUpdate(empMemoVO);
	}

	@Override
	public List<AlarmVO> alarmList(String empId) {
		return mypageMapper.alarmList(empId);
	}
	
	@Override
	public void updateBoard(int boNm) {
		mypageMapper.updateBoard(boNm);
	}
	
	@Override
	public String academicPapago(String selectTo, String selectFrom, String changeData) {
		String clientId = "KevwdPg1w7hfxB57530m";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "vtD7ALjhZn";//애플리케이션 클라이언트 시크릿값";

        String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
        String text;
        try {
            text = URLEncoder.encode(changeData, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("인코딩 실패", e);
        }

        Map<String, String> requestHeaders = new HashMap();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);

        String responseBody = post(apiURL, requestHeaders, text, selectTo, selectFrom);

        System.out.println(responseBody);
        
        return responseBody;
	}
	
	private static String post(String apiUrl, Map<String, String> requestHeaders, String text, String selectTo, String selectFrom){
        HttpURLConnection con = connect(apiUrl);
        String postParams = "source="+ selectTo +"&target="+ selectFrom +"&text=" + text; //원본언어: 한국어 (ko) <- 목적언어: 영어 (en)
        try {
            con.setRequestMethod("POST");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            con.setDoOutput(true);
            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.write(postParams.getBytes());
                wr.flush();
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
                return readBody(con.getInputStream());
            } else {  // 에러 응답
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }
	
	private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }
	
	private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
            	System.out.println("dasddadda" + line);
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }

	
//	@Override
//	public String academicPapago(String boCon) {
//		//String korean = dd.getKorean();
//		String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
//		String text;
//		String result = "";
//		String line = "";
//		try {
//			text = URLEncoder.encode(boCon, "UTF-8");
//			String param = "source=en&target=ko&text=" + text;
//			URL url = new URL(apiURL);
//			HttpURLConnection con = (HttpURLConnection) url.openConnection();
//			con.setRequestProperty("X-Naver-Client-Id", "KevwdPg1w7hfxB57530m");
//			con.setRequestProperty("X-Naver-Client-Secret", "vtD7ALjhZn");
//			con.setRequestMethod("POST");
//			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
//			con.setDoInput(true);
//			con.setDoOutput(true);
//			con.setUseCaches(false);
//			con.setDefaultUseCaches(false);
//			
//			OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream());
//			osw.write(param);
//			osw.flush();
//			
//			int responseCode = con.getResponseCode();
//			result += "responseCode  : " + responseCode;
//			result += "\n";
//			// 200코드가 아니면 오류인데 무엇이 오류 인지 디버깅 
//			if (responseCode != 200) {
//				Map<String, List<String>> map = con.getRequestProperties();
//				result += "Printing Response Header...\n";
//				for (Map.Entry<String, List<String>> entry : map.entrySet()) {
//					if (entry.getKey().equals("apikey")) {
//						result += "";
//					} else {
//						result += "Key : " + entry.getKey() + " ,Value : " + entry.getValue();
//					}
//				}
//			}
//			
//			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
//			// 여긴 출력 
//			while ((line = br.readLine()) != null) {
//				result += line + "\n";
//			}
//			br.close();
//			
//		} catch (UnsupportedEncodingException e) {
//			throw new RuntimeException("인코딩 실패", e);
//		} catch (IOException e) {
//			result = e.getMessage();
//		}
//		
//		return result;
//	}

}
