{
  imgs_over = new Image(); imgs_over.src="Img/cb_Save_A.jpg";   
  imgs_out  = new Image(); imgs_out.src="Img/cb_Save_I.jpg";
  imgs_down = new Image(); imgs_down.src="Img/cb_Save_A.jpg";
}

function imgOverS(imgName) {
	status = "Save";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}


function imgOutS(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}

function imgDownS(imgName) {
	status = "Save";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
