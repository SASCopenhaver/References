{
	imgrt_over = new Image(); imgrt_over.src="Img/cb_Report_A.jpg";   
	imgrt_out  = new Image(); imgrt_out.src="Img/cb_Report_I.jpg";
	imgrt_down = new Image(); imgrt_down.src="Img/cb_Report_A.jpg";
}


function imgOverRT(imgName) {
	status = "Report";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}


function imgOutRT(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}

function imgDownRT(imgName) {
	status = "Report";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
