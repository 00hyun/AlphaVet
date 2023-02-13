<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<style>
	.medicDiagnosisTable th,
	.medicDiagnosisTable td {
		text-align: center;
	}
	
    .medicDiagnosisTbody .medicDiagnosis {
        cursor: pointer;
    }
</style>

<div
    class="offcanvas offcanvas-end"
    data-bs-scroll="true"
    data-bs-keyboard="true"
    data-bs-backdrop="false"
    tabindex="-1"
    id="docMenuBar"
    aria-labelledby="offcanvasScrollingLabel"
    style="width: 400px"
>
    <div class="offcanvas-body">
        <div class="row">
            <div class="col">
            	<h4>진단서</h4>
                <table class="medicDiagnosisTable table table-hover">
                    <thead>
                    	<tr>
	                    	<th>접수번호</th>
	                    	<th>환자이름</th>
	                    	<th>진료시간</th>
                    	</tr>
                    </thead>
                    <tbody id="medicDiagnosisTbody" class="medicDiagnosisTbody">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath }/resources/medic/js/medicDiagnosisDoc.js"></script>
