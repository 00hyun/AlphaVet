<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
        <a
            role="tab"
            href="#medicDisease"
            data-bs-toggle="tab"
            aria-selected="false"
            id="medicDiseaseTab"
            class="nav-link"
        >
            <span>
                <i class="fas fa-disease"></i>
                &nbsp;
                질병
            </span>
        </a>
    </li>
    <li class="nav-item">
        <a
            role="tab"
            href="#medicTest"
            data-bs-toggle="tab"
            aria-selected="true"
            id="medicTestTab"
            class="nav-link active"
        >
            <span>
                <i class="fas fa-stethoscope"></i>
                &nbsp;
                검사
            </span>
        </a>
    </li>
    <li class="nav-item">
        <a
            role="tab"
            href="#medicPreOutDrug"
            data-bs-toggle="tab"
            aria-selected="false"
            id="medicPreOutTab"
            class="nav-link"
        >
            <span>
                <i class="fas fa-capsules"></i>
                &nbsp;
                원외 약품
            </span>
        </a>
    </li>
    <li class="nav-item">
        <a
            role="tab"
            href="#medicPreInDrug"
            data-bs-toggle="tab"
            aria-selected="false"
            id="medicPreInTab"
            class="nav-link"
        >
            <span>
                <i class="fas fa-tablets"></i>
                &nbsp;
                원내 약품
            </span>
        </a>
    </li>
    <li class="nav-item">
        <a
            role="tab"
            href="#medicVaccine"
            data-bs-toggle="tab"
            aria-selected="false"
            id="medicVaccineTab"
            class="nav-link"
        >
            <span>
                <i class="fas fa-syringe"></i>
                &nbsp;
                예방접종
            </span>
        </a>
    </li>
</ul>
<!-- Tab panes -->
<div class="tab-content p-2 text-muted">
    <div role="tabpanel" id="medicDisease" class="tab-pane">
        <div class="search-box ms-2">
            <div class="position-relative">
                <input
                    type="text"
                    id="medicDiseaseSearch"
                    class="form-control rounded"
                    placeholder="질병 검색"
                />
                <i class="mdi mdi-magnify search-icon"></i>
            </div>
        </div>
        <div class="row mb-4">
            <div class="col">
                <div class="row">
                    <div class="col-12">
                        <table
                            id="medicDiseaseTable"
                            class="table dt-responsive nowrap w-100"
                        >
                            <thead>
                                <tr class="w-auto">
                                    <th>질병 분류</th>
                                    <th>질병명</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div role="tabpanel" id="medicTest" class="tab-pane active">
        <div class="search-box ms-2">
            <div class="position-relative">
                <input
                    type="text"
                    placeholder="검사 검색"
                    id="medicTestSearch"
                    class="form-control rounded"
                />
                <i class="mdi mdi-magnify search-icon"></i>
            </div>
        </div>
        <div class="row mb-4">
            <div class="col">
                <div class="row">
                    <div class="col-12">
                        <table
                            id="medicTestTable"
                            class="table dt-responsive nowrap w-100"
                        >
                            <thead>
                                <tr>
                                    <th>검사명</th>
                                    <th>검사 내용</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tab-pane" id="medicPreOutDrug" role="tabpanel">
        <div class="search-box ms-2">
            <div class="position-relative">
                <input
                    type="text"
                    placeholder="원외 약품 검색"
                    id="medicPreOutSearch"
                    class="form-control rounded"
                />
                <i class="mdi mdi-magnify search-icon"></i>
            </div>
        </div>
        <div class="row mb-4">
            <div class="col">
                <div class="row">
                    <div class="col-12">
                        <table
                            id="medicPreOutTable"
                            class="table dt-responsive nowrap w-100"
                        >
                            <thead>
                                <tr>
                                    <!-- <th>재고 번호</th> -->
                                    <!-- <th>약품 번호</th> -->
                                    <th>약품명</th>
                                    <th>약품 영문명</th>
                                    <!-- <th>업체명</th> -->
                                    <!-- <th>약품가격</th> -->
                                    <!-- <th>약품 수량</th> -->
                                    <!-- <th>최종 입고일</th> -->
                                </tr>
                            </thead>
                            <!-- <tbody id="drugTbody"> -->
                            <!-- </tbody> -->
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tab-pane" id="medicPreInDrug" role="tabpanel">
        <div class="search-box ms-2">
            <div class="position-relative">
                <input
                    type="text"
                    placeholder="원내 약품 검색"
                    id="medicPreInSearch"
                    class="form-control rounded"
                />
                <i class="mdi mdi-magnify search-icon"></i>
            </div>
        </div>
        <div class="row mb-4">
            <div class="col">
                <div class="row">
                    <div class="col-12">
                        <table
                            id="medicPreInTable"
                            class="table dt-responsive nowrap w-100"
                        >
                            <thead>
                                <tr>
                                    <!-- <th>재고 번호</th> -->
                                    <!-- <th>약품 번호</th> -->
                                    <th>약품명</th>
                                    <th>약품 영문명</th>
                                    <!-- <th>업체명</th> -->
                                    <!-- <th>약품가격</th> -->
                                    <!-- <th>약품 수량</th> -->
                                    <!-- <th>최종 입고일</th> -->
                                </tr>
                            </thead>
                            <!-- <tbody id="drugTbody"> -->
                            <!-- </tbody> -->
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tab-pane" id="medicVaccine" role="tabpanel">
        <div class="search-box ms-2">
            <div class="position-relative">
                <input
                    type="text"
                    placeholder="예방접종 검색"
                    id="medicVaccineSearch"
                    class="form-control rounded"
                />
                <i class="mdi mdi-magnify search-icon"></i>
            </div>
        </div>
        <div class="row mb-4">
            <div class="col">
                <div class="row">
                    <div class="col-12">
                        <table
                            id="medicVaccineTable"
                            class="table dt-responsive nowrap w-100"
                        >
                            <thead>
                                <tr>
                                    <th>접종명</th>
                                    <th>동물 분류</th>
                                    <th>접종 유형</th>
                                    <th>차수</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
