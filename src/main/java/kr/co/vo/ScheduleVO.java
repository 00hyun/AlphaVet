package kr.co.vo;

public class ScheduleVO {

	private int schNm;
	private String empId;
	private String schTitle;
	private String schCont;
	private String schStartDate;
	private String schEndDate;
	private boolean schAllDay;

	public boolean getSchAllDay() {
		return schAllDay;
	}

	public void setSchAllDay(boolean schAllDay) {
		this.schAllDay = schAllDay;
	}

	public int getSchNm() {
		return schNm;
	}

	public void setSchNm(int schNm) {
		this.schNm = schNm;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getSchTitle() {
		return schTitle;
	}

	public void setSchTitle(String schTitle) {
		this.schTitle = schTitle;
	}

	public String getSchCont() {
		return schCont;
	}

	public void setSchCont(String schCont) {
		this.schCont = schCont;
	}

	public String getSchStartDate() {
		return schStartDate;
	}

	public void setSchStartDate(String schStartDate) {
		this.schStartDate = schStartDate;
	}

	public String getSchEndDate() {
		return schEndDate;
	}

	public void setSchEndDate(String schEndDate) {
		this.schEndDate = schEndDate;
	}

	@Override
	public String toString() {
		return "ScheduleVO [schNm=" + schNm + ", empId=" + empId + ", schTitle="
				+ schTitle + ", schCont=" + schCont + ", schStartDate="
				+ schStartDate + ", schEndDate=" + schEndDate + ", schAllDay="
				+ schAllDay + "]";
	}

}
