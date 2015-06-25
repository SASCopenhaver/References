function showMsg(argMsgNum)
{
	var vMsg = "";
	switch (argMsgNum)
	{
		case 1:
			vMsg = "Illegal operation.\n\n"+
			"---------------------------------------\n"+
			"NPA Officer MUST be selected\n"+
			"---------------------------------------";
		break;
		case 2:
			vMsg = "Illegal operation.\n\n"+
			"---------------------------------------\n"+
			"Strategic Goal MUST be selected\n"+
			"---------------------------------------";
		break;
		case 3:
			vMsg = "Illegal operation.\n\n"+
			"---------------------------------------\n"+
			"Evaluation Status MUST be selected\n"+
			"---------------------------------------";
		break;
		case 4:
			vMsg = "Illegal operation.\n\n"+
			"---------------------------------------\n"+
			"Project MUST be selected\n"+
			"---------------------------------------";
		break;
	}
	//
	//--------------------------------------------------------------------------
	alert(vMsg);
}