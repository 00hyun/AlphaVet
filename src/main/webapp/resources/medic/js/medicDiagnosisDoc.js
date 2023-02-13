/* jshint esversion: 6 */

/**
 * 202207_JJH
 */

const getMedicDiagnosisList = async () => {
    const medicDiagnosisTbody = document.querySelector("#medicDiagnosisTbody");

    const response = await fetch("/document/diagnosisList", {
        method: "POST",
        cache: "no-cache",
    });

    const jsons = await response.json();

    let text = "";
    if (jsons === null || jsons.length < 1) {
        text +=
            "<tr><td colspan='100%'>입력해야할 진단서가 없습니다.</td></tr>";
    } else {
        jsons.forEach((item) => {
            text += `
                <tr class="medicDiagnosis" onmouseup="openDoc(${item.REC_NM})">
                    <td>${item.REC_NM}</td>
                    <td>${item.PAT_NAME}</td>
                    <td>${new Intl.DateTimeFormat().format(
                        new Date(item.PRA_DATE)
                    )}</td>
                </tr>
            `;
        });
    }

    medicDiagnosisTbody.innerHTML = text;
};

function openDoc(recNm) {
    window.open(
        "/document/diagnosis?path=document4&recNm=" + recNm,
        "resPopup",
        "width=814, height=1000, scrollbars=yes, resizable=yes"
    );
}

window.addEventListener("DOMContentLoaded", getMedicDiagnosisList);
