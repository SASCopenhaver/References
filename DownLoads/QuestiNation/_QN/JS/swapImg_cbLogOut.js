{
	imgl_over = new Image(); imgl_over.src="Img/cb_LogOut_A.jpg";   
	imgl_out  = new Image(); imgl_out.src="Img/cb_LogOut_I.jpg";
	imgl_down = new Image(); imgl_down.src="Img/cb_LogOut_A.jpg";
}


function imgOverL(imgName) {
	status = "LogOut";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}


function imgOutL(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}

function imgDownL(imgName) {
	status = "LogOut";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
