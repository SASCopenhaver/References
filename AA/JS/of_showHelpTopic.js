function of_showHelpTopic(argItemID){ with(self.document.forms[0])
{
//alert(argItemID)
	if (argItemID == "0")
	{
		of_innerHTML("id_HelpTopic", "'<strong>What?</strong><br> I mean what kind of Default Statement should be here? :-)'")
	}
	else
	{
		for (var h=0; h<rowsHT; h++)
		{
		//orgBfrHT[h]  atopic_st_id, ast_nm, atopic_txt
			if (argItemID == orgBfrHT[h].atopic_st_id)
			{//alert(orgBfrHT[h].ast_nm)
				of_innerHTML("id_HelpTopic", "'"+"<strong>"+orgBfrHT[h].ast_nm+"</strong>"+"<br>"+orgBfrHT[h].atopic_txt+"'")
				break;
			}
		}
	}
}}