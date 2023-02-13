<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <link
            type="text/css"
            rel="stylesheet"
            href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css"
        />
        <title>진단서</title>
        <style>
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
            #page_print {
                margin-top: 20px;
                margin-left: 660px;
            }
            .lineNone,
            .lineNone th,
            .lineNone td {
                border: none;
            }
        </style>
    </head>
    <body>
        <input
            type="button"
            value="프린트"
            id="page_print"
            class="btn btn-primary waves-light waves-effect printBtnClass"
            onclick="print_btn('docDiv');"
        />
        <div id="docDiv" class="page-content a4Page">
            <br /><br />
            <h1>진&nbsp;&nbsp;&nbsp;단&nbsp;&nbsp;&nbsp;서</h1>
            <br />
            <table>
                <tr>
                    <th rowspan="2" width="100">
                        동물 소유자<br />
                        (관리인)
                    </th>
                    <th width="50">성명</th>
                    <td id="doc2Id"></td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td id="doc2addr"></td>
                </tr>
            </table>

            <table>
                <tr>
                    <th rowspan="4" width="100">동물의 표시</th>
                    <th width="50">종류</th>
                    <td id="doc2kind"></td>
                    <th width="50">품종</th>
                    <td id="doc2dfBreed"></td>
                </tr>
                <tr>
                    <th>동물명</th>
                    <td id="doc2patName"></td>
                    <th>성별</th>
                    <td id="doc2gender"></td>
                </tr>
                <tr>
                    <th>연령</th>
                    <td id="doc2age"></td>
                    <th>모색</th>
                    <td id="doc2dfFurColor"></td>
                </tr>
                <tr>
                    <th>특징</th>
                    <td colspan="3" height="100" id="doc2dfFeature"></td>
                </tr>
            </table>

            <table>
                <tr>
                    <th width="100">병명</th>
                    <td id="doc2disName"></td>
                </tr>
                <tr>
                    <th width="100">
                        발병 연월일<br />
                        (임신 연월일)
                    </th>
                    <td id="doc2dfOutBreak"></td>
                </tr>
                <tr>
                    <th width="100">진단 연월일</th>
                    <td id="doc2praDate"></td>
                </tr>
                <tr>
                    <th width="100">예후 소견</th>
                    <td id="doc2dfPrognosis"></td>
                </tr>
                <tr>
                    <th width="100">그 밖의 사항</th>
                    <td height="130" id="doc2dfEtc"></td>
                </tr>
            </table>

            <br /><br />

            <table border="0" class="lineNone">
                <tr>
                    <th colspan="5" height="50">
                        수의사법 제 12조 및 같은 법 시행 규칙 제 9조에 따라 위와
                        같이 증명합니다.
                    </th>
                </tr>
                <tr>
                    <th colspan="5" style="text-align: right">
                        2023년
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2월
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10일
                    </th>
                </tr>
                <tr>
                    <td width="50"></td>
                    <th width="150" style="text-align: left">
                        동물병원 명칭 : 
                    </th>
                    <td colspan="3" style="text-align: left;">대덕인재동물병원</td>
                </tr>
                <tr>
                    <td></td>
                    <th style="text-align: left">동물병원 주소 :</th>
                    <td width="200">대전광역시 중구 오류동 175-13 대전광역시 중구 계룡로 846</td>
                    <th style="text-align: left">전화번호 :</th>
                    <td>043-832-8340</td>
                </tr>
                <tr>
                    <td></td>
                    <th style="text-align: left">수의사 면허번호 :</th>
                    <td style="text-align: left">
                        &nbsp;&nbsp;&nbsp;
                        제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        호
                    </td>
                    <th style="text-align: left">수의사 성명 :</th>
                    <td class="position-relative" style="text-align: right">허소영
                    	<img
                    		src="${pageContext.request.contextPath }/resources/images/document/대덕인재.png"
                    		alt="병원인"
                    		class="position-absolute"
                    		style="left: 50%; width: 80px;"
                    	/>
                    	(서명 또는 인)
                    </td>
                </tr>
            </table>
        </div>
        <!-- <input type="button" id="page_print" onclick="window.print();" value="전체프린트" /> -->
        <script>
            function print_btn(target_id) {
                var initBody = document.body.innerHTML;
                window.onbeforeprint = function () {
                    document.body.innerHTML =
                        document.getElementById(target_id).innerHTML;
                };
                window.onafterprint = function () {
                    document.body.innerHTML = initBody;
                };
                window.print();
            }
        </script>
    </body>
</html>
