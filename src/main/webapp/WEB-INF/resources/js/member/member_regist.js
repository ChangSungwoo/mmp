/**
 * Front 회원 가입 화면용 JavaScript File
 */


$(document).ready(function() {
	console.log
	App.init();
	setEvent();
	
	Validation.initValidation();
});

function setEvent(){
	
	$("#btnRegist").click(function(){
		if($("#userRegistForm").valid()) {
			console.log("valid Form");
			addMember();
			return false;
		} else {
			console.log("unvalid Form");
			validFormCheck();
			return false;
		}
	});
}

function addMember() {
	
	$.ajax({
		url : "/member/memberSave",
		type : 'POST',
		data : $("#userRegistForm").serialize(true),
		dataType : "json",
		success : function(data){
			if(data.error != undefined){
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				alert("정상적으로 회원가입이 완료되어 로그인 창으로 이동합니다.");
				location.href="/member/login";				
			}
		},
		error : function(e){
			if(e.status==200){
				alert("error code 정상 저장 되었습니다.");
				location.href="/member/login";
			}else{
				console.log(e);
				alert("오류가 발생했습니다. 다시 시도해 주시기 바랍니다.");
			}
		}
	});
}

var Validation = function () {

    return {
        //Validation
        initValidation: function () {
	        $("#userRegistForm").validate({                   
	            // Rules for form validation
	            rules:
	            {
	            	loginId:
	                {
	                    required: true,
	                    email: true
	                },
	                loginPwd:
	                {
	                    required: true,
	                    minlength : 8, 
	                    maxlength: 20
	                   
	                },
	                pwdConfirm:
	                {
	                    required: true,
	                    equalTo:"#loginPwd"
	                },
	                userNickNm:
	                {
	                    required: true,
	                    minlength : 4, 
	                    maxlength: 10
	                },
	                agreeRule:
	                {
	                	required: true
	                }
	            },
	                                
	            // Messages for form validation
	            messages:
	            {
	            	loginId:
	                {
	                    required: '로그인 아이디로 사용할 이메일 주소를 입력해주세요.'
	                },
	                loginPwd:
	                {
	                    required: '로그인 비밀번호를 입력해주세요.',
	                    minlength : '비밀번호는 최소 8자리 이상 20자리 미만으로 지정해주세요.',
	                    maxlength : '비밀번호는 최소 8자리 이상 20자리 미만으로 지정해주세요.'
	                },
	                pwdConfirm:
	                {
	                    required: '확인용 로그인 비밀번호를 입력해주세요.',
	                    equalTo : '입력하신 비밀번호가 서로 다릅니다.'
	                },
	                userNickNm:
	                {
	                    required: '서비스 이용시 사용될 회원님의 닉네임을 입력해주세요.',
	                    minlength : '닉네임은 최소 4자 이상 10자 미만으로 지정해주세요.',
	                    maxlength : '비밀번호는 최소 4자 이상 10자 미만으로 지정해주세요.'
	                },
	                agreeRule:
                	{
	                	required: '약관 동의는 필수 사항입니다.'
                	}
	            },                  
	            onsubmit:false,
	            // Do not change code below
	            errorPlacement: function(error, element)
	            {
	                error.insertAfter(element.parent());
	            }
	        });
        }

    };
}();
