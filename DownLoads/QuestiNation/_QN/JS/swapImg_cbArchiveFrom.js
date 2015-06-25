{
	imgaf_over = new Image(); imgaf_over.src="Img/cb_ArchiveFrom_A.jpg";   
	imgaf_out  = new Image(); imgaf_out.src="Img/cb_ArchiveFrom_I.jpg";
	imgaf_down = new Image(); imgaf_down.src="Img/cb_ArchiveFrom_A.jpg";
}


function imgOverAF(imgName) {
	status = "From Archive";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}


function imgOutAF(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}

function imgDownAF(imgName) {
	status = "From Archive";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
