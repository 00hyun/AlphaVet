<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<style>
    .medicCalendar.calendar {
        width: 320px;
        padding-right: 10px;
        padding-left: 10px;
    }

    .medicCalendar .medicCalPrev,
    .medicCalendar .medicCalNext {
        width: 26px;
        height: 26px;
    }

    .medicCalPrev i,
    .medicCalNext i {
        font-size: 20px;
        color: #6c6ff5;
    }

    .row .colDay {
        display: flex;
        justify-content: center;
        height: 42px;
        padding: 0;
        font-size: 16px;
    }

    .row .calRed {
        color: red;
    }

    .row .calBlue {
        color: #4790eb;
    }
</style>

<div
    id="medicCalendar"
    class="medicCalendar calendar mx-auto border-top border-bottom border-dark"
>
    <div
        class="month-indicator d-flex justify-content-between align-items-center"
    >
        <time id="medicCalMonth"></time>
        <div class="d-flex justify-content-center align-items-center">
            <button
                type="button"
                id="medicCalPrev"
                class="medicCalPrev carousel-control-prev waves-effect waves-light"
            >
                <i class="mdi mdi-chevron-left carousel-control-icon"></i>
            </button>
            <button
                type="button"
                id="medicCalNext"
                class="medicCalNext carousel-control-next waves-effect waves-light"
            >
                <i class="mdi mdi-chevron-right carousel-control-icon"></i>
            </button>
        </div>
    </div>
    <div id="medicCalDays"></div>
</div>

<script src="/resources/medic/js/medicCalendar.js"></script>
