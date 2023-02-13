package kr.co.alphaVet.myhome.controller;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.alphaVet.myhome.service.CalendarService;
import kr.co.vo.ScheduleVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CalendarController {
	
	@Inject
	private CalendarService calendarService;
	
	@PostMapping("/calendar")
	@ResponseBody
	public ResponseEntity<String> calendar(@RequestBody String empId) throws Exception {
		System.out.println("calendar :: " + empId);
		List<ScheduleVO> calendar = null;
		ResponseEntity<String> entity = null;
		try {
			calendar = calendarService.getCalendar(empId);
			String jsonArray = new Gson().toJson(calendar);
			
			System.out.println(jsonArray);
			entity = new ResponseEntity<String>(jsonArray, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	public ResponseEntity<ScheduleVO> insertCalendar(@RequestBody ScheduleVO schVO, String str) throws Exception {
		System.out.println("insert :: empId :: " + schVO.getEmpId());
		ResponseEntity<ScheduleVO> entity = null;
		
		System.out.println(schVO.getSchAllDay());
		
		calendarService.insert(schVO);
		
		ScheduleVO calendar = null;
		try {
			calendar = calendarService.getCalendarOne(schVO.getSchNm());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		entity = new ResponseEntity<ScheduleVO>(calendar, HttpStatus.OK);
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> deleteCalendar(int schNm) throws Exception{
		
		ResponseEntity<String> entity = null;
		int result = calendarService.delete(schNm);
		
		if(result > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("ERROR", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectOne", method = RequestMethod.POST)
	public ResponseEntity<ScheduleVO> selectOneCalendar(int schNm) throws Exception{
		ResponseEntity<ScheduleVO> entity = null;
		ScheduleVO schVO = calendarService.selectOne(schNm);
		
		String schStartDate = schVO.getSchStartDate().substring(0,10);
		String schEndDate = schVO.getSchEndDate().substring(0, 10);
		schVO.setSchStartDate(schStartDate);
		schVO.setSchEndDate(schEndDate);

		entity = new ResponseEntity<ScheduleVO>(schVO, HttpStatus.OK);
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<String> updateCalendar(@RequestBody ScheduleVO schVO) throws Exception{
		ResponseEntity<String> entity = null;
		
		log.debug("schVO :: " + schVO);
		
		calendarService.update(schVO);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}
	
}
