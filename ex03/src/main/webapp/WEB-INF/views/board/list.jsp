<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp"  %>

           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Board List Page
                    		<button id="regBtn" type="button" class="btn btn-xs pull-right">Register New Board</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>BNO</th>
                                        <th>Title</th>
                                        <th>Writer</th>
                                        <th>Regdate</th>
                                        <th>UpdateDate</th>
                                    </tr>
                                </thead>
                                
                                <c:forEach items="${list}" var="board">
									<tr>
										<td><c:out value="${board.bno}"/></td>
										<td><a class='move' href='<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td>
								   		<td><c:out value="${board.writer}"/></td>
								   		<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${board.regdate}" /></td>
								   		<td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${board.updateDate}" /></td>  
								   	</tr>
                                </c:forEach>
                            </table>
                            
                            <div class='row'>
                            	<div class="col-lg-12">
                            	
                                <form id='searchForm' action="/board/list" method="get">
                            		<select name="type">
                            			<option value="" <c:out value="${pageMaker.cri.type == null? 'selected' : ''}"/>>---</option>
                            			<option value="T" <c:out value="${pageMaker.cri.type eq 'T'? 'selected' : ''}"/>>제목</option>
                            			<option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected' : ''}"/>>내용</option>
                            			<option value="W" <c:out value="${pageMaker.cri.type eq 'W'? 'selected' : ''}"/>>작성자</option>
                            			<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'? 'selected' : ''}"/>>제목+내용</option>
                            			<option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'? 'selected' : ''}"/>>제목+내용+작성자</option>
                            		</select>
                            	<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'/>
                           		<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
                           		<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'/>
                            	<button class="btn btn-default">Search</button>
                            </form>
                            	
                            	</div>
                            </div>
                            
                            <!-- pagination -->
			         		<div class="pull-right">
                           		<ul class="pagination">
                           		
                           			<c:if test="${pageMaker.prev}">
                           	    	<li class="page-item">
      									<a class="page-link" href="${pageMaker.startPage - 1}" tabindex="-1">Previous</a>
    								</li>
    								</c:if>
    								
                            		<c:forEach begin="${pageMaker.startPage}"  end="${pageMaker.endPage }" var="num">
                           				<li class="page-item ${pageMaker.cri.pageNum == num?"active":""}">
                           					<a class="page-link" href="${num}">${num}</a>
                         				</li>
                        			</c:forEach>
                        			
                        			<c:if test="${pageMaker.next}">
                                    <li class="page-item">
      									<a class="page-link" href="${pageMaker.endPage + 1}" tabindex="-1">Next</a>
    								</li>
    								</c:if>
    								
                           		</ul>
                            </div>
							<!--  end Pagination -->
							
							<form id='actionForm' action="/board/list" method='get'>
								<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'>
								<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'>
								<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
								<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
							</form>
							
							
							</div>
                           
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <!-- Modal -->
			<div id="myModal" class="modal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p>Modal body text goes here.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
           
<script type="text/javascript">
 
$(document).ready(function() {

	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	history.replaceState({}, null, null);
    
    function checkModal(result) {
 
      if (result === '' || history.state) {
        return;
      }
 
      if (result === 'success') {
        $(".modal-body").html(
            "정상적으로 처리되었습니다.");
      }else if (parseInt(result) > 0) {
        $(".modal-body").html(
            "게시글 " + parseInt(result) + " 번이 등록되었습니다.");
      }
       $("#myModal").modal("show");
    }
    
    $("#regBtn").click(function() {
    	self.location = "/board/register";
    });
    
    var actionForm = $("#actionForm");
    
    $(".page-link").on("click", function(e) {
    	
    	e.preventDefault();
		
    	var targetPage = $(this).attr("href");
    	
    	console.log(targetPage);
    	
    	actionForm.find("input[name='pageNum']").val(targetPage);
    	
    	actionForm.submit();
    });
    
    $(".move").on("click", function(e){
    	
    	e.preventDefault();
    	
    	actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
    	
    	actionForm.attr("action", "/board/get");
    	
    	actionForm.submit();
    });
    
    // 검색 버튼의 이벤트 처리
    var searchForm = $("#searchForm");
    
    $("#searchForm button").on("click", function(e){
    	
    	// 화면에 키워드가 없다면 검색을 하지 않도록 제어
    	if(!searchForm.find("option:selected").val()){
    		alert("키워드를 입력하세요");
    		return false;
    	}
    	
    	// 브라우저에서 검색 버튼을 클릭하면 <form> 태그의 전송은 막고, 페이지 번호는 1이 되도록 처리
    	searchForm.find("input[name='pageNum']").val("1");
    	e.preventDefault();
    	
    	searchForm.submit();
    });
    
});

</script>
            
<%@include file="../includes/footer.jsp"  %>