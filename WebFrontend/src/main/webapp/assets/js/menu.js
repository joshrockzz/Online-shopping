$(function(){
	
	switch (menu) {
	case 'Aboutus':
		$('#aboutus').addClass('active');
		break;
		
	case 'Contactus':
		$('#contactus').addClass('active');
		break;
		
	case 'All Products':
		$('#listproducts').addClass('active');
		break;

	default:
		$('#home').addClass('active');
		$('#a_'+menu).addClass('active');
		break;
	}
});