{
  imgm_over = new Image(); imgm_over.src="Img/cb_Menu_A.jpg";   
  imgm_out  = new Image(); imgm_out.src="Img/cb_Menu_I.jpg";
  imgm_down = new Image(); imgm_down.src="Img/cb_Menu_A.jpg";
}

function imgOverM(imgName) {
	status = "Back To Admin Menu";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}


function imgOutM(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}

function imgDownM(imgName) {
	status = "Back To Admin Menu";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
