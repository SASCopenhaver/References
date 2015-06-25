function of_browserSelection()
{
	browser = navigator.appName;
	browserNum = parseInt(navigator.appVersion);
	
	if ( (browser == "Netscape") && (browserNum<5) )
	{
		//Netscape 4.x
		layerRef = "document.layers['";
		endLayerRef = "']";
		styleRef = "";
		vInnerHTML = "";
	}
	
	else if ( (browser == "Netscape") && (browserNum>=5) )
	{
		//Netscape 6
		layerRef = "document.getElementByID('";
		endLayerRef = "')";
		styleRef = ".style";
		vInnerHTML = ".innerHTML=";
	}
	else
	{
		//Internet Explorer
		layerRef = "document.all['";
		endLayerRef = "']";
		styleRef = ".style";
		vInnerHTML = ".innerHTML=";
	}
	
	
}