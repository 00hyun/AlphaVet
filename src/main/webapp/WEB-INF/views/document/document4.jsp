<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8" />
    <title>(입력용)진단서</title>
    <link type="text/css" rel="stylesheet"
        href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet"
        href="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.min.css" />
    <style>
        body {
            box-sizing: border-box;
        }

        tr {
            height: 30px;
        }

        th {
            text-align: center;
            border: 1px solid #aaaaaa;
        }

        td {
            text-align: center;
            border: 1px solid #aaaaaa;
        }

        table {
            width: 100%;
            height: 100%;
            margin-bottom: 10px;
            border: 1px solid #aaaaaa;
            border-width: 3px 0px;
            border-collapse: collapse;
            empty-cells: show;
        }

        .a4Page {
            width: 21cm;
            min-height: 29.7cm;
            padding: 1.5cm 1.5cm 2cm 1.5cm;
        }

        h1 {
            font-weight: 1000;
            text-align: center;
        }

        .gray {
            background-color: lightgray;
        }

        table th:first-child,
        table td:first-child {
            border-left: 0;
        }

        table th:last-child,
        table td:last-child {
            border-right: 0;
        }

        .medicSaveDocBtn {
            margin-top: 20px;
            margin-left: 660px;
        }

        .lineNone,
        .lineNone th,
        .lineNone td {
            border: none;
        }

        .medicDocTd {
            padding: 4px;
            text-align: start;
        }

        .medicDocFeature {
            height: 100px;
            max-height: 100px;
        }
    </style>
    <script
        src="${pageContext.request.contextPath }/resources/assets/libs/jquery/jquery.min.js"></script>
    <script
        src="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.all.min.js"></script>
    <!-- html2canvas -->
    <script
        src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    <!-- jspdf -->
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
</head>

