{
  imgem_over = new Image(); imgem_over.src="Img/cb_EMail_A.jpg";   
  imgem_out  = new Image(); imgem_out.src="Img/cb_EMail_I.jpg";
  imgem_down = new Image(); imgem_down.src="Img/cb_EMail_A.jpg";
}

function imgOverEM(imgName) {
	status = "Send E-Mail";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}


function imgOutEM(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}

function imgDownEM(imgName) {
	status = "Send E-Mail";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
