/**
 * Front Login 화면용 JavaScript File
 */


$(document).ready(function() {
	App.init();
	setEvent();
	
	Validation.initValidation();
});

function setEvent(){


	$("#btnLogin").click(function(){
		if($("#loginForm").valid()) {
			console.log("valid Form");
			loginStart();
			return false;
		} else {
			console.log("unvalid Form");
			//validFormCheck();
			return false;
		}
	});
}


function loginStart() {
	
	var rtnUrl = getUrlParameter("returnUrl");
	
	$.ajax({
		url : "/member/loginProc",
		type : 'POST',
		data : $("#loginForm").serialize(true),
		dataType : "json",
		success : function(data){
	
			if(data.error != undefined){
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				if(data.resultCode == 'A00') {
					//ReturnURL로 이동
					location.href=data.rtnUrl;						
				} else if(data.resultCode == 'A04') {
					alert("입력하신 로그인ID가 올바르지 않습니다.");
					return false;
				} else if(data.resultCode == 'A03') {
					alert("입력하신 비밀번호가 올바르지 않습니다.");
					return false;
				}else if(data.resultCode == 'A05') {
					alert("관리자 화면에 대한 접근 권한이 없습니다.");
					location.href="/";
					return false;
				}
			
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
	        $("#loginForm").validate({                   
	            // Rules for form validation
	            rules:
	            {
	            	loginId:
	                {
	                    required: true
	                },
	                loginPwd:
	                {
	                    required: true
	                }
	            },
	                                
	            // Messages for form validation
	            messages:
	            {
	            	loginId:
	                {
	                    required: '로그인 아이디를 입력해주세요.'
	                },
	                loginPwd:
	                {
	                    required: '로그인 비밀번호를 입력해주세요.'
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


function getUrlParameter(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) 
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) 
        {
            return sParameterName[1];
        }
    }
}


// This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
  console.log('statusChangeCallback');
  console.log(response);
  // The response object is returned with a status field that lets the
  // app know the current login status of the person.
  // Full docs on the response object can be found in the documentation
  // for FB.getLoginStatus().
  if (response.status === 'connected') {
    // Logged into your app and Facebook.
    testAPI();
  } else if (response.status === 'not_authorized') {
    // The person is logged into Facebook, but not your app.
    document.getElementById('status').innerHTML = 'Please log ' +
      'into this app.';
  } else {
    // The person is not logged into Facebook, so we're not sure if
    // they are logged into this app or not.
    document.getElementById('status').innerHTML = 'Please log ' +
      'into Facebook.';
  }
}

// This function is called when someone finishes with the Login
// Button.  See the onlogin handler attached to it in the sample
// code below.
function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}

window.fbAsyncInit = function() {
FB.init({
  appId      : '260835094253344',
  cookie     : true,  // enable cookies to allow the server to access 
                      // the session
  xfbml      : true,  // parse social plugins on this page
  version    : 'v2.5' // use graph api version 2.5
});

// Now that we've initialized the JavaScript SDK, we call 
// FB.getLoginStatus().  This function gets the state of the
// person visiting this page and can return one of three states to
// the callback you provide.  They can be:
//
// 1. Logged into your app ('connected')
// 2. Logged into Facebook, but not your app ('not_authorized')
// 3. Not logged into Facebook and can't tell if they are logged into
//    your app or not.
//
// These three cases are handled in the callback function.

FB.getLoginStatus(function(response) {
  statusChangeCallback(response);
});

};

// Load the SDK asynchronously
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// Here we run a very simple test of the Graph API after login is
// successful.  See statusChangeCallback() for when this call is made.
function testAPI() {
  console.log('Welcome!  Fetching your information.... ');
  FB.api('/me', function(response) {
    console.log('Successful login for: ' + response.name);
    document.getElementById('status').innerHTML =
      'Thanks for logging in, ' + response.name + '!';
  });
}