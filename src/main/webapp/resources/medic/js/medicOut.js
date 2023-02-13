/* jshint esversion: 6 */

/**
 * 202207_JJH
 */

const praContent = document.querySelector("#praContent");
const medicModalBtn = document.querySelector("#medicModalBtn");
const medicAppendDisTbody = document.querySelector("#medicAppendDis tbody");
const medicAppendTestTbody = document.querySelector("#medicAppendTest tbody");
const medicAppendDrugTbody = document.querySelector("#medicAppendDrug tbody");
const medicAppendVaccTbody = document.querySelector("#medicAppendVacc tbody");
const medicAddBtn = document.querySelector("#medicAddBtn");
const medicDiagnosis = document.querySelector("#medicDiagnosis");
const medicPrescription = document.querySelector("#medicPrescription");
const medicOutBtn = document.querySelector("#medicOutBtn");

const medicModal = {
    recNm: "",
    patId: "",
    praCon: "",
    recStatus: "",
    disArr: new Array(),
    testArr: new Array(),
    drugArr: new Array(),
    vaccineArr: new Array(),
};

/**
 * 진단 및 처방 객체 데이터를 dataTable 라이브러리로 출력
 * @param {Object} medicData 진단 및 처방 데이터
 */
function displayAppendTable(medicData) {
    /*
    $("#medicAppendModalTable").dataTable({
        // pageLength: 100,
        lengthChange: false,
        autoWidth: false,
        // scrollX: false,
        scrollY: "150",
        scroller: true,
        language: {
            paginate: {
                first: "처음",
                last: "마지막",
                next: "다음",
                previous: "이전",
            },
        },
        info: false,
        ordering: false,
        select: { style: "multi" },
        data: medicData,
        // columns: [{ data: "disType" }, { data: "disKorName" }],
        createdRow: function (row, data, dataIndex, full) {
            // $(row).attr("data-dis-cd", data.disCd);
            // $(row).attr("class", "medicAppendModalRow");
            // $(row).attr("onmouseup", "medicAppendModal(this)");
        },
    });
    */
}

let disTextList = "";
let testTextList = "";
let drugTextList = "";
let vaccineTextList = "";

const chekObj = (idValue, arr) => {
    for (let index = 0; index < arr.length; index++) {
        for (const [key, value] of Object.entries(arr[index])) {
            if (value === idValue) {
                return index;
            }
        }
    }

    return -1;
};

/**
 * 클릭한 질병/검사/약품 목록을 모달창 하단에 출력하고 저장하는 함수
 *
 * @param {String} key 질병/검사/약품을 구별하기 위한 문자열
 * @param {Object} obj 질병/검사/약품에 따라 출력할 데이터 객체
 */
function medicAppendModal(category, obj) {
    const parseObj = JSON.parse(obj);

    const { disArr, testArr, drugArr, vaccineArr } = medicModal;

    switch (category) {
        case "disease":
            const { disCd, disKorName } = parseObj;

            const checkDis = chekObj(disCd, disArr);
            if (checkDis < 0) {
                medicModal.disArr.push(parseObj);

                disTextList += `
                    <tr>
                        <td>${disCd}</td>
                        <td>${disKorName}</td>
                    </tr>
                `;
                medicAppendDisTbody.innerHTML = disTextList;
            }

            break;

        case "test":
            const { testCd, testName } = parseObj;

            const checkTest = chekObj(testCd, testArr);
            if (checkTest < 0) {
                medicModal.testArr.push(parseObj);

                testTextList += `
                <tr>
                    <td>${testCd}</td>
                    <td>${testName}</td>
                </tr>
            `;
                medicAppendTestTbody.innerHTML = testTextList;
            }

            break;

        case "drug":
            const { drugNm, drugIo, itemName } = parseObj;
            const drugData = {
                drugNm,
                drugIo,
                itemName,
                amount: 1,
                count: 1,
                days: 1,
            };

            const checkDrug = chekObj(drugNm, drugArr);
            if (checkDrug < 0) {
                medicModal.drugArr.push(drugData);

                drugTextList += `
                    <tr>
                        <td>${drugNm}</td>
                        <td>${itemName}</td>
                    </tr>
                `;
                medicAppendDrugTbody.innerHTML = drugTextList;
            }

            break;

        case "vaccine":
            const { vdNm, vdName } = parseObj;

            const checkVaccine = chekObj(vdNm, vaccineArr);
            if (checkVaccine < 0) {
                medicModal.vaccineArr.push(parseObj);

                vaccineTextList += `
                    <tr>
                        <td>${vdNm}</td>
                        <td>${vdName}</td>
                    </tr>
                `;
                medicAppendVaccTbody.innerHTML = vaccineTextList;
            }

            break;

        default:
            break;
    }

    // console.log(medicModal);
    // displayAppendTable(medicModal);
}

