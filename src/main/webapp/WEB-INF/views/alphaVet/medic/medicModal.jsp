<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<script src="https://cdn.datatables.net/plug-ins/1.13.1/features/pageResize/dataTables.pageResize.min.jss"></script>

<!-- 진료 처방 모달 -->
<div class="modal fade" id="medicModal" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog modal-dialog-scrollable modal-lg">
        <div class="modal-content" style="min-height: 850px; max-height: 950px">
            <div class="card-body" style="min-height: 750px; max-height: 950px">
                <jsp:include
                    page="${pageContext.request.contextPath }/WEB-INF/views/alphaVet/medic/medicModalTop.jsp"
                />
                <jsp:include
                    page="${pageContext.request.contextPath }/WEB-INF/views/alphaVet/medic/medicModalBottom.jsp"
                />
            </div>
            <div class="modal-footer">
                <button
                    data-bs-dismiss="modal"
                    id="medicAddBtn"
                    class="btn btn-primary waves-effect waves-light"
                >
                    추가하기
                </button>
            </div>
        </div>
    </div>
</div>
