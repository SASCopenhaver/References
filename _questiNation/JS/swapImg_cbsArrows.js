{
	img1AR_over = new Image(); img1AR_over.src="Img/cb_1ArrowRight_A.jpg";   
	img1AR_out  = new Image(); img1AR_out.src="Img/cb_1ArrowRight_I.jpg";
	img1AR_down = new Image(); img1AR_down.src="Img/cb_1ArrowRight_A.jpg";
}
function imgOver1AR(imgName) {
	status = "Move one record to the right";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}
function imgOut1AR(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}
function imgDown1AR(imgName) {
	status = "Move one record to the right";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
////////////////////////////////////////////////////////////////////////////////
{
	img2AR_over = new Image(); img2AR_over.src="Img/cb_2ArrowsRight_A.jpg";   
	img2AR_out  = new Image(); img2AR_out.src="Img/cb_2ArrowsRight_I.jpg";
	img2AR_down = new Image(); img2AR_down.src="Img/cb_2ArrowsRight_A.jpg";
}
function imgOver2AR(imgName) {
	status = "Move all records to the right";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}
function imgOut2AR(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}
function imgDown2AR(imgName) {
	status = "Move all records to the right";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
//////////////////////////////////////////////////
{
	img1AL_over = new Image(); img1AL_over.src="Img/cb_1ArrowLeft_A.jpg";   
	img1AL_out  = new Image(); img1AL_out.src="Img/cb_1ArrowLeft_I.jpg";
	img1AL_down = new Image(); img1AL_down.src="Img/cb_1ArrowLeft_A.jpg";
}
function imgOver1AL(imgName) {
	status = "Move one record to the left";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}
function imgOut1AL(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}
function imgDown1AL(imgName) {
	status = "Move one record to the left";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
////////////////////////////////////////////////////////////////////////////////
{
	img2AL_over = new Image(); img2AL_over.src="Img/cb_2ArrowsLeft_A.jpg";   
	img2AL_out  = new Image(); img2AL_out.src="Img/cb_2ArrowsLeft_I.jpg";
	img2AL_down = new Image(); img2AL_down.src="Img/cb_2ArrowsLeft_A.jpg";
}
function imgOver2AL(imgName) {
	status = "Move all records to the left";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}
function imgOut2AL(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}
function imgDown2AL(imgName) {
	status = "Move all records to the left";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
//////////////////////////////////////////////////
