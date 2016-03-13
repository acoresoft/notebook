$(function(){
	$("#loginform").validate({
		submitHandler: function(form) {
			console.log(34);
		    // some other code
		    // maybe disabling submit button
		    // then:
		    $(form).ajaxSubmit({
		    	success:function(r_data){
		    		if(r_data.success){
		    			window.location.href=$$ctx+"/index";
		    		}
		    	}
		    });
			return false;
		 }
	});
});