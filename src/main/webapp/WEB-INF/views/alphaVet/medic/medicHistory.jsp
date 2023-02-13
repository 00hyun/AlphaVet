<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<style>
    .card-body .medicAccordion {
        width: 320px;
    }
</style>

<div class="card">
    <div class="card-body">
        <jsp:include
            page="${pageContext.request.contextPath }/WEB-INF/views/alphaVet/medic/medicCalendar.jsp"
        />
        <div
            id="medicAccordion"
            class="medicAccordion accordion mx-auto mt-4"
        ></div>
    </div>
</div>
