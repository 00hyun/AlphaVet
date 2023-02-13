/* jshint esversion: 6 */

/**
 * 202207_JJH
 */

const medicSearchInput = document.querySelector("#search");

let medicCheckShowHide = false;

/**
 * 요소에 onclick 이벤트를 주어 테스트하는 함수
 * @param {Object} element 이벤트가 발생하는 요소(this)
 */
function eventTest(element) {
    console.log(element);
}

/**
 * 시간 포맷
 * @param {string} date 시간 형식 문자열
 * @returns Intl.DateTimeFormat(locales, options).format(new Date(date))
 */
const intlTimeFormat = (date) => {
    const timeStr = new Intl.DateTimeFormat("ko", {
        dateStyle: "medium",
        timeStyle: "short",
    }).format(new Date(date));

    return timeStr;
};

/**
 * 의사 정보를 비동기로 가져온 뒤 return
 * @returns jsons { empVO {...}, praRoomVO {...} }
 */
const doctorInfo = async () => {
    const response = await fetch("/medic/doctor", {
        method: "POST",
        cache: "no-cache",
    });
    const jsons = await response.json();
    // console.log("/medic/doctor :", jsons);

    return jsons;
};

/**
 * 접수번호와 환자 아이디를 받아,
 * 접수 정보와 환자 정보를 비동기로 가져온 뒤 return
 * @param {String} recNm 접수번호
 * @param {String} patId 환자 아이디
 * @returns jsons {
 *     receiptVO {...},
 *     patientVO {...},
 *     praList [ { empVO {...}, praVO {...} } ]
 * }
 */
const patientInfo = async (recNm, patId) => {
    const response = await fetch("/medic/patient", {
        method: "POST",
        cache: "no-cache",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({ recNm, patId }),
    });
    const jsons = await response.json();
    // console.log("/medic/patient :", jsons);

    return jsons;
};

/**
 * 의사 정보 객체와 환자 정보 객체를 받아
 * 진료 목록 생성 및 문자열 반환
 * @param {Object} empVO 의사의 정보가 들어있는 객체
 * @param {Object} patientVO 환자의 정보가 들어있는 객체
 * @returns check - 성공: "OK", 실패: "FAILED"
 */
const createPra = async (obj) => {
    const response = await fetch("/medic/pra/create", {
        method: "POST",
        cache: "no-cache",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(obj),
    });
    const check = await response.text();
    // console.log("/medic/pra/create :", check);

    return check;
};

/**
 * obj { doctor(객체), patId, recNm }에서, 환자 접수 상태를 진료중으로 변경
 * @param {Object} obj 환자아이디, 접수번호가 들어있는 객체
 * @returns jsons { patientVO {...}, praList [ { empVO {...}, praVO {...} } ] }
 */
const conductReceiptStatus = async (obj) => {
    const response = await fetch("/medic/receipt/conduct", {
        method: "POST",
        cache: "no-cache",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(obj),
    });
    const check = await response.text();
    // console.log("/medic/receipt/conduct :", check);

    return check;
};

// 의사, 진료실 정보 시작
/**
 * doctor(jsons) 오브젝트를 받아서 이름과 진료실 출력
 * @param {Object} doctor { empVO {...}, praRoomVO {...} }
 */
const displayInfo = (doctor) => {
    const doctorNameBlanks = document.querySelectorAll(".doctorName");
    const praRoomBlanks = document.querySelectorAll(".praRoom");
    const medicHeaderDoctor = document.querySelector("#medicHeaderDoctor");

    const {
        empVO: { empName },
        praRoomVO: { praRoomNm },
    } = doctor;

    doctorNameBlanks.forEach((element) => (element.innerText = empName));
    praRoomBlanks.forEach(
        (element) => (element.innerText = "진료실" + praRoomNm)
    );
    medicHeaderDoctor.setAttribute("data-pra-room", praRoomNm);
};

/**
 * (임시) 의사 정보 가져오고 출력
 */
const medicInfo = async () => {
    // const empId = "e002";

    const doctor = await doctorInfo();

    displayInfo(doctor);
};
// 의사, 진료실 정보 끝

