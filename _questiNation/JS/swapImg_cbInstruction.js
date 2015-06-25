//var imgA = "Img/cb_Continue_A.jpg";
//var imgI = "Img/cb_Continue_I.jpg";

{
	imgi_over = new Image(); imgi_over.src="Img/cb_Instruction_A.jpg";   
	imgi_out  = new Image(); imgi_out.src="Img/cb_Instruction_I.jpg";
	imgi_down = new Image(); imgi_down.src="Img/cb_Instruction_A.jpg";
}


function imgOverI(imgName) {
	status = "Instruction";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}


function imgOutI(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}

function imgDownI(imgName) {
	status = "Instruction";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