<body>
    <input type="button" value="자동완성" id="medicAutoDocBtn"
        class="medicAutoDocBtn btn btn-primary waves-light waves-effect" />
    <input type="button" value="저장"
        data-pra-cd="${docFileData.praVO.praCd}"
        id="medicSaveDocBtn"
        class="medicSaveDocBtn btn btn-primary waves-light waves-effect" />
    <div id="medicDocDiv" class="medicDocDiv page-content a4Page">
        <br /> <br />
        <h1>진&nbsp;&nbsp;&nbsp;단&nbsp;&nbsp;&nbsp;서</h1>
        <br />
        <table>
            <tr>
                <th rowspan="2" width="100">동물 소유자<br /> (관리인)
                </th>
                <th width="50">성명</th>
                <td id="medicDocMemName">
                    ${docFileData.memberVO.memName }</td>
            </tr>
            <tr>
                <th>주소</th>
                <td id="medicDocAdd">${docFileData.patientVO.patAdd1
                    }&nbsp;${docFileData.patientVO.patAdd2 }
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <th rowspan="4" width="100">동물의 표시</th>
                <th width="50">종류</th>
                <td width="320" id="medicDocAnimalCd">
                    <c:choose>
                        <c:when
                            test="${'cat' eq docFileData.patientVO.animalCd }">
                            고양이</c:when>
                        <c:when
                            test="${'dog' eq docFileData.patientVO.animalCd }">
                            강아지</c:when>
                        <c:otherwise>기타</c:otherwise>
                    </c:choose>
                </td>
                <th width="50">품종</th>
                <td width="160" contenteditable="true"
                    id="medicDocBreed" class="medicDocBreed"></td>
            </tr>
            <tr>
                <th>동물명</th>
                <td width="320" id="medicDocPatName">
                    ${docFileData.patientVO.patName }</td>
                <th>성별</th>
                <td width="160" id="medicDocPatGender">
                    ${docFileData.patientVO.patGender }</td>
            </tr>
            <tr>
                <th>연령</th>
                <td width="320"
                    data-pat-birth="${docFileData.patientVO.patBirth }"
                    id="medicDocPatBirth"></td>
                <th>모색</th>
                <td width="160" contenteditable="true"
                    id="medicDocFurColor" class="medicDocFurColor">
                </td>
            </tr>
            <tr>
                <th>특징</th>
                <td contenteditable="true" colspan="3"
                    id="medicDocFeature"
                    class="medicDocTd medicDocFeature"></td>
            </tr>
        </table>

        <table>
            <tr>
                <th width="100">병명</th>
                <td id="medicDocDisease" style="text-align: left">
                    &nbsp; <c:forEach var="disDetailVO"
                        items="${docFileData.disDetailVOList }"
                        varStatus="status">${disDetailVO.disName }
                        <c:if test="${status.last != true }">,
                        </c:if>
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <th width="100">발병 연월일<br /> (임신 연월일)
                </th>
                <td contenteditable="true" id="medicDocOutbreakDay"
                    class="medicDocTd medicDocOutbreakDay"></td>
            </tr>
            <tr>
                <th width="100">진단 연월일</th>
                <td id="medicDocPraDate" class="text-start">
                    <fmt:formatDate
                        value="${docFileData.praVO.praDate }"
                        pattern="yyyy-MM-dd" />
                </td>
            </tr>
            <tr>
                <th width="100">예후 소견</th>
                <td contenteditable="true" id="medicDocPrognosis"
                    class="medicDocTd medicDocPrognosis"></td>
            </tr>
            <tr>
                <th width="100">그 밖의 사항</th>
                <td height="130" contenteditable="true"
                    id="medicDocETC" class="medicDocTd medicDocETC">
                </td>
            </tr>
        </table>

        <br /> <br />

        <table border="" class="lineNone">
            <tr>
                <th colspan="5" height="50">수의사법 제 12조 및 같은 법 시행 규칙
                    제 9조에 따라 위와
                    같이 증명합니다.</th>
            </tr>
            <tr>
                <th colspan="5" id="docDate"
                    style="text-align: right"><span
                        id="docYear"></span>년
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
                        id="docMonth"></span>월
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
                        id="docDay"></span>일</th>
            </tr>
            <tr>
                <td width="50"></td>
                <th width="150" style="text-align: left">동물병원 명칭 :
                </th>
                <td colspan="3" id="medicDocCliName"
                    style="text-align: left">
                    ${docFileData.clinicVO.cliName }</td>
            </tr>
            <tr>
                <td></td>
                <th style="text-align: left">동물병원 주소 :</th>
                <td width="200" id="medicDocCliAddr"
                    style="text-align: left">
                    ${docFileData.clinicVO.cliAddr1
                    }&nbsp;${docFileData.clinicVO.cliAddr2 }
                </td>
                <th style="text-align: left">전화번호 :</th>
                <td id="medicDocCliTel" style="text-align: left">
                    ${docFileData.clinicVO.cliTel }</td>
            </tr>
            <tr>
                <td></td>
                <th style="text-align: left">수의사 면허번호 :</th>
                <td id="medicDocManagerId" style="text-align: left">
                    제&nbsp;${docFileData.empVO.managerId }&nbsp;호
                </td>
                <th style="text-align: left">수의사 성명 :&nbsp;</th>
                <td id="medicDocEmpName" class="position-relative"
                    style="text-align: right"><img
                        src="${pageContext.request.contextPath }/resources/images/document/대덕인재.png"
                        alt="병원인" class="position-absolute"
                        style="left: 50%; width: 80px;" />
                    ${docFileData.empVO.empName }&nbsp;(서명 또는 인)
                </td>
            </tr>
        </table>
    </div>
    <!-- <input type="button" id="page_print" onclick="window.print();" value="전체프린트" /> -->
    <script>
        const medicDocDiv = document.querySelector("#medicDocDiv");
        const medicSaveDocBtn = document.querySelector("#medicSaveDocBtn");
        const medicAutoDocBtn = document.querySelector("#medicAutoDocBtn");
        const medicDocTd = document.querySelectorAll(".medicDocTd");

        function disPlayPatAge() {
            const patAgeTd = document.querySelector("td[data-pat-birth]");

            const { patBirth } = patAgeTd.dataset;

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
                age = `\${ageYears}년 \${ageMonths}개월`;
            } else if (0 <= ageMonths <= 12) {
                age = `\${ageMonths}개월`;
            } else {
                age = "?개월";
            }

            patAgeTd.innerText = age;
        }

        function disPlayDocDate() {
            const docDate = document.querySelector("#docDate");
            const docYear = docDate.querySelector("#docYear");
            const docMonth = docDate.querySelector("#docMonth");
            const docDay = docDate.querySelector("#docDay");

            const date = new Date();
            const year = date.getFullYear();
            const month = date.getMonth() + 1;
            const day = date.getDate();

            docYear.innerText = year;
            docMonth.innerText = month;
            docDay.innerText = day;
        }

        function makePdf() {
            return new Promise(function (resolve) {
                window.scrollTo(0, 0);

                //capture하고자 하는 영역 아이디 값 넣어주기
                html2canvas(medicDocDiv[0]).then(function (canvas) {
                    const myImg = canvas.toDataURL("image/jpg");

                    const pagewidth = 210;
                    const pageheight = 297;
                    const imgWidth = pagewidth;
                    const imgHeight =
                        (canvas.height * imgWidth) / canvas.width;

                    let heightLeft = imgHeight;

                    const doc = new jsPDF("p", "mm", "a4");

                    // 한 페이지 이상일 경우 루프 돌면서 출력
                    // while (heightLeft >= 0) {
                    // const position = heightLeft - imgHeight;
                    doc.addImage(
                        myImg,
                        "jpg",
                        0,
                        -20,
                        imgWidth,
                        imgHeight + 20
                    );
                    // heightLeft -= pageheight;
                    // if (heightLeft > 0) {
                    //         doc.addPage();
                    //     }
                    // }

                    // doc.save("result.pdf");
                    resolve(doc);
                });

                // const initBody = document.body.innerHTML;
                // window.onbeforeprint = function () {
                //     document.body.innerHTML =
                //         document.getElementById(target_id).innerHTML;
                // };
                // window.onafterprint = function () {
                //     document.body.innerHTML = initBody;
                // };
                // window.print();
            });
        }

        function medicSaveDoc(event) {
            Swal.fire({
                icon: "warning",
                title: "진단서를 저장하시겠습니까?",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "예",
                cancelButtonText: "아니오",
            }).then(async (result) => {
                if (result.isConfirmed) {
                    const { praCd } = event.target.dataset;

                    const medicDocBreedText =
                        document.querySelector("#medicDocBreed").innerText;
                    const medicDocFurColorText =
                        document.querySelector(
                            "#medicDocFurColor"
                        ).innerText;
                    const medicDocFeatureText =
                        document.querySelector(
                            "#medicDocFeature"
                        ).innerText;
                    const medicDocOutbreakText = document.querySelector(
                        "#medicDocOutbreakDay"
                    ).innerText;
                    const medicDocPrognosisText =
                        document.querySelector(
                            "#medicDocPrognosis"
                        ).innerText;
                    const medicDocETCText =
                        document.querySelector("#medicDocETC").innerText;

                    const response = await fetch(
                        "/document/diagnosis/save",
                        {
                            method: "POST",
                            cache: "no-cache",
                            headers: {
                                "Content-Type": "application/json",
                            },
                            body: JSON.stringify({
                                praCd,
                                dfBreed: medicDocBreedText,
                                dfFurColor: medicDocFurColorText,
                                dfFeature: medicDocFeatureText,
                                dfOutBreak: medicDocOutbreakText,
                                dfPrognosis: medicDocPrognosisText,
                                dfEtc: medicDocETCText,
                            }),
                        }
                    );
                    const text = await response.text();

                    if (text === "FAILED") {
                        Swal.fire({
                            icon: "error",
                            title: "진단서 저장 실패",
                        });
                    } else {
                        Swal.fire({
                            icon: "success",
                            title: "진단서를 저장했습니다.",
                        }).then(() => {
                            opener.callMedicDiagnosisList();
                            setTimeout(() => window.close(), 2000);
                        });
                    }
                }
            });
        }

        function medicAutoDoc() {
            const medicDocBreedText = document.querySelector("#medicDocBreed");
            const medicDocFurColorText = document.querySelector("#medicDocFurColor");
            const medicDocFeatureText = document.querySelector("#medicDocFeature");
            const medicDocOutbreakDayText = document.querySelector("#medicDocOutbreakDay");
            const medicDocPrognosisText = document.querySelector("#medicDocPrognosis");
            const medicDocETCText = document.querySelector("#medicDocETC");

            const medicDocPraDateText = document.querySelector("#medicDocPraDate");
            const praDateText = new Date(medicDocPraDate.innerText);
            const outbreakDayText = new Date(praDateText.setDate(praDateText.getDate() - 3));
            const outbreakYearText = outbreakDayText.getFullYear()
            const outbreakMonthText = outbreakDayText.getMonth() + 1 < 10 ? `0\${outbreakDayText.getMonth() + 1}`: `\${outbreakDayText.getMonth() + 1}`;
            const outbreakDateText = outbreakDayText.getDate() < 10 ? `0\${outbreakDayText.getDate()}`: `\${outbreakDayText.getDate()}`;

            medicDocBreedText.innerText = "말티즈";
            medicDocFurColorText.innerText = "흰색";
            medicDocFeatureText.innerText = "귀여움";
            medicDocOutbreakDayText.innerText = `\${outbreakYearText}-\${outbreakMonthText}-\${outbreakDateText}`;
            medicDocPrognosisText.innerText = "괜찮아짐";
            medicDocETCText.innerText = "기타";
        }

        window.addEventListener("DOMContentLoaded", disPlayPatAge);
        window.addEventListener("DOMContentLoaded", disPlayDocDate);
        medicSaveDocBtn.addEventListener("mouseup", medicSaveDoc);
        medicAutoDocBtn.addEventListener("mouseup", medicAutoDoc);
    </script>
</body>

</html>