// 진료 진행 시작

/**
 * receiptVO(jsons)와 patientVO(jsons) 오브젝트를 받아 환자 정보 출력
 * @param {Object} receiptVO 접수 정보 객체
 * @param {Object} patientVO 환자 정보 객체
 */
const displayPatientInfo = (receiptVO, patientVO) => {
    const medicBoxInfo = document.querySelector("#medicBoxInfo");
    const medicHeaderPatient = document.querySelector("#medicHeaderPatient");
    const patNameBlanks = document.querySelectorAll(".patName");
    const patBioClassBlanks = document.querySelectorAll(".patBioClass");
    const patAgeBlanks = document.querySelectorAll(".patAge");
    const patWeightBlanks = document.querySelectorAll(".patWeight");
    const recPurposeBlank = document.querySelector(".recPurpose");

    const { recNm, recPurpose } = receiptVO;
    const { patId, animalCd, patBirth, patGender, patName, patWeight } =
        patientVO;

    const gender = patGender === "M" ? "남자" : "여자";

    let species = null;
    switch (animalCd) {
        case "cat":
            species = "고양이";
            break;
        case "dog":
            species = "개";
            break;
        case "etc":
            species = "기타";
            break;

        default:
            break;
    }

    const currentDate = new Date();
    const birthDate = new Date(patBirth);
    const ageDays = Math.round(
        (currentDate - birthDate) / (1000 * 60 * 60 * 24)
    );

    let ageMonths = Math.round(ageDays / 30);
    let age = "";

    if (ageMonths > 12) {
        const ageYears = Math.round(ageMonths / 12) || "0";
        ageMonths = Math.round(ageMonths % 12) || "0";
        age = `${ageYears}년 ${ageMonths}개월`;
    } else if (0 <= ageMonths <= 12) {
        age = `${ageMonths}개월`;
    } else {
        age = "?개월";
    }

    medicBoxInfo.innerHTML = `
        <span class="patName">${patName}</span>
        <small class="patBioClass">(${gender}, ${species})</small>
        <span class="patAge">${age}</span>
    `;

    medicHeaderPatient.dataset.recNm = recNm;
    medicHeaderPatient.dataset.patId = patId;
    patNameBlanks.forEach((item) => (item.innerText = patName));
    patBioClassBlanks.forEach(
        (item) => (item.innerText = `(${gender}, ${species})`)
    );
    patAgeBlanks.forEach((item) => (item.innerText = `${age}`));
    patWeightBlanks.forEach((item) => (item.innerText = `체중 ${patWeight}kg`));
    recPurposeBlank.innerText = recPurpose;
};

/**
 * 접수번호와 환자아이디를 받아 진료 진행 버튼 구성
 * @param {string} recNm 접수번호
 * @param {string} patId 환자아이디
 */
const displayBtns = (recNm, patId) => {
    const medicBoxBtns = document.querySelector("#medicBoxBtns");

    medicBoxBtns.innerHTML = `
        <button
            data-rec-nm="${recNm}"
            data-pat-id="${patId}"
            class="btn btn-primary waves-effect waves-light"
            onmouseup="conductMedic(this)"
        >
            진행하기
        </button>
    `;
};

const markCalendar = (praDate) => {
    const praTime = new Intl.DateTimeFormat().format(new Date(praDate));
    const markTime = document.querySelector(
        `#medicCalendar time[datetime="${praTime}"]`
    );

    if (markTime) {
        markTime.parentElement.style.color = "#6c6ff5";
        markTime.parentElement.style.backgroundColor =
            "rgba(108, 111, 245, 0.2)";
    }
};

/**
 * praList 배열을 받아 내원 이력 출력
 * @param {Array} praList 내원 이력 배열
 */