/**
 * 질병 데이터를 dataTable로 그리는 AJAX
 */
$.ajax({
    method: "post",
    url: "/medic/disease/list",
    dataType: "json",
    success: function (result) {
        // console.log("/medic/disease/list :", result);

        const medicDiseaseTable = $("#medicDiseaseTable").dataTable({
            // pageLength: 100,
            lengthChange: false,
            pageResize: true,
            autoWidth: false,
            // scrollX: false,
            scrollY: "150",
            scroller: true,
            language: {
                paginate: {
                    first: "처음",
                    last: "마지막",
                    next: "다음",
                    previous: "이전",
                },
            },
            info: false,
            ordering: false,
            select: { style: "multi" },
            data: result,
            columns: [{ data: "disType" }, { data: "disKorName" }],
            createdRow: function (row, data, dataIndex, full) {
                const { disCd, disKorName } = data;

                $(row).attr("class", "medicAppendModalRow");
                $(row).attr(
                    "onmouseup",
                    `medicAppendModal("disease", '${JSON.stringify({
                        disCd,
                        disKorName,
                    })}')`
                );
            },
        });
        $(".dataTables_filter").remove(); // dataTable 자체 search input 없애기

        $("#medicDiseaseSearch").keyup(function () {
            // input의 값대로 search
            let $value = $(this).val();
            medicDiseaseTable.api().search($value).draw();
        });

        $("#medicDiseaseTab").on("shown.bs.tab", function () {
            $($.fn.dataTable.tables(true)).DataTable().columns.adjust();
        });

        medicModalBtn.addEventListener("mouseup", () =>
            setTimeout(() => {
                document.querySelector("a[href='#medicDisease']").click();
            }, 200)
        );
    },
});

/**
 * 검사 데이터를 dataTable로 그리는 AJAX
 */
$.ajax({
    method: "post",
    url: "/medic/test/list",
    dataType: "json",
    success: function (result) {
        // console.log("/medic/test/list :", result);

        const medicTestTable = $("#medicTestTable").dataTable({
            // pageLength: 100,
            lengthChange: false,
            autoWidth: false,
            // scrollX: false,
            scrollY: "150",
            scroller: true,
            language: {
                paginate: {
                    first: "처음",
                    last: "마지막",
                    next: "다음",
                    previous: "이전",
                },
            },
            info: false,
            ordering: false,
            select: { style: "multi" },
            data: result,
            columns: [
                { data: "testName" },
                { data: "testCon", defaultContent: "" },
            ],
            createdRow: function (row, data, dataIndex, full) {
                const { testCd, testName } = data;

                $(row).attr("class", "medicAppendModalRow");
                $(row).attr(
                    "onmouseup",
                    `medicAppendModal("test", '${JSON.stringify({
                        testCd,
                        testName,
                    })}')`
                );
            },
        });
        $(".dataTables_filter").remove(); // dataTable 자체 search input 없애기

        $("#medicTestSearch").keyup(function () {
            // input의 값대로 search
            let $value = $(this).val();
            medicTestTable.api().search($value).draw();
        });

        $("#medicTestTab").on("shown.bs.tab", function () {
            $($.fn.dataTable.tables(true)).DataTable().columns.adjust();
        });
    },
});

/**
 * 원외 약품 데이터를 dataTable로 그리는 AJAX
 */
