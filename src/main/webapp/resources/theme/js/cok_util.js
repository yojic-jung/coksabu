/**
 *  이미지 변환 함수
 */

	/*
	 *  사용 url   : /profile, /lessonWrite, /update
	 *  사용 화면파일 : profile.jsp, 
	 */
    function util_imgUpldCheck(obj){
    	var domIdTag = obj.id;			// input file id값
    	var file = obj.files;
    	// file[0].size 는 파일 용량 정보입니다.
    	if(file[0].size > 1024*1024*20){
    		// 용량 초과시 경고후 해당 파일의 용량도 보여줌
    		  alert("첨부파일 사이즈는 20MB 이내로 등록 가능합니다. ");
    		  document.getElementById(domIdTag).value = ""; 
    		  var isClickEv = document.getElementById(domIdTag).dataset.clickEvent+'';
         	  if(isClickEv == 'ok'){
         		  var outputTagId = document.getElementById(domIdTag).dataset.output+'';
         		  document.getElementById(outputTagId).click();
         	  }
    		  return false;
    	}
    	
    	var pathpoint = obj.value.lastIndexOf('.');
    	var filepoint = obj.value.substring(pathpoint+1,obj.length);
    	var filetype = filepoint.toLowerCase();
         // 확장자가 이미지 파일이면 체크를 위해 임시로 로딩합니다.
         if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp' || filetype=='heic'){
         }else{
        	 alert('이미지  파일만 등록해주십시오.(img/gif/png/jpeg/bmp/heic)');
        	 document.getElementById(domIdTag).value = ""; 
        	 var isClickEv = document.getElementById(domIdTag).dataset.clickEvent+'';
        	 if(isClickEv == 'ok'){
        		 var outputTagId = document.getElementById(domIdTag).dataset.output+'';
        		 document.getElementById(outputTagId).click();
        	 }
        	 return false;
         }
    }
    
    /*
	 *  사용 url   : /profile, /lessonWrite, /update
	 *  사용 화면파일 : profile.jsp, 
	 */
    function util_imgUpldLoadFile(event) {
    	var domIdTag = event.target.id;			// input file id값
    	const mainDom = document.getElementById(domIdTag);			//이벤트 발생 dom
    	var outputTagId = mainDom.dataset.output+'';
    	const outputDom = document.getElementById(outputTagId);			//보여질 이미지 dom
 	    var fileName = mainDom.files[0].name;
        var fileNameExt = fileName.substr(fileName.lastIndexOf('.') + 1);
        var originFileName = fileName.substr(0, fileName.lastIndexOf('.'));
        if(fileNameExt == "heic") {
     	   document.getElementById('img-convert').classList.remove('hide');
           var blob = document.getElementById(domIdTag).files[0]; 
           heic2any({
                blob: blob,
                toType: "image/jpg",
            	}).then(function (resultBlob) {
                    var url = URL.createObjectURL(resultBlob);
                    let fileInputElement = mainDom;
                    let container = new DataTransfer();
                    let file = new File([resultBlob], originFileName+".jpg",{type:"image/jpeg", lastModified:new Date().getTime()});
                    container.items.add(file);

                    fileInputElement.files = container.files;

                    const fileElement = fileInputElement.files;
                    const reader = new FileReader()
                    
	           	   	reader.onload = function(fileElement){
		           	    const previewImage = document.getElementById(outputTagId)
		                previewImage.src = fileElement.target.result;
	           	   	}
	           	   	   
	           	   	reader.readAsDataURL( mainDom.files[0] );
		           	if(outputDom.style.display == "none"){			//수업 만들기, 수정하기 페이지의 이미지 추가 버튼 클릭시 이미지 show
		     	    	document.getElementById(outputTagId).style.display = '';
		     	    }
	           	   	document.getElementById('img-convert').classList.add('hide');
                }).catch(function (x) {
                	document.getElementById('img-convert').classList.add('hide');
                });
	  }else{
			var reader = new FileReader();
		    reader.onload = function(){
			      var output = outputDom;
			      output.src = reader.result;
		    };
	    reader.readAsDataURL(event.target.files[0]);
	    if(outputDom.style.display == "none"){			//수업 만들기, 수정하기 페이지의 이미지 추가 버튼 클릭시 이미지 show
	    	document.getElementById(outputTagId).style.display = '';
	    }
	    
	  }
 }
    
    
    function util_imgDel(obj){
    	var domIdTag = obj.id;			// img태그 id값
    	const mainDom = document.getElementById(domIdTag);			//이벤트 발생 dom
    	var inputTagId = mainDom.dataset.inputTag+'';
    	const inputTagDom = document.getElementById(inputTagId);			//이미지 대상 input file 태그 id
    	
    	var delIdx = domIdTag.replace("output","");
    	var delBtn = document.getElementsByClassName("del"+delIdx)[0];
    	if(delBtn == undefined){					//수정하기 페이지에서 del버튼이 있는 경우에는 del버튼으로 이미지 삭제 처리함
    		inputTagDom.remove();
        	mainDom.remove();
        	const parentElement = document.getElementsByClassName("uploadDiv")[0];
        	var vacantElement = document.createElement('span');
        	vacantElement.innerHTML = '<input name="contentimg" type="file" class="'+inputTagId+'" id="'+inputTagId+'" accept="image/*" onchange="util_imgUpldCheck(this);util_imgUpldLoadFile(event);" data-output="'+domIdTag+'" data-click-event="ok" />';
        	document.getElementsByClassName("uploadDiv")[0].appendChild(vacantElement);
    	}
    }
    /*
			function() {
				//del1이 있으면 ajax처리해야 하므로 del1이 없을때만 이미지 지워짐
				$('.multi1').remove();
				$(this).remove();
				$('.uploadDiv')
						.append('<input name="contentimg" type="file" class="multi1" id="multi1" accept="image/*" onchange="util_imgUpldCheck(this);util_imgUpldLoadFile(event);" data-output="output1" data-click-event="ok" />');
			}
			function() {
				//del1이 있으면 ajax처리해야 하므로 del1이 없을때만 이미지 지워짐
				if ($('.del1').length == 0) {
					$('.multi1').remove();
					$(this).remove();
					$('.uploadDiv')
							.append(
									'<input name="contentimg" type="file" class="multi1" id="multi1" accept="image/*" onchange="util_imgUpldCheck(this);util_imgUpldLoadFile(event);" data-output="output1" data-click-event="ok" />');
				}
}
    */