const displayPraList = (praList) => {
    const medicAccordion = document.querySelector("#medicAccordion");

    console.log("praList :", praList);

    if (praList === null && praList.length < 0) {
        medicAccordion.innerHTML = "";
    } else {
        let praListStr = "";
        for (let index = 0; index < praList.length; index++) {
            const {
                empVO: { empName },
                praVO: { recNm, praDate, praCon },
            } = praList[index];

            const timeStr = intlTimeFormat(praDate);

            praListStr += `
                <div
                    data-rec-nm=${recNm}
                    class="praList accordion-item"
                >
                    <h2 class="accordion-header" id="heading${index + 1}">
                        <button
                            class="accordion-button collapsed"
                            type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#collapse${index + 1}"
                            aria-expanded="true"
                            aria-controls="collapse${index + 1}"
                        >
                            <span class="praListTime">${timeStr}</span>
                            <span>&nbsp;</span>
                            <span>${empName}</span>
                        </button>
                    </h2>
                    <div
                        id="collapse${index + 1}"
                        class="accordion-collapse collapse"
                        aria-labelledby="heading${index + 1}"
                        data-bs-parent="#medicAccordion"
                    >
                        <div class="accordion-body">
                            <ul
                                class="list-group list-group-flush overflow-auto"
                            >
                                <li class="list-group-item">
                                    <div class="table-responsive">
                                        <table
                                            class="table table-centered mb-0 table-nowrap table-borderless"
                                        >
                                            <tr>
                                                <td>${praCon}</td>
                                            </tr>
                                        </table>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="table-responsive">
                                        <table
                                            class="table table-centered mb-0 table-nowrap table-borderless"
                                        ></table>
                                    </div>
                                </li>
                            </ul>
                        	<input type="button" onclick="getPraHistoryDetail(this)" class="btn btn-outline-secondary btn-sm" value="상세보기"/>
                        </div>
                    </div>
                </div>`;

            const medicCalPrev = document.querySelector("#medicCalPrev");
            const medicCalNext = document.querySelector("#medicCalNext");

            markCalendar(praDate);
            medicCalPrev.addEventListener("mouseup", () =>
                markCalendar(praDate)
            );
            medicCalNext.addEventListener("mouseup", () =>
                markCalendar(praDate)
            );
        }

        medicAccordion.innerHTML = praListStr;
    }
};

const displayVaccineList = (vaccineList) => {
    const vaccineTableBody = document.querySelector(
        "#medicVaccineHistory tbody"
    );

    let text = "";
    if (vaccineList === "null" || vaccineList.length < 1) {
        text += "<tr><td colspan='100%'>접종 내역이 없습니다</td></tr>";
    } else {
        vaccineList.forEach((item) => {
            const {
                vaccineVO: { vaccineName, vaccineDate },
                vaccineDetailVO: { vdType, vdCnt },
            } = item;

            const date = new Date(vaccineDate);
            const anotherDate = new Date(date.toString());

            text += `
                <tr>
                    <td>${vaccineName}</td>
                    <td>${vdType} (${vdCnt}차)</td>
                    <td>
                        ${new Intl.DateTimeFormat().format(anotherDate)}
                    </td>
                </tr>
            `;
        });
    }

    vaccineTableBody.innerHTML = text;
};

/**
 * 좌측 환자 리스트에서 버튼을 눌러
 * element.addEventListener("mouseup", displayPatient) 이벤트로
 * 환자 정보 출력하는 함수들 호출
 * @param {Object} event mouseup 이벤트 객체
 */
const displayPatient = async (event) => {
    const { recNm, patId } = event.target.dataset;

    const patient = await patientInfo(recNm, patId);

    if (patient !== null) {
        const { receiptVO, patientVO, praList, vaccineList } = patient;

        displayPatientInfo(receiptVO, patientVO);
        displayBtns(recNm, patId);
        displayPraList(praList);
        displayVaccineList(vaccineList);
    }
};

/**
 * 선택한 버튼이 '진료대기'->'진료중'으로 변경하게 하는 함수
 */
const conductBtn = (dataId) => {
    const selectedBtn = document.querySelector(
        `.status-btn[data-pat-id="${dataId}"]`
    );

    selectedBtn.classList.remove("btn-outline-success");
    selectedBtn.classList.add("btn-success");
    selectedBtn.innerText = "진료중";
};

/**
 * 진행 버튼을 눌러 onmouseup="conductMedic(this)" 이벤트로 진료 생성 및 진행
 * @param {Object} element onmouseup 이벤트가 가리키는 요소 객체
 */