$.ajax({
    method: "post",
    url: "/medic/preOutDrug/list",
    dataType: "json",
    success: function (result) {
        // console.log('/medic/preOutDrug/list :', result);

        const medicPreOutTable = $("#medicPreOutTable").dataTable({
            // pageLength: 100,
            lengthChange: false,
            autoWidth: false,
            // scrollX: "300px",
            scrollY: "150",
            scroller: true,
            language: {
                paginate: {
                    first: "처음",
                    last: "마지막",
                    next: "다음",
                    previous: "이전",
                },
            },
            info: false,
            ordering: false,
            select: { style: "multi" },
            data: result,
            columns: [
                // { data: "drugNm", visible: false, searchable: false },
                // { data: "itemSeq" },
                { data: "itemName" },
                { data: "itemEngName", defaultContent: "" },
                // { data: "entpName" },
                // { data: "drugCostPrice" },
                // { data: "drugAmount" },
                // { data: "drugStockDate" },
            ],
            createdRow: function (row, data, dataIndex, full) {
                const { drugNm, drugIo, itemName } = data;

                $(row).attr("class", "medicAppendModalRow");
                $(row).attr(
                    "onmouseup",
                    `medicAppendModal("drug", '${JSON.stringify({
                        drugNm,
                        drugIo,
                        itemName,
                    })}')`
                );
                // $(row).attr("data-buyer", data.entpName);
                // $(row).attr("data-price", data.drugCostPrice);
            },
        });
        $(".dataTables_filter").remove(); // dataTable 자체 search input 없애기

        $("#medicPreOutSearch").keyup(function () {
            // input의 값대로 search
            let $value = $(this).val();
            medicPreOutTable.api().search($value).draw();
        });

        $("#medicPreOutTab").on("shown.bs.tab", function () {
            $($.fn.dataTable.tables(true)).DataTable().columns.adjust();
        });
    },
});

/**
 * 원내 약품 데이터를 dataTable로 그리는 AJAX
 */
$.ajax({
    method: "post",
    url: "/medic/preInDrug/list",
    dataType: "json",
    success: function (result) {
        // console.log('/medic/preInDrug/list :', result);

        const medicPreInTable = $("#medicPreInTable").dataTable({
            // pageLength: 100,
            lengthChange: false,
            autoWidth: false,
            // scrollX: "300px",
            scrollY: "150",
            scroller: true,
            language: {
                paginate: {
                    first: "처음",
                    last: "마지막",
                    next: "다음",
                    previous: "이전",
                },
            },
            info: false,
            ordering: false,
            select: { style: "multi" },
            data: result,
            columns: [
                // { data: "drugNm", visible: false, searchable: false },
                // { data: "itemSeq" },
                { data: "itemName" },
                { data: "itemEngName", defaultContent: "" },
                // { data: "entpName" },
                // { data: "drugCostPrice" },
                // { data: "drugAmount" },
                // { data: "drugStockDate" },
            ],
            createdRow: function (row, data, dataIndex, full) {
                const { drugNm, drugIo, itemName } = data;

                $(row).attr("class", "medicAppendModalRow");
                $(row).attr(
                    "onmouseup",
                    `medicAppendModal("drug", '${JSON.stringify({
                        drugNm,
                        drugIo,
                        itemName,
                    })}')`
                );
                // $(row).attr("data-buyer", data.entpName);
                // $(row).attr("data-price", data.drugCostPrice);
            },
        });
        $(".dataTables_filter").remove(); // dataTable 자체 search input 없애기

        $("#medicPreInSearch").keyup(function () {
            // input의 값대로 search
            let $value = $(this).val();
            medicPreInTable.api().search($value).draw();
        });

        $("#medicPreInTab").on("shown.bs.tab", function () {
            $($.fn.dataTable.tables(true)).DataTable().columns.adjust();
        });
    },
});

/**
 * 예방접종 데이터를 dataTable로 그리는 AJAX
 */
$.ajax({
    method: "post",
    url: "/medic/vaccine/list",
    dataType: "json",
    success: function (result) {
        // console.log('/medic/vaccine/list :', result);

        const medicVaccineTable = $("#medicVaccineTable").dataTable({
            // pageLength: 100,
            lengthChange: false,
            autoWidth: false,
            // scrollX: "300px",
            scrollY: "150",
            scroller: true,
            language: {
                paginate: {
                    first: "처음",
                    last: "마지막",
                    next: "다음",
                    previous: "이전",
                },
            },
            info: false,
            ordering: false,
            select: { style: "multi" },
            data: result,
            columns: [
                { data: "vdName" },
                { data: "animalCd" },
                { data: "vdType" },
                { data: "vdCnt" },
            ],
            createdRow: function (row, data, dataIndex, full) {
                const { vdNm, vdName } = data;

                $(row).attr("class", "medicAppendModalRow");
                $(row).attr(
                    "onmouseup",
                    `medicAppendModal("vaccine", '${JSON.stringify({
                        vdNm,
                        vdName,
                    })}')`
                );
            },
        });
        $(".dataTables_filter").remove(); // dataTable 자체 search input 없애기

        $("#medicVaccineSearch").keyup(function () {
            // input의 값대로 search
            let $value = $(this).val();
            medicVaccineTable.api().search($value).draw();
        });

        $("#medicVaccineTab").on("shown.bs.tab", function () {
            $($.fn.dataTable.tables(true)).DataTable().columns.adjust();
        });
    },
});

