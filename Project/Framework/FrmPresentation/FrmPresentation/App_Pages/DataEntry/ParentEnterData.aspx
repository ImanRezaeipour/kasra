<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParentEnterData.aspx.cs" Inherits="FrmPresentation.App_Pages.DataEntry.ParentEnterData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>

    <script language="javascript" type="text/javascript">
// <!CDATA[


        function Button1_onclick() {
            var url = "EnterData.aspx?BatchEnterDataType=Person" 
            var StrFeatur = "dialogHeight: 700px;dialogWidth: 800px;center: Yes;help: no;status: no"
            var returnValue = window.showModalDialog(url, window, StrFeatur) 
        }

        function Button2_onclick() {
            var url = "EnterData.aspx?BatchEnterDataType=Department"
            var StrFeatur = "dialogHeight: 700px;dialogWidth: 800px;center: Yes;help: no;status: no"
            var returnValue = window.showModalDialog(url, window, StrFeatur) 
        }

// ]]>
    </script>
</head>
<body>
    
    <form id="form1" runat="server">
    <div >
        <table class="style1">
        <tr>
            <td>
                <input id="Button1" type="button" value="button" onclick="return Button1_onclick()" /></td>
            <td>
                دريافت اطلاعات پرسنل</td>
        </tr>
        <tr>
            <td>
                <input id="Button2" type="button" value="button" onclick="return Button2_onclick()" /></td>
            <td>
                دريافت اطلاعات واحد سازماني</td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
