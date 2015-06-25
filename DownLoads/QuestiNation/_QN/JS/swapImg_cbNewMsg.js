{
  imgnmsg_over = new Image(); imgnmsg_over.src="Img/cb_NewMsg_A.jpg";   
  imgnmsg_out  = new Image(); imgnmsg_out.src="Img/cb_NewMsg_I.jpg";
  imgnmsg_down = new Image(); imgnmsg_down.src="Img/cb_NewMsg_A.jpg";
}

function imgOverNMsg(imgName) {
	status = "New Message";
	self.document[imgName].src=eval(imgName+"_over.src");
	return true;
}


function imgOutNMsg(imgName) {
	status = "";
	self.document[imgName].src=eval(imgName+"_out.src");
	return true;
}

function imgDownNMsg(imgName) {
	status = "New Message";
	self.document[imgName].src=eval(imgName+"_down.src");
	return true;
}
