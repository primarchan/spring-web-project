<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%@ include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Read
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                       		<div class="form-group">
                           		<label>BNO</label>
                           		<input class="form-control" name="title" readonly="readonly" value='<c:out value="${board.bno}"/>'>
                           	</div>
                           	
                       		<div class="form-group">
                           		<label>Title</label>
                           		<input class="form-control" name="title" readonly="readonly" value='<c:out value="${board.title}"/>'>
                           	</div>
                           	
                       		<div class="form-group">
                           		<label>Content</label>
                           		<textarea rows="5" cols="50" name="content" class="form-control" readonly="readonly"><c:out value="${board.content}"/></textarea>
                           	</div>
                           	
                       		<div class="form-group">
                           		<label>Writer</label>
                           		<input class="form-control" name="writer" value='<c:out value="${board.writer}"/>'>
                           	</div>
                           	
                           	<form id='actionForm' action="/board/list" method='get'>
								<input type='hidden' name='bno' value='<c:out value="${board.bno}"/>'>
								<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
								<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
								<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
								<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
							</form>
                           	
                           	<button type="button" class="btn btn-default listBtn"><a href='/board/list'>List</a></button>
                            <button type="button" class="btn btn-default modBtn"><a href='/board/modify?bno=<c:out value="${board.bno}"/>'>Modify</a></button>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

			<!-- Reply -->
			<div class="row">
			
				<div class="col-lg-12">
			
					<!-- /.panel -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-coments fa-fw"></i> Reply
						</div>
			
						<!-- /.panel-heading -->
						<div class="panel-body">
			
							<ul class="chat">
								<!-- start reply -->
								<li class="left clearfix" data-rno='12'>
									<div>
										<div class="header">
											<strong class="primary-font">user00</strong> <small
												class="pull-right text-muted">2018-01-01 12:12 </small>
										</div>
										<p>Good job!</p>
									</div>
								</li>
								<!-- end reply -->
							</ul>
							<!-- ./ end ul -->
						</div>
						<!-- ./panel .chat-panel -->
					</div>
				</div>
				<!-- ./ end row -->
			</div>

<script type="text/javascript" src="/resources/js/reply.js"></script>


<script type="text/javascript">

	/* 
	
	 $(document).ready(function() {

	 console.log(replyService);
	
	 });
	 */
/*	 
	console.log("======================");
	console.log("JS TEST");

	var bnoValue = '<c:out value="${board.bno}"/>';

	// for replyService add test

	replyService.add({
		reply : "JS TEST",
		replyer : "tester",
		bno : bnoValue
	}, function(result) {
		alert("RESULT: " + result);
	});

	// reply List Test
	replyService.getList({
		bno : bnoValue,
		page : 1
	}, function(list) {

		for (var i = 0, len = list.length || 0; i < len; i++) {
			console.log(list[i]);
		}
	});

	// 14번째 댓글 삭제 테스트
	replyService.remove(14, function(count) {

		console.log(count);

		if (count === "success") {
			alert("REMOVED");
		}
	}, function(err) {
		alert('ERROR...');
	});

	// 15번째 댓글 수정
	replyService.update({
		rno : 15,
		bno : bnoValue,
		reply : "Modified Reply..."
	}, function(result) {
		alert("수정 완료");
	});

	replyService.get(20, function(data) {
		console.log(data);
	});
*/	
</script>

<script>
$(document).ready(function () {
	
	var bnoValue = '<c:out value="${board.bno}"/>';
	var replyUL = $(".chat");
	
		showList(1);
		
		function showList(page){
		      
		      replyService.getList({bno:bnoValue,page: page|| 1 }, function(list) {
		        
		        var str="";
		       if(list == null || list.length == 0){
		        
		        replyUL.html("");
		        
		        return;
		      }
		        for (var i = 0, len = list.length || 0; i < len; i++) {
		          str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
		          str +="  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>"; 
		          str +="    <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
		          str +="    <p>"+list[i].reply+"</p></div></li>";
		        }
		 
		    replyUL.html(str);
		 
		      });//end function
		      
		   }//end showList

});
</script>

<script type="text/javascript">

	var actionForm = $("#actionForm");	

	$(".listBtn").click(function(e){
		e.preventDefault();
		actionForm.find("input[name='bno']").remove();
		actionForm.submit();
	});
	
	$(".modBtn").click(function(e){
		e.preventDefault();
		actionForm.attr("action", "/board/modify");
		actionForm.submit();
	});
	
</script>
            
<%@ include file="../includes/footer.jsp" %>
