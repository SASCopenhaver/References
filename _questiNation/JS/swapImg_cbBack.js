{
	imgb_over = new Image(); imgb_over.src="Img/cb_Back_A.jpg";   
	imgb_out  = new Image(); imgb_out.src="Img/cb_Back_I.jpg";
	imgb_down = new Image(); imgb_down.src="Img/cb_Back_A.jpg";
}


function imgOverB(imgName) {
	status = "Back to Create Report page";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}


function imgOutB(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}

function imgDownB(imgName) {
	status = "Back to Create Report page";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
