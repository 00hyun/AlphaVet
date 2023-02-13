<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib
uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authentication property="principal" var="principal" />

<link
    type="text/css"
    rel="stylesheet"
    href="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.min.css"
/>
<link
    type="text/css"
    rel="stylesheet"
    href="${pageContext.request.contextPath }/resources/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css"
/>

<style>
	.medicMain.medicBackImg {
		background-image: url(${pageContext.request.contextPath }/resources/images/gif/mediBack2.gif);
        background-position: left 50% top 100px;
        background-size: 507px 324px;
        background-repeat: no-repeat;
	}

    .medicConductModal .modal-title,
    .medicConductBox .box-tile {
        font-size: 20px;
        font-weight: bold;
    }

    .medicVaccineHistory th,
    .medicVaccineHistory td {
        text-align: center;
    }

    .medicConductBox .medicGap,
    .medicWrap .medicGap {
        min-width: 20px;
    }

    .medicDiagnosis .medicAddedName,
    .medicPrescription .medicAddedName {
        max-width: 400px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .medicDiagnosis .medicDeleteMark,
    .medicPrescription .medicDeleteMark {
        cursor: pointer;
    }

    .medicPrescription .medicTestDateTd {
        padding-left: 34px;
    }

    .medicPrescription .medicDrugNumTd {
        max-width: 200px;
    }

    .medicDrugNumTd input {
        width: 50px;
        margin-left: 20px;
        text-align: right;
        border-top-width: 0;
        border-right-width: 0;
        border-bottom-width: 1;
        border-left-width: 0;
        border-radius: 0;
    }

    .medicDrugNumTd input:focus {
        outline: none;
    }

    .acceptDiv select,
    .acceptDiv button {
        width: 80px;
        height: 40px;
    }
</style>

<script src="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.all.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>

<jsp:include
    page="${pageContext.request.contextPath }/WEB-INF/views/alphaVet/medic/medicOrder.jsp"
/>
<jsp:include
    page="${pageContext.request.contextPath }/WEB-INF/views/alphaVet/medic/medicDocument.jsp"
/>
<jsp:include
    page="${pageContext.request.contextPath }/WEB-INF/views/alphaVet/medic/medicModal.jsp"
/>
<div id="medicMain" class="medicMain medicBackImg page-content">
    <div class="container-fluid">
        <div class="row">
            <jsp:include
                page="${pageContext.request.contextPath }/WEB-INF/views/vetComponents/patientList.jsp"
            />
            <div class="position-relative col-md-6 col-xl-8 h-100">
                <jsp:include
                    page="${pageContext.request.contextPath }/WEB-INF/views/alphaVet/medic/medicConductBox.jsp"
                />
                <div id="medicWrap" class="medicWrap d-none">
                    <jsp:include
                        page="${pageContext.request.contextPath }/WEB-INF/views/alphaVet/medic/medicHeader.jsp"
                    />
                    <div class="d-flex justify-content-between">
                        <div class="medicLeft">
                            <jsp:include
                                page="${pageContext.request.contextPath }/WEB-INF/views/alphaVet/medic/medicHistory.jsp"
                            />
                            <div class="card py-2">
                                <span class="card-header h5 bg-transparent">
                                    <i class="fas fa-syringe"></i>
                                    &nbsp; 예방접종
                                </span>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table
                                            id="medicVaccineHistory"
                                            class="medicVaccineHistory table table-centered mb-0 table-nowrap"
                                        >
                                            <thead>
                                                <tr>
                                                    <th
                                                        class="border-top-0"
                                                        scope="col"
                                                    >
                                                        접종명
                                                    </th>
                                                    <th
                                                        class="border-top-0"
                                                        scope="col"
                                                    >
                                                        접종유형
                                                    </th>
                                                    <th
                                                        class="border-top-0"
                                                        scope="col"
                                                    >
                                                        접종일
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td colspan="100%">
                                                        접종 내역이 없습니다
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="medicGap"></div>
                        <div class="medicRight card">
                            <div
                                class="card-body d-flex flex-column justify-content-between"
                            >
                                <div id="medicPraDetail">
                                    <div class="flexDiv">
                                        <span class="h5">
                                            <i class="fas fa-notes-medical"></i>
                                            &nbsp; 진료기록
                                        </span>
                                        <div>
                                            <button
                                                type="button"
                                                class="btn btn-light waves-effect d-flex align-items-center"
                                                onclick="clearPra()"
                                            >
                                                <i class="ri-edit-fill"></i>
                                                &nbsp;진료수정
                                            </button>
                                        </div>
                                    </div>
                                    <div
                                        class="flexDiv"
                                        style="margin-top: 5px"
                                    >
                                        <div
                                            contenteditable="true"
                                            id="praContent"
                                            class="p-2 border border-2 rounded"
                                            style="
                                                min-height: 200px;
                                                width: 610px;
                                            "
                                        ></div>
                                        <button
                                            onclick="medicTest()"
                                            id=""
                                            class="btn btn-outline-secondary"
                                            style="width: 200px; height: 200px"
                                        >
                                            <i
                                                class="ri-camera-line"
                                                style="zoom: 2"
                                            ></i>
                                            <img
                                                id="praImg"
                                                alt=""
                                                src=""
                                                data-recNm=""
                                                style="
                                                    width: 100%;
                                                    height: 100%;
                                                    display: none;
                                                "
                                            />
                                        </button>
                                    </div>
                                </div>
                                <div style="height: 20px;"></div>
                                <div>
                                    <div
                                        class="d-flex justify-content-between align-items-center"
                                    >
                                        <span class="h5">
                                            <i class="fas fa-diagnoses"></i>
                                            &nbsp;&nbsp;진단 및 처방
                                        </span>
                                        <div class="d-flex">
                                            <button
                                                type="button"
                                                data-bs-toggle="offcanvas"
                                                data-bs-target="#orderMenuBar"
                                                aria-controls="offcanvasScrolling"
                                                class="btn btn-light waves-effect d-flex align-items-center"
                                            >
                                                <i class="far fa-file-alt"></i>
                                                &nbsp;&nbsp;오더 메뉴
                                            </button>
                                            <button
                                                type="button"
                                                data-bs-toggle="modal"
                                                data-bs-target="#medicModal"
                                                id="medicModalBtn"
                                                class="btn btn-light waves-effect waves-light d-flex align-items-center"
                                            >
                                                <i class="far fa-file"></i>
                                                &nbsp;&nbsp;진단/처방 추가
                                            </button>
                                        </div>
                                    </div>
                                    <ul
                                        class="list-group list-group-flush overflow-auto"
                                    >
                                        <li class="list-group-item">
                                            <div class="table-responsive">
                                                <table
                                                    id="medicDiagnosis"
                                                    class="medicDiagnosis table table-centered mb-0 table-nowrap table-borderless"
                                                ></table>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="table-responsive">
                                                <table
                                                    id="medicPrescription"
                                                    class="medicPrescription table table-centered mb-0 table-nowrap table-borderless"
                                                ></table>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div
                                    id="acceptDiv"
                                    class="acceptDiv d-flex justify-content-end"
                                >
                                    <select id="medicStatus">
                                        <option
                                            value="payment"
                                            class="text-center"
                                            selected
                                        >
                                            수납
                                        </option>
                                        <option
                                            value="stay"
                                            class="text-center"
                                        >
                                            입원
                                        </option>
                                    </select>
                                    <div class="medicGap"></div>
                                    <button
                                        id="medicOutBtn"
                                        class="btn btn-primary waves-effect waves-light"
                                    >
                                        보내기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include
                page="${pageContext.request.contextPath }/WEB-INF/views/vetComponents/memo-bar.jsp"
            />
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath }/resources/medic/js/medicConduct.js"></script>
<script src="${pageContext.request.contextPath }/resources/medic/js/medicOut.js"></script>

