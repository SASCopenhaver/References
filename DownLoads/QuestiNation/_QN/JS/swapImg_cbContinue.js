//var imgA = "Img/cb_Continue_A.jpg";
//var imgI = "Img/cb_Continue_I.jpg";

{
	imgc_over = new Image(); imgc_over.src="Img/cb_Continue_A.jpg";   
	imgc_out  = new Image(); imgc_out.src="Img/cb_Continue_I.jpg";
	imgc_down = new Image(); imgc_down.src="Img/cb_Continue_A.jpg";
}


function imgOverC(imgName) {
	status = "Continue";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}


function imgOutC(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}

function imgDownC(imgName) {
	status = "Continue";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
