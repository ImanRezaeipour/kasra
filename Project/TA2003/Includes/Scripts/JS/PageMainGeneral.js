var hInternalIU = null;
var hImportIU = null;
var hExportIU = null;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
function InternalIU_Onclick()
{
	if(hImportIU!=null && !hImportIU.closed)
		hImportIU.close();
	if(hExportIU!=null && !hExportIU.closed)
		hExportIU.close();

	if(hInternalIU!=null && !hInternalIU.closed)
	{
		hInternalIU.focus();
		return false;
	}
	
	var strFeature = "channelmode=1";
	var strUrl = "/Automation/Letter/Internal/InternalIU.aspx?Requester=CreateInternalLetter&State=1";
	hInternalIU = window.open(strUrl , "InternalIU" , strFeature);
	return false;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
function ImportIU_Onclick()
{
	if(hInternalIU!=null && !hInternalIU.closed)
		hInternalIU.close();
	if(hExportIU!=null && !hExportIU.closed)
		hExportIU.close();

	if(hImportIU!=null && !hImportIU.closed)
	{
		hImportIU.focus();
		return false;
	}
	
	var strFeature = "width=700,height=680,scrollbars=yes,top=5,left=150";
	var strUrl = "/Automation/Letter/Import/ImportIU.aspx?State=1";
	hImportIU = window.open(strUrl , "ImportIU" , strFeature);
	return false;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
function ExportIU_Onclick()
{
	if(hInternalIU!=null && !hInternalIU.closed)
		hInternalIU.close();
	if(hImportIU!=null && !hImportIU.closed)
		hImportIU.close();
		
	if(hExportIU!=null && !hExportIU.closed)
	{
		hExportIU.focus();
		return false;
	}
	
	var strFeature = "width=700,height=680,scrollbars=yes,top=5,left=150";
	var strUrl = "/Automation/Letter/Export/ExportIU.aspx?State=1";
	hExportIU = window.open(strUrl , "ExportIU" , strFeature);
	return false;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////