/**
 * 약품 배열에 저장된 각각 약품의 양/횟수/복용일에 대한 값이
 * input의 value 값에 따라 변경되도록 하는 함수
 *
 * @param {Object} element 이벤트가 작동하는 요소 객체
 * @param {Number} index 저장된 약품 배열을 가리킬 인덱스
 * @param {String} key 양/횟수/복용일을 구별할 문자열
 */
function changeDrugNum(element, index, key) {
    medicModal.drugArr[index][key] = parseInt(element.value);
}

/**
 * 질병/검사/약품 선택 모달창에서 선택된 목록들을
 * 진단 처방 영역으로 추가하여 출력하는 함수
 */
const medicAdd = () => {
    const { disArr, testArr, drugArr, vaccineArr } = medicModal;

    let diagnosisText = "";
    let prescriptionText = "";

    disArr.forEach(
        (item) =>
            (diagnosisText += `
                <tr data-dis-cd="${item.disCd}">
                    <td class="medicAddedName">${item.disKorName}</td>
                    <td></td>
                    <td class="text-end">
                        <i
                            class="medicDeleteMark fas fa-times"
                            onmouseup="medicDelete(this)"
                        ></i>
                    </td>
                </tr>
            `)
    );

    testArr.forEach((item) => {
        const date = new Intl.DateTimeFormat("ko", {
            dateStyle: "medium",
        }).format(new Date());
        prescriptionText += `
            <tr data-test-cd="${item.testCd}">
                <td class="medicAddedName">${item.testName}</td>
                <td class="medicTestDateTd">
                    ${date}
                </td>
                <td class="text-end">
                    <i
                        class="medicDeleteMark fas fa-times"
                        onmouseup="medicDelete(this)"
                    ></i>
                </td>
            </tr>
        `;
    });

    for (let index = 0; index < drugArr.length; index++) {
        prescriptionText += `
            <tr data-drug-nm="${drugArr[index].drugNm}">
                <td class="medicAddedName">${drugArr[index].itemName}</td>
                <td class="medicDrugNumTd d-flex justify-content-between align-items-center">
                    <div>
                        <input
                            type="number"
                            value="1"
                            class="form-control medicDrugAmount"
                            onChange="changeDrugNum(this, ${index}, 'amount')"
                        />
                    </div>
                    <div>
                        <input
                            type="number"
                            value="1"
                            class="form-control medicDrugCount"
                            onChange="changeDrugNum(this, ${index}, 'count')"
                        />
                    </div>
                    <div>
                        <input
                            type="number"
                            value="1"
                            class="form-control medicDrugDays"
                            onChange="changeDrugNum(this, ${index}, 'days')"
                        />
                    </div>
                </td>
                <td class="text-end">
                    <i
                        class="medicDeleteMark fas fa-times"
                        onmouseup="medicDelete(this)"
                    ></i>
                </td>
            </tr>
        `;
    }

    vaccineArr.forEach(
        (item) =>
            (prescriptionText += `
                <tr data-vd-nm="${item.vdNm}">
                    <td class="medicAddedName">${item.vdName}</td>
                    <td></td>
                    <td class="text-end">
                        <i
                            class="medicDeleteMark fas fa-times"
                            onmouseup="medicDelete(this)"
                        ></i>
                    </td>
                </tr>
            `)
    );

    medicDiagnosis.innerHTML = diagnosisText;
    medicPrescription.innerHTML = prescriptionText;
};

function medicDelete(element) {
    const tr = element.parentElement.parentElement;
    const { dataset } = tr;

    const { disArr, testArr, drugArr, vaccineArr } = medicModal;

    if ("disCd" in dataset) {
        medicModal.disArr.splice(chekObj(dataset.disCd, disArr), 1);
    } else if ("testCd" in dataset) {
        medicModal.testArr.splice(chekObj(dataset.testCd, testArr), 1);
    } else if ("drugNm" in dataset) {
        medicModal.drugArr.splice(chekObj(dataset.drugNm, drugArr), 1);
    } else if ("vdNm" in dataset) {
        medicModal.vaccineArr.splice(chekObj(dataset.vdNm, vaccineArr), 1);
    }

    tr.remove();
}

/**
 * innerHTML로 출력하기 위하여
 * "medicConductBox" HTML 문자열을 반환하는 함수
 *
 * @returns HTML 문자열
 */
