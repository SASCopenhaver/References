//var imgA = "Img/cb_Continue_A.jpg";
//var imgI = "Img/cb_Continue_I.jpg";

{
	imgn_over = new Image(); imgn_over.src="Img/cb_Notes_A.jpg";   
	imgn_out  = new Image(); imgn_out.src="Img/cb_Notes_I.jpg";
	imgn_down = new Image(); imgn_down.src="Img/cb_Notes_A.jpg";
}


function imgOverN(imgName) {
	status = "Notes. Click on picture";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}


function imgOutN(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}

function imgDownN(imgName) {
	status = "Notes. Click on picture";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
