/**
 * 
 */
/**Message**/
$(function() {
			$('#aNoteSave').click(function(e){
				e.preventDefault();
				var mId = $('#mId').val();
				var msTitle = $('#msTitle').val();
				var msContent = $('#msContent').val();

				if(mId ==""){
					alert('아이디를 입력하세요');
					return;
				}
				
				if (msTitle == "") {
					alert('제목을 입력하세요');
					return;
				}
				if (msContent == "") {
					alert('내용을 입력하세요');
					return;
				}
				
				$.ajax({
					url : 'message_create',
					data : $('#fmNoteWrite').serializeArray(),
					dataType : 'text',
					success : function(result){
						if(result == 'true'){
							alert('보내기 완료');
							location.href = 'message_list';
						}else if(result == 'N'){
							alert('정확한 아이디를 입력해주세요');
							return;
						}
					},
					error : function(){
						location.href = 'message';
					}
				})
			});
			
			
			$('#aNoteCancel').click(function(e) {
				window.close();
				e.preventDefault();
			});
			
			$('#aNoteDelete').click(function(e){
				var msNo = $('#aNoteDelete').attr('value');
				var noArray = [];
				noArray.push(msNo);
				var params = {
						"msNo" : noArray
				};
				e.preventDefault();
				$.ajax({
					url : 'message_delete',
					data : params,
					dataType : 'text',
					success : function(result){
						if(result == 'true'){
							location.href = 'message_list';
						}
					}
				});
				
			});
			
			/*Message delete*/
			$('#cmdDelete').click(function(e){
				var noArray = [];
				
				$('input[name="message_check"]:checked').each(function(i){
					noArray.push($(this).val());
				});
				
				var params = {
						"msNo" : noArray
				}
				
				$.ajax({
					url : "message_delete",
					data : params,
					dataType : 'text',
					success : function(result){
						if(result == 'true'){
							alert('삭제완료');
							location.reload();
						}else{
							location.href = '404';
						}
					}
				})
				
			});

});