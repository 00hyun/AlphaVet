<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
        <a role="tab" href="#medicAppendDisDiv" data-bs-toggle="tab"
            aria-selected="true" id="medicAppendDisTab"
            class="nav-link active">
            <span class="d-block d-sm-none"><i
                    class="fas fa-home"></i></span>
            <span class="d-none d-sm-block">
                <i class="fas fa-disease"></i>
                &nbsp;
                질병
            </span>
        </a>
    </li>
    <li class="nav-item">
        <a role="tab" href="#medicAppendTestDiv" data-bs-toggle="tab"
            aria-selected="false" id="medicAppendTestTab" class="nav-link">
            <span class="d-block d-sm-none"><i
                    class="far fa-user"></i></span>
            <span class="d-none d-sm-block">
                <i class="fas fa-stethoscope"></i>
                &nbsp;
                검사
            </span>
        </a>
    </li>
    <li class="nav-item">
        <a role="tab" href="#medicAppendDrugDiv" data-bs-toggle="tab"
            aria-selected="false" id="medicAppendDrugTab" class="nav-link">
            <span class="d-block d-sm-none"><i
                    class="far fa-envelope"></i></span>
            <span class="d-none d-sm-block">
                <i class="fas fa-pills"></i>
                &nbsp;
                약품
            </span>
        </a>
    </li>
    <li class="nav-item">
        <a role="tab" href="#medicAppendVaccDiv" data-bs-toggle="tab"
            aria-selected="false" id="medicAppendVaccTab" class="nav-link">
            <span class="d-block d-sm-none"><i
                    class="far fa-envelope"></i></span>
            <span class="d-none d-sm-block">
                <i class="fas fa-syringe"></i>
                &nbsp;
                예방접종
            </span>
        </a>
    </li>
</ul>
<!-- Tab panes -->
<div class="tab-content p-2 text-muted">
    <div role="tabpanel" id="medicAppendDisDiv" class="tab-pane active">
        <table id="medicAppendDis" class="table dt-responsive nowrap w-100">
            <thead>
                <tr>
                    <th>질병 목록</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
    <div role="tabpanel" id="medicAppendTestDiv" class="tab-pane">
        <table id="medicAppendTest"
            class="table dt-responsive nowrap w-100">
            <thead>
                <tr>
                    <th>검사 목록</th>
                </tr>
            </thead>
            <tbody id="testBody"></tbody>
        </table>
    </div>
    <div role="tabpanel" id="medicAppendDrugDiv" class="tab-pane">
        <table id="medicAppendDrug"
            class="table dt-responsive nowrap w-100">
            <thead>
                <tr>
                    <th>약품 목록</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
    <div role="tabpanel" id="medicAppendVaccDiv" class="tab-pane">
        <table id="medicAppendVacc"
            class="table dt-responsive nowrap w-100">
            <thead>
                <tr>
                    <th>예방접종 목록</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>