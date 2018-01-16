$(function () {
	

var $categoryForm=$('#categoryForm');

if($categoryForm.length){
	
	$categoryForm.validate({
		
	rules:{
		
		name:{
			
			required:true,
			minlength:3
			
			
			}
		
		
		
	},
	
	message:{
		
		name:{
			
			required:"Please enter category",
			minlength:"minimum legth must be 3"
		}
		
	},
	
	errorElement:'em',
	errorPlacement:function(error,element){
		
		error.addClass('help-block');
		error.insertAfter(element);
		
	}
	
	
	});
	}
		
		
});	
	
