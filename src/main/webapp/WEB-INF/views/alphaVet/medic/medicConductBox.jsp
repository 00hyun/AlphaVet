<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<style>
    .medicConductBox {
        margin-top: 300px;
    }

    .medicConductBox .card {
        border-radius: 15px;
    }

    .medicConductBox .medicBoxTop {
        width: 65%;
        height: 50%;
        /* box-shadow: unset; */
    }

    .medicConductBox .praRoom {
        font-weight: bold;
        color: #445990;
    }

    .medicConductBox .praRoom {
        font-size: 24px;
    }

    .medicConductBox .medicBoxBottom {
        width: 65%;
    }

    .medicConductBox .medicTempSearch {
        width: 570px;
    }

    .medicBoxBottom .medicNewOrder,
    .medicBoxBottom .medicDiagnosisDoc {
        width: 100%;
    }
</style>

<div
    id="medicConductBox"
    class="medicConductBox position-absolute d-none flex-column justify-content-center align-items-center w-100"
>
    <div
        id="medicTempSearch"
        class="medicTempSearch row"
        style="margin: 0 auto"
    >
        <div class="col-md-6 w-100" style="margin: 0 auto">
            <form class="app-search d-none d-lg-block">
                <div class="position-relative">
                    <input
                        type="text"
                        placeholder="Search..."
                        autocomplete="off"
                        id="search"
                        class="form-control ui-autocomplete-input"
                    />
                    <span class="ri-search-line"></span>
                    <div
                        id="searchResult"
                        class="searchResult list-group position-absolute"
                    ></div>
                </div>
            </form>
        </div>
    </div>
    <div class="medicBoxTop card">
        <div class="card-body">
            <h1 class="praRoom card-title display-5"></h1>
            <p class="card-text mb-4">
                <span class="h5">담당의</span>
                <span>&nbsp;</span>
                <span class="doctorName h5"></span>
            </p>
            <p id="medicBoxInfo" class="medicBoxInfo card-text h5">
                <span>다음 대기 환자를 선택해주세요.</span>
            </p>
            <div
                id="medicBoxBtns"
                class="medicBoxBtns d-flex justify-content-end"
            >
                <button class="btn btn-light waves-effect waves-light" disabled>
                    진행하기
                </button>
            </div>
        </div>
    </div>
    <div
        class="medicBoxBottom d-flex justify-content-between align-items-center"
    >
        <div class="medicNewOrder card">
            <div class="card-body">
                <h4 class="card-title font-weight-bold">
                    새로운 오더 리스트 추가
                </h4>
                <div class="d-flex justify-content-end">
                    <button
                        type="button"
                        data-bs-toggle="offcanvas"
                        data-bs-target="#orderMenuBar"
                        aria-controls="offcanvasScrolling"
                        id="medicNewOrderBtn"
                        class="btn btn-primary waves-effect"
                    >
                        추가
                    </button>
                </div>
            </div>
        </div>
        <div class="medicGap"></div>
        <div class="medicDiagnosisDoc card">
            <div class="card-body">
                <h4 class="card-title font-weight-bold">진단서 입력</h4>
                <div class="d-flex justify-content-end">
                    <button
                        type="button"
                        data-bs-toggle="offcanvas"
                        data-bs-target="#docMenuBar"
                        aria-controls="offcanvasScrolling"
                        id="medicDocBtn"
                        class="btn btn-primary waves-effect"
                    >
                        입력
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    const medicNewOrderBtn = document.querySelector("#medicNewOrderBtn");

    let newOrderToggle = false;
    let docToggle = false;

    const medicNewOrderToggle = () => {
        if (!newOrderToggle) {
            document.querySelector("a[href='#addOrderSetTab']").click();
            medicNewOrderBtn.innerText = "닫기";
            newOrderToggle = true;
        } else {
            document.querySelector("a[href='#orderSetTab']").click();
            medicNewOrderBtn.innerText = "추가";
            newOrderToggle = false;
        }
    };

    const medicDocToggle = () => {
        if (!docToggle) {
            medicDocBtn.innerText = "닫기";
            docToggle = true;
        } else {
            medicDocBtn.innerText = "입력";
            docToggle = false;
        }
    };

    medicNewOrderBtn.addEventListener("mouseup", medicNewOrderToggle);
    medicDocBtn.addEventListener("mouseup", medicDocToggle);
</script>
