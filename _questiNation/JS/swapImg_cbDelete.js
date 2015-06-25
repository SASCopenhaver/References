{
	imgd_over = new Image(); imgd_over.src="Img/cb_Delete_A.jpg";   
	imgd_out  = new Image(); imgd_out.src="Img/cb_Delete_I.jpg";
	imgd_down = new Image(); imgd_down.src="Img/cb_Delete_A.jpg";
}


function imgOverD(imgName) {
	status = "Delete Record";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}


function imgOutD(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}

function imgDownD(imgName) {
	status = "Delete Record";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