async function conductMedic(element) {
    const { recNm, patId } = element.dataset;

    const doctor = await doctorInfo();
    const patient = await patientInfo(recNm, patId);

    const { empVO } = doctor;
    const { patientVO } = patient;

    const conductObj = { recNm, empVO, patientVO };

    const checkCreatePra = await createPra(conductObj);

    if (checkCreatePra === "FAILED") {
        Swal.fire({
            icon: "error",
            title: "진료 생성 실패",
        });
        return false;
    }

    const checkConduct = await conductReceiptStatus(element.dataset);

    if (checkConduct === "FAILED") {
        Swal.fire({
            icon: "error",
            title: "진료 진행 실패",
        });
        return false;
    } else {
        document.querySelector("#medicConductBox").classList.remove("d-flex");
        document.querySelector("#medicConductBox").classList.add("d-none");
        document.querySelector("#medicWrap").classList.remove("d-none");
        document.querySelector("#medicWrap").classList.add("d-block");
        document.querySelector("#medicMain").classList.remove("medicBackImg");
        conductBtn(patId);
        // receiptList();
        // setTimeout(() => disableBtns(patId), 100);
    }
}
// 진료 진행 끝

/**
 * 의사가 진료 중인 환자에 대한 데이터를 이용해 진료 진행
 */
const checkReceipt = async () => {
    const response = await fetch("/medic/receipt/check", {
        method: "POST",
        cache: "no-cache",
    });

    const jsons = await response.json();
    console.log("/medic/receipt/check :", jsons);

    const { receiptVO, patientVO, praList, vaccineList } = jsons;

    if (
        response.ok &&
        patientVO.constructor === Object &&
        Object.keys(patientVO).length !== 0
    ) {
        const memoBar = document.querySelector("#memoBar");

        memoBar.style.display = "block";
        displayPatientInfo(receiptVO, patientVO);
        displayPraList(praList);
        displayVaccineList(vaccineList);
        showMemo(patientVO.patId);
        document.querySelector("#medicWrap").classList.remove("d-none");
        document.querySelector("#medicWrap").classList.add("d-block");
        document.querySelector("#medicMain").classList.remove("medicBackImg");
        setTimeout(
            () =>
                Swal.fire({
                    icon: "info",
                    title: "현재 진료 진행 중인 환자가 있습니다.",
                }),
            1500
        );
    } else {
        document.querySelector("#medicConductBox").classList.remove("d-none");
        document.querySelector("#medicConductBox").classList.add("d-flex");
    }
};

async function displaySearchInfo(recNm, patId) {
    const patient = await patientInfo(recNm, patId);

    console.log(patient);
    if (patient !== null) {
        const { receiptVO, patientVO, praList, vaccineList } = patient;

        // displayPatientInfo(receiptVO, patientVO);
        displayPraList(praList);
        displayVaccineList(vaccineList);
        ajaxPraHistoryDetail(recNm);
    }
}

const medicSearchPatient = async (event) => {
    const searchResultUL = document.querySelector("#searchResult");

    const { value } = event.target;
    const searchValue = value.trim();

    let result = null;

    if (searchValue !== null && searchValue !== "") {
        const response = await fetch("/medic/patient/search", {
            method: "POST",
            cache: "no-cache",
            headers: {
                "Content-Type": "text/plain",
            },
            body: searchValue,
        });
        result = await response.json();
    }

    let text = "";
    if (result !== null && result.length > 0) {
        result.forEach(
            (item) =>
                (text += `
                <a
                    href="#"
                    id="medicSearchLi"
                    class="medicSearchLi list-group-item list-group-item-action"
                    onmouseup="displaySearchInfo('${item.REC_NM}', '${item.PAT_ID}')"
                >
                    ${item.PAT_NAME} (${item.MEM_TEL})
                </a>
            `)
        );
    }

    searchResultUL.innerHTML = text;
};

window.addEventListener("DOMContentLoaded", medicInfo);
window.addEventListener("DOMContentLoaded", checkReceipt);
medicSearchInput.addEventListener("keyup", medicSearchPatient);
