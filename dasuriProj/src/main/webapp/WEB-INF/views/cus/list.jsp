<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.form-control2 {
  width: 100%;
  height: calc(2.25rem + 2px);
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: #495057;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #ced4da;
  border-radius: 0.25rem;
  box-shadow: inset 0 0 0 rgba(0, 0, 0, 0);
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
</style>
<div class="card" style="margin-top: 5%;">
	<div class="card-header">
		<h3 class="card-title">다수리 고객 목록</h3>
	</div>
	<!-- /.card-header -->
	<div class="card-body">
		<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
			<div class="row">
				<div class="col-sm-12 col-md-6"></div>
				<div class="col-sm-12 col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="row" style="float: right;">
						<form method="get" action="/cus/list" name="frmSearch" id="frmSearch">
							<input type="hidden" name="currentPage" value="1" />
							<select class="form-control2" id="selSearch" name="selSearch" style="width: 100px;">
								<option value="">전체</option>
								<option value="-----">-----</option>
								<option value="cusNm"
									<c:if test="${param.selSearch=='cusNm'}">selected</c:if>
								>고객명</option>
								<option value="addr"
									<c:if test="${param.selSearch=='addr'}">selected</c:if>
								>주소</option>
								<option value="pne"
									<c:if test="${param.selSearch=='pne'}">selected</c:if>
								>연락처</option>
							</select>&nbsp;
							<input class="form-control2"  style="width: 200px;" type="text"  id="keyword" name="keyword" value="${param.keyword}" placeholder="검색어를 입력해주세요" />&nbsp;
							<button type="submit" class="btn btn-primary">검색</button>
						</form>
					</div><br/><br/>
					<table id="example2"
						class="table table-bordered table-hover dataTable dtr-inline"
						role="grid" aria-describedby="example2_info">
						<thead>
							<tr role="row">
								<th class="sorting sorting_asc" tabindex="0"
									aria-controls="example2" rowspan="1" colspan="1"
									aria-sort="ascending"
									aria-label="Rendering engine: activate to sort column descending">글번호</th>
								<th class="sorting sorting_asc" tabindex="0"
									aria-controls="example2" rowspan="1" colspan="1"
									aria-sort="ascending"
									aria-label="Rendering engine: activate to sort column descending">고객
									번호</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Browser: activate to sort column ascending">고객명</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Platform(s): activate to sort column ascending">우편번호</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Platform(s): activate to sort column ascending">주소</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Platform(s): activate to sort column ascending">상세주소</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending">연락처</th>
<!-- 								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending">고객
									상세 정보</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending">고객
									사진</th> -->
							</tr>
						</thead>
						<tbody>
						<c:forEach var="cusVo" items="${list}"  varStatus="status">
							<tr class="odd" style="cursor: pointer;" onclick="javascript:location.href='/cus/detail?cusNum=${cusVo.cusNum}'">
								<td class="dtr-control sorting_1" tabindex="0">${cusVo.rnum}</td>
								<td>${cusVo.cusNum}</td>
								<td>${cusVo.cusNm}</td>
								<td>${cusVo.zipcode}</td> 
								<td>${cusVo.addr1}</td> 
								<td>${cusVo.addr2}</td>
								<td>${cusVo.pne}</td>
							</tr>
						</c:forEach>	
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12 col-md-5">
					<div class="dataTables_info" id="example2_info" role="status"
						aria-live="polite">Showing ${entriesMap.startNum} to ${entriesMap.endNum} of ${entriesMap.totalNum} entries</div>
					<div class="col-sm-12 col-md-7">
						<div class="dataTables_paginate paging_simple_numbers"
							id="example2_paginate">
							<!-- 페이징 시작-->
							<ul class="pagination">
							<!-- Previous 시작 -->
							<c:if test="${paging.startPage > 5}">
								<li class="paginate_button page-item previous" id="example2_previous">
							</c:if>	
							<c:if test="${paging.startPage <= 5}">
								<li class="paginate_button page-item previous disabled" id="example2_previous">
							</c:if>	
									<a href="/cus/list?currentPage=${paging.startPage-5}&selSearch=${param.selSearch}&keyword=${param.keyword}" aria-controls="example2" data-dt-idx="0" tabindex="0" class="page-link">
									Previous</a>
								</li>
							<!-- Previous 끝 -->
							<!-- 페이지 번호 시작 -->
							<c:forEach var="pNo" begin="${paging.startPage}" end="${paging.endPage}" varStatus="stat">
								<li class="paginate_button page-item <c:if test='${paging.currentPage==pNo}'>active</c:if>">
									<a href="/cus/list?currentPage=${pNo}&selSearch=${param.selSearch}&keyword=${param.keyword}" aria-controls="example2" data-dt-idx="${pNo}" tabindex="0" class="page-link">${pNo}</a>
								</li>
							</c:forEach>
							<!-- 페이지 번호 끝 -->
							<!-- Next 시작 -->
							<c:if test="${paging.endPage < paging.totalPages}">
								<li class="paginate_button page-item next" id="example2_next">
							</c:if>	
							<c:if test="${paging.endPage >= paging.totalPages}">
								<li class="paginate_button page-item next disabled" id="example2_next">
							</c:if>	
									<a href="/cus/lsit?currentPage=${paging.startPage +5}&selSearch=${param.selSearch}&keyword=${param.keyword}" aria-controls="example2" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
								</li>
							<!-- Next 끝 -->
							</ul>
							<!-- 페이징 끝 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="width: 100%;">
			<div style="float: left; width: 70%;"></div>
			<div style="float: right; width: 100px">
				<button type="button" class="btn btn-block btn-primary"
					onclick="javascript:location.href='/cus/insert'">고객 등록</button>
			</div>
		</div>
		<!-- /.card-body -->
	</div>
</div>
