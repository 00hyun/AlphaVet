/* jshint esversion: 6 */

/**
 * 202207_JJH
 */

const medicCalPrev = document.querySelector("#medicCalPrev");
const medicCalNext = document.querySelector("#medicCalNext");
const medicCalMonth = document.querySelector("#medicCalMonth");
const medicCalDays = document.querySelector("#medicCalDays");

const date = new Date();

const calcCalendar = function () {
    const year = date.getFullYear();
    const month = date.getMonth();

    const firstDate = new Date(year, month, 1);
    const lastDate = new Date(year, month + 1, 0);
    const totalDateNum = lastDate.getDate() - firstDate.getDate() + 1;

    let dateList = [];

    for (let i = 0; i < firstDate.getDay(); i++) {
        dateList.push({ text: "" });
    }
    for (let i = 0; i < totalDateNum; i++) {
        const datetime = new Intl.DateTimeFormat().format(
            new Date(year, month, i + 1)
        );
        dateList.push({ datetime, text: "" + (i + 1) });
    }
    for (let i = 6; i > lastDate.getDay(); i--) {
        dateList.push({ text: "" });
    }

    return dateList;
};

const displayCalendar = function () {
    const dateList = calcCalendar();

    const month = new Intl.DateTimeFormat("ko", {
        dateStyle: "full",
    }).format(date);
    medicCalMonth.innerText = month.substring(0, 9);

    let days = "";

    days += "<div class='row'>";
    for (let i = 0; i < 7; i++) {
        if (i === 0) {
            days += "<div class='colDay col calRed'>";
        } else if (i === 6) {
            days += "<div class='colDay col calBlue'>";
        } else {
            days += "<div class='colDay col'>";
        }
        days += `
                <time datetime="${dateList[i].datetime}">
                    ${dateList[i].text}
                </time>
            `;
        days += "</div>";
    }
    days += "</div>";

    days += "<div class='row'>";
    for (let i = 7; i < 14; i++) {
        if (i === 7) {
            days += "<div class='colDay col calRed'>";
        } else if (i === 13) {
            days += "<div class='colDay col calBlue'>";
        } else {
            days += "<div class='colDay col'>";
        }
        days += `
                <time datetime="${dateList[i].datetime}">
                    ${dateList[i].text}
                </time>
            `;
        days += "</div>";
    }
    days += "</div>";

    days += "<div class='row'>";
    for (let i = 14; i < 21; i++) {
        if (i === 14) {
            days += "<div class='colDay col calRed'>";
        } else if (i === 20) {
            days += "<div class='colDay col calBlue'>";
        } else {
            days += "<div class='colDay col'>";
        }
        days += `
                <time datetime="${dateList[i].datetime}">
                    ${dateList[i].text}
                </time>
            `;
        days += "</div>";
    }
    days += "</div>";

    days += "<div class='row'>";
    for (let i = 21; i < 28; i++) {
        if (i === 21) {
            days += "<div class='colDay col calRed'>";
        } else if (i === 27) {
            days += "<div class='colDay col calBlue'>";
        } else {
            days += "<div class='colDay col'>";
        }
        days += `
                <time datetime="${dateList[i].datetime}">
                    ${dateList[i].text}
                </time>
            `;
        days += "</div>";
    }
    days += "</div>";

    days += "<div class='row'>";
    for (let i = 28; i < 35; i++) {
        if (i === 28) {
            days += "<div class='colDay col calRed'>";
        } else if (i === 34) {
            days += "<div class='colDay col calBlue'>";
        } else {
            days += "<div class='colDay col'>";
        }
        days += `
                <time datetime="${dateList[i].datetime}">
                    ${dateList[i].text}
                </time>
            `;
        days += "</div>";
    }
    days += "</div>";

    if (dateList.length === 42) {
        days += "<div class='row'>";
        for (let i = 35; i < 42; i++) {
            if (i === 35) {
                days += "<div class='colDay col calRed'>";
            } else if (i === 41) {
                days += "<div class='colDay col calBlue'>";
            } else {
                days += "<div class='colDay col'>";
            }
            days += `
                    <time datetime="${dateList[i].datetime}">
                        ${dateList[i].text}
                    </time>
                `;
            days += "</div>";
        }
        days += "</div>";
    }

    medicCalDays.innerHTML = days;

    const currentTime = new Intl.DateTimeFormat().format(new Date());
    const markCurrentTime = document.querySelector(
        `#medicCalendar time[datetime="${currentTime}"]`
    );

    if (markCurrentTime) {
        markCurrentTime.parentElement.style.backgroundColor =
            "rgba(111, 190, 54, 0.5)";
    }
};

const prevCalendar = function () {
    date.setMonth(date.getMonth() - 1);
    displayCalendar();
};

const nextCalendar = function () {
    date.setMonth(date.getMonth() + 1);
    displayCalendar();
};

window.addEventListener("DOMContentLoaded", displayCalendar);
medicCalPrev.addEventListener("mouseup", prevCalendar);
medicCalNext.addEventListener("mouseup", nextCalendar);
