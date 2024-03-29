<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>
      <div class="row">
          <div class="col-lg-12">
              <h1 class="page-header">Board Read</h1>
          </div>
          <!-- /.col-lg-12 -->
      </div>
      <!-- /.row -->
	 <div class="bigPictureWrapper">
		<div class="bigPicture">
		</div>
	</div>
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
               <input class="form-control" name="bno" readonly="readonly" value='<c:out value="${board.bno}"/>'>
          </div>
         	<div class="form-group">
               <label>Title</label>
               <input class="form-control" name="title" readonly="readonly" value='<c:out value="${board.title}"/>'>
           </div>
           <div class="form-group">
               <label>content</label>
               <textarea class="form-control" name="content" rows="5"><c:out value="${board.content}"/></textarea>
           </div>
         	<div class="form-group">
               <label>Writer</label>
               <input class="form-control" name="writer" value='<c:out value="${board.writer}"/>'>
                </div>
                <!-- 파일 업로드 부분 -->
			   <style>
			   .uploadResult{
			   	width:100%;
			   	background: gray;
			   }
			   .uploadResult ul{
			   	display: flex;
			   	flex-flow: row;
			   	justify-content: center;
			   	align-items: center;
			   }
			   .uploadResult ul li{
			   	list-style: none;
			   	padding: 10px;
			   }
			   .uploadResult ul li img{
			   	width: 300px;
			   }
			   .uploadResult ul li img span{
			   	color:white;
			   }
			   .bigPictureWrapper{
			   	position: absolute;
			   	display: none;
			   	justify-content: center;
			   	align-items: center;
			   	top: 0%;
			   	width: 100%;
			   	height: 100%;
			   	background-color: gray;
			   	z-index: 100;
			   	background: rgba(255,255,255,0.5);
			   }
			   .bigPicture{
			   	position: relative;
			   	display: flex;
			   	justify-content: center;
			   	align-items: center;
			   	width: 0%;
			   	height: 0%;
			   }
			   .bigPicture img{
			   	width: 300px;
			   }
			   </style>
                <div class="row">
                	  <div class="col-lg-12">
                	  	<div class="panel panel-default">
	                	    <div class="panel-heading">Files</div>
	                	    <div class="panel-body">
	                	    	<div class="uploadResult">
	                	    		<ul>
	                	    		</ul>
	                	    	</div>
 		               	  	</div>
                	    </div>
                	  </div>
                </div>
                
                <form id="actionFrom" action="/board/list" method="get">
					<input type='hidden' name='pageNum' value='${cri.pageNum }'>
					<input type='hidden' name='amount' value='${cri.amount }'>
					<input type='hidden' name='bno' value='${board.bno }'>
					<input type='hidden' name='type' value='${cri.type }'>
					<input type='hidden' name='keyword' value='${cri.keyword }'>
				 </form>

                 <div class="dox-footer">
					<button type="button" class="btn btn-default listBtn"><a href='/board/list'>List</a></button>
					<button type="button" class="btn btn-default modBtn"><a href='/board/modify?bno=<c:out value="${board.bno}"/>'>Modify</a></button>
				 </div>
	 
	 
	 <!-- 댓글 영역 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i>Reply
				<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply</button>
			</div>

				<div class="panel-body">
					<ul class="chat">
						
					</ul>	
				</div>
				<div class="panel-footer"> 
					
				</div>
			</div>
		</div> 	
	</div>	
	
	<!-- Modal -->
                      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                              <div class="modal-content">
                                  <div class="modal-header">
                                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                      <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
                                  </div>
                                  <div class="modal-body">
                                      <div class="form-group">
                                      	<label>Reply</label>
                                      	<input class="form-control" name="reply" value='New Reply'>
                                      </div>
                                      <div class="form-group">
                                      	<label>Replyer</label>
                                      	<input class="form-control" name='replyer' value='replyer'>
                                      </div>
                                      <div class="form-group">
                                      	<label>Reply data</label>
                                      	<input class="form-control" name='replydata' value=''>
                                      </div>
                                  </div>
                                  <div class="modal-footer">
                                      <button id="modalModBtn" type="button" class="btn btn-warning" data-dismiss="modal">modify</button>
                                      <button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
                                      <button id="modalRegisterBtn" type="button" class="btn btn-primary" data-dismiss="modal">Register</button>
                                      <button id="modalCloseBtn" type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                                  </div>
                              </div>
                              <!-- /.modal-content -->
                          </div>
                          <!-- /.modal-dialog -->
                      </div>
                      <!-- /.modal -->
                      
                      
                      <script src="https://code.jquery.com/jquery-3.7.1.min.js"
					  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
					  crossorigin="anonymous"></script>
                      <script type="text/javascript" src="/resources/js/reply.js?v=<%=System.currentTimeMillis() %>"></script>          
                      <script type="text/javascript">
                      	
                      console.log("==========");
                      console.log("JS 테스트");
                      
                    
                      
                      
                      
                      $(document).ready(function(){
		
                      	
                      	var bnoValue = '<c:out value="${board.bno}"/>';
                       var replyUL = $(".chat");
                       
                       showList(1);
                       
                       function showList(page){
                       	console.log("show list : " + page);
                       	
                           replyService.getList({bno:bnoValue,page: page||1}, function(replyCnt, list){

                           	console.log("replyCnt : " + replyCnt);
                           	console.log("list : " + list);
                           	console.log(list);
                           	
                           	
                           	if(page == -1){
                           		pageNum = Math.ceil(replyCnt / 10.0);
                           		showList(pageNum);
                           		return;
                           	}
                           	
                               var str="";
                               
                               if(list == null || list.length == 0){
                                   return
                               }
                               
                               for(var i = 0, len = list.length || 0; i < len; i++){
                               	str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
                                   str += "<div><div class='header'><strong class='primary-font'>["+list[i].rno+"]"+list[i].replyer+"</strong>";
                                   str += "<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
                                   str += "	<p>"+list[i].reply+"</p></div></li>";
                               }
                               replyUL.html(str);
                               
                               showReplyPage(replyCnt);
                               
                           }); //end function
                       }//end showList
                       
                       var modal = $(".modal");
                       var modalInputReply = modal.find("input[name='reply']");
                       var modalInputReplyer = modal.find("input[name='replyer']");
                       var modalInputReplydata = modal.find("input[name='replydata']");
                       
                       var modalModBtn = $('#modalModBtn');
                       var modalRemoveBtn = $("#modalRemoveBtn");
                       var modalRegisterBtn = $("#modalRegisterBtn");
                       
                       $("#addReplyBtn").on("click", function(e){
                       	modal.find('input').val("");
                       	modalInputReplydata.closest("div").hide();
                       	modal.find("button[id !='modalCloseBtn']").hide();
                       	
                       	modalRegisterBtn.show();
                       	
                       	$(".modal").modal("show");
                       	
                       modalRegisterBtn.on("click", function(e){
                       	var reply = {
                       			reply: modalInputReply.val(),
                       			replyer: modalInputReplyer.val(),
                       			bno:bnoValue
                       	};
                       	replyService.add(reply, function(result){
                       	alert(result);
                       	modal.find("input").val("");
                       	modal.modal("hide");
                       	
                       	showList(-1);
                       	});
                       });
                       
                       });
                       
                       $(".chat").on("click", "li", function(e){
                       	var rno = $(this).data("rno");
                       	
                       	console.log(rno);
                       	replyService.get(rno, function(reply){
                       		modalInputReply.val(reply.reply);
                       		modalInputReplyer.val(reply.replyer);
                       		modalInputReplydata.val(replyService.displayTime(reply.replyDate))
                       		.attr("readonly","readonly");
                       		modal.data("rno",reply.rno);
                       		
                       		modal.find("button[id !='modalCloseBtn']").hide();
                       		modalModBtn.show();
                       		modalRemoveBtn.show();
                       		
                       		$(".modal").modal("show");
                       	});
                       });
                       
                       modalModBtn.on("click", function(e){
                       	var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
                       	
                       	replyService.updata(reply, function(result){
                       		alert(result);
                       		modal.modal("hide");
                       		showList(pageNum);
                       	});
                       });
                       
                       modalRemoveBtn.on("click", function(e){
                       	
                       	var rno = modal.data("rno");
                       	replyService.remove(rno, function(result){
                       		alert(result);
                       		modal.modal("hide");
                       		showList(pageNum);
                       	});
                       });
                       
                       
                       var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
		replyPageFooter.on("click","li a", function(e){
			e.preventDefault();
			console.log("page click");
			var targetPagenum = $(this).attr("href");
			
			console.log("targetPageNum : " + targetPagenum);
			
			pageNum = targetPagenum;
			showList(pageNum);
		});
		
		function showReplyPage(replyCnt){
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 9;
			var next = false;
			
			if(endNum * 10 >= replyCnt){
				endNum = Math.ceil(replyCnt/10.0);
			}
			
			if(endNum * 10 < replyCnt){
				next = true;
			}
			
			var str = "<ul class = 'pagination pull-right'>";
			
			if(prev){
				str += "<li class = 'page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
			}
			
			for(var i = startNum; i <= endNum; i++){
				var active = pageNum == i? "active":"";
				
				str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			
			if(next){
				str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
			}
			
			str += "</ul></div>";
			
			console.log(str);
			
			replyPageFooter.html(str);
			} 
                      });
                      
                      </script>
           <script>
           $(document).ready(function(){
        	    (function(){     			
        	        var bno = '<c:out value="${board.bno}"/>';	
        	        $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
        	            console.log(arr);
        	            
        	            var str = "";
        	            
        	            $(arr).each(function(i, attach){
        	                // img type
        	                if(attach.fileType){
        	                    var fileCallPath = encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
        	                    
        	                    str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
        	                    str += "<img src='/display?fileName="+fileCallPath+"'>";
        	                    str += "</div></li>";  // 수정된 부분
        	                } else {
        	                    str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
        	                    str += "<span> "+ attach.fileName+"</span><br/>";
        	                    str += "<img src='/resources/img/attach.png'>";
        	                    str += "</div></li>";  // 수정된 부분
        	                }
        	            });
        	            $(".uploadResult ul").html(str);
        	        }); //end getjson   		
        	    })(); //end function
        	    
        	    $(".uploadResult").on("click", "li", function(e){
        	        var liObj = $(this);
        	        var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
        	        
        	        if(liObj.data("type")){
        	            showImage(path.replace(new RegExp(/\\/g),"/"));
        	        } else {
        	            // 다운로드
        	            self.location = "/download?fileName=" + path;
        	        }
        	    });

        	    function showImage(fileCallPath){
        	        alert(fileCallPath);
        	        $(".bigPictureWrapper").css("display", "flex").show();
        	        $(".bigPicture")
        	        .html("<img src='/display?fileName="+ fileCallPath + "'>")
        	        .animate({width:'100%', height: '100%'}, 500);
        	        
        	    }
        	    
        	    $(".bigPictureWrapper").on("click", function(e){
        	    	$(".bigPicture").animate({width:'0%', height: '0%'}, 500);
        	    	setTimeout(() => {
        	            $(this).hide();
        	            }, 500);
        	    });
        	});
                      
          </script>       
                      
                  </div>
                  
              </div>
              
          </div>
          
      </div>
      
      
          
<%@include file="../includes/footer.jsp" %>
