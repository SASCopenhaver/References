{
	imgr_over = new Image(); imgr_over.src="Img/cb_Reset_A.jpg";   
	imgr_out  = new Image(); imgr_out.src="Img/cb_Reset_I.jpg";
	imgr_down = new Image(); imgr_down.src="Img/cb_Reset_A.jpg";
}


function imgOverR(imgName) {
	status = "Reset";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}


function imgOutR(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}

function imgDownR(imgName) {
	status = "Reset";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