<script>
    function medicTest() {
        let recNm = document
            .getElementById("medicHeaderPatient")
            .getAttribute("data-rec-nm");

        if (praImg.getAttribute("data-recNm") != "") {
            recNm = praImg.getAttribute("data-recNm");
        }
        window.open(
            "/medicTest?recNm=" + recNm,
            "_blank",
            "width=1050, height=800"
        );
    }

    function ajaxPraHistoryDetail(recNm) {
        $.ajax({
            method: "post",
            url: "/getPraHistoryDetail",
            data: "recNm=" + recNm,
            dataType: "json",
            success: function (rslt) {
                console.log(rslt);

                document.getElementById("praContent").innerHTML = rslt.praCon;
                document.getElementById("praContent").removeAttribute("contenteditable");

                let str = "";
                for (let i = 0; i < rslt.disDetailList.length; i++) {
                    str += `<tr data-dis-cd="\${rslt.disDetailList[i].disCd}">
				            <td class="medicAddedName">\${rslt.disDetailList[i].disName}</td>
				            <td></td>
                            <td class="text-end"></td>
				        </tr>`;
                }
                document.getElementById("medicDiagnosis").innerHTML = str;

                let str2 = "";

                for (let i = 0; i < rslt.testDetailList.length; i++) {
                    str2 += `<tr data-test-cd="\${rslt.testDetailList[i].testCd}">
			                <td class="medicAddedName">\${rslt.testDetailList[i].testName}</td>
			                <td class="medicTestDateTd">
			                    \${rslt.testDetailList[i].tdDate}
			                </td>
                            <td class="text-end"></td>
			            </tr>`;
                }

                for (let i = 0; i < rslt.preInList.length; i++) {
                    str2 += `<tr data-drug-nm="\${rslt.preInList[i].drugNm}">
			                <td class="medicAddedName">\${rslt.preInList[i].itemName}</td>
			                <td class="medicDrugNumTd d-flex justify-content-between align-items-center">
			                    <div>
			                        <input
			                            type="number"
			                            value="1"
			                            class="form-control medicDrugAmount"
			                            onChange="changeDrugNum(this, \${rslt.preInList[i].preInAmount}, 'amount')" readonly="readonly"
			                        />
			                    </div>
			                    <div>
			                        <input
			                            type="number"
			                            value="1"
			                            class="form-control medicDrugCount"
			                            onChange="changeDrugNum(this, \${rslt.preInList[i].preInCnt}, 'count')" readonly="readonly"
			                        />
			                    </div>
			                    <div>
			                        <input
			                            type="number"
			                            value="1"
			                            class="form-control medicDrugDays"
			                            onChange="changeDrugNum(this, \${rslt.preInList[i].preInDays}, 'days')" readonly="readonly"
			                        />
			                    </div>
			                </td>
                            <td class="text-end"></td>
			            </tr>`;
                }

                for (let i = 0; i < rslt.preOutList.length; i++) {
                    str2 += `<tr data-drug-nm="\${rslt.preOutList[i].drugNm}">
			                <td class="medicAddedName">\${rslt.preOutList[i].itemName}</td>
			                <td class="medicDrugNumTd d-flex justify-content-between align-items-center">
			                    <div>
			                        <input
			                            type="number"
			                            value="1"
			                            class="form-control medicDrugAmount"
			                            onChange="changeDrugNum(this, \${rslt.preOutList[i].preInAmount}, 'amount')" readonly="readonly"
			                        />
			                    </div>
			                    <div>
			                        <input
			                            type="number"
			                            value="1"
			                            class="form-control medicDrugCount"
			                            onChange="changeDrugNum(this, \${rslt.preOutList[i].preInCnt}, 'count')" readonly="readonly"
			                        />
			                    </div>
			                    <div>
			                        <input
			                            type="number"
			                            value="1"
			                            class="form-control medicDrugDays"
			                            onChange="changeDrugNum(this, \${rslt.preOutList[i].preInDays}, 'days')" readonly="readonly"
			                        />
			                    </div>
			                </td>
			            </tr>`;
                }
                document.getElementById("medicPrescription").innerHTML = str2;

                let praImg = document.getElementById("praImg");
                if (rslt.praImg.includes("resources")) {
                    praImg.src = rslt.praImg;
                    praImg.style.display = "";
                    praImg.previousElementSibling.style.display = "none";
                    praImg.setAttribute("data-recNm", recNm);
                }
                praImg.setAttribute("data-recNm", recNm);
            },
        });
    }

    function getPraHistoryDetail(btn) {
        // 	let recNm = document.getElementById("medicHeaderPatient").getAttribute("data-rec-nm");
        let recNm = btn.closest(".accordion-item").getAttribute("data-rec-nm");
        console.log("recNm = " + recNm);
        // 	let recNm = "613";
        // 	let praCd = 'p0169';

        ajaxPraHistoryDetail(recNm);
    }

    function clearPra() {
        document.getElementById("praContent").innerHTML = "";
        document.getElementById("medicDiagnosis").innerHTML = "";
        document.getElementById("medicPrescription").innerHTML = "";

        let praImg = document.getElementById("praImg");
        praImg.src = "";
        praImg.style.display = "none";
        praImg.previousElementSibling.style.display = "";
        praImg.setAttribute("data-recNm", "");
        document.getElementById("praContent").setAttribute("contenteditable", true);
    }
    
    window.callMedicDiagnosisList = function() {
    	getMedicDiagnosisList();
    }
</script>