const medicBox = () => {
    return `
        <div
            id="medicConductBox"
            class="medicConductBox position-absolute d-flex justify-content-center align-items-center w-100 h-100"
        >
            <div class="card border border-2">
                <div class="card-body">
                    <h1 class="praRoom card-title display-5"></h1>
                    <p class="card-text mb-4">
                        <span class="h5">담당의</span>
                        <span>&nbsp;</span>
                        <span class="doctorName h5"></span>
                    </p>
                    <p id="medicBoxInfo" class="medicBoxInfo card-text h5">
                        <span>다음 대기 환자가 없습니다.</span>
                    </p>
                    <div
                        id="medicBoxBtns"
                        class="medicBoxBtns d-flex flex-wrap gap-2 justify-content-end"
                    >
                        <button class="btn btn-light waves-effect waves-light" disabled>
                            진행하기
                        </button>
                    </div>
                </div>
            </div>
        </div>
    `;
};

/**
 * 환자 리스트 버튼을 활성화하는 함수
 */
const enableBtns = () => {
    const patListBarBtns = document.querySelectorAll(".status-btn");

    patListBarBtns.forEach((btn) => (btn.disabled = false));
};

/**
 * 진료를 종료 하는 함수
 */
const medicOut = () => {
    Swal.fire({
        icon: "warning",
        title: "진료를 종료하고 환자를 내보내시겠습니까?",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "예",
        cancelButtonText: "아니오",
    }).then(async (result) => {
        if (result.isConfirmed) {
            const medicHeaderPatient = document.querySelector(
                "#medicHeaderPatient"
            );
            const medicStatus = document.querySelector("#medicStatus");

            const { recNm, patId } = medicHeaderPatient.dataset;

            medicModal.recNm = recNm;
            medicModal.patId = patId;
            medicModal.praCon = praContent.innerText;
            medicModal.recStatus = medicStatus.value;

            const response = await fetch("/medic/out", {
                method: "POST",
                cache: "no-cache",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(medicModal),
            });

            const check = await response.text();
            console.log("/medic/out :", check);

            if (check === "FAILED") {
                Swal.fire({
                    icon: "error",
                    title: "진료 종료 실패",
                });
            } else {
                const leftPatientDiv = document.querySelector(
                    `button[data-rec-nm="${recNm}"][data-pat-id="${patId}"]`
                ).parentElement.parentElement;
                const memoBar = document.querySelector("#memoBar");
                const medicSelectedRow = document.querySelectorAll(
                    ".medicAppendModalRow.selected"
                );
                const medicHeaderDoctor =
                    document.querySelector("#medicHeaderDoctor");

                const { praRoomNm } = medicHeaderDoctor.dataset;

                leftPatientDiv.style.display = "none";
                memoBar.style.display = "none";
                praContent.innerText = "";
                medicModal.recNm = "";
                medicModal.patId = "";
                medicModal.praCon = "";
                medicModal.recStatus = "";
                medicModal.disArr = new Array();
                medicModal.drugArr = new Array();
                medicModal.testArr = new Array();
                medicModal.vaccineArr = new Array();

                medicSelectedRow.forEach((item) =>
                    item.classList.remove("selected")
                );

                medicAppendDisTbody.innerHTML = "";
                medicAppendTestTbody.innerHTML = "";
                medicAppendDrugTbody.innerHTML = "";
                medicAppendVaccTbody.innerHTML = "";

                medicDiagnosis.innerHTML = "";
                medicPrescription.innerHTML = "";

                // $("#medicBoxLocation").after(medicBox());
                document
                    .querySelector("#medicWrap")
                    .classList.remove("d-block");
                document.querySelector("#medicWrap").classList.add("d-none");
                document
                    .querySelector("#medicConductBox")
                    .classList.remove("d-none");
                document
                    .querySelector("#medicConductBox")
                    .classList.add("d-flex");
                document
                    .querySelector("#medicMain")
                    .classList.add("medicBackImg");
                enableBtns();
                getMedicDiagnosisList();
                medicInfo();
                receiptList();
                showPatiList(praRoomNm);

                if (medicStatus.value === "payment") {
                    Swal.fire({
                        icon: "success",
                        title: "환자를 수납대기인 상태로 종료하였습니다.",
                    });
                } else if (medicStatus.value === "stay") {
                    Swal.fire({
                        icon: "success",
                        title: "환자를 입원대기인 상태로 종료하였습니다.",
                    });
                }
            }
        }
    });
};

medicAddBtn.addEventListener("mouseup", medicAdd);
medicOutBtn.addEventListener("mouseup", medicOut);
