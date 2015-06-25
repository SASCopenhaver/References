{
	imgat_over = new Image(); imgat_over.src="Img/cb_ArchiveTo_A.jpg";   
	imgat_out  = new Image(); imgat_out.src="Img/cb_ArchiveTo_I.jpg";
	imgat_down = new Image(); imgat_down.src="Img/cb_ArchiveTo_A.jpg";
}


function imgOverAT(imgName) {
	status = "To Archive";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}


function imgOutAT(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}

function imgDownAT(imgName) {
	status = "To Archive";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
