{
	imgpm_over = new Image(); imgpm_over.src="Img/cb_PrjsMngr_A.jpg";   
	imgpm_out  = new Image(); imgpm_out.src="Img/cb_PrjsMngr_I.jpg";
	imgpm_down = new Image(); imgpm_down.src="Img/cb_PrjsMngr_A.jpg";
}


function imgOverPM(imgName) {
	status = "Manager";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}


function imgOutPM(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}

function imgDownPM(imgName) {
	status = "Manager";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
