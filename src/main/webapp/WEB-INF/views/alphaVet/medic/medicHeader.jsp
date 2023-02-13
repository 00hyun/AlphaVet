<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<style>
    .medicHeader > .container > .d-flex > div {
        width: 33.33%;
    }

    .medicHeader span {
        font-size: 18px;
    }
</style>

<div id="medicHeader" class="medicHeader card p-2 mb-3">
    <div class="container">
        <div class="d-flex justify-content-center align-items-center">
            <div
                id="medicHeaderPatient"
                class="d-flex flex-wrap justify-content-center align-items-center text-center"
            >
                <b><span class="patName">?</span></b>
                <small class="patBioClass">(?)</small>
                <span>,&nbsp;</span>
                <span class="patAge">?개월</span>
                <span>,&nbsp;</span>
                <span class="patWeight">체중 ?kg</span>
                <!-- 까칠 #VIP -->
                <!-- <span>체중 4.6kg 중성화 완료</span> -->
            </div>
            <div class="align-items-center text-center">
                <b><span class="recPurpose">진료목적 ?</span></b>
            </div>
            <div
                data-emp-id="${principal.empVO.empId }"
                id="medicHeaderDoctor"
                class="medicHeaderDoctor text-center"
            >
                <b><span class="doctorName">? 의사&nbsp;</span></b>
                <span class="praRoom">진료실?</span>
            </div>
        </div>
    </div>
</div>
