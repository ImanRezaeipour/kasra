<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PopupTest.aspx.cs" Inherits="TAPresentation.App_Pages.Template.PopupTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<STYLE type="text/css">
    .clsHorizLR 		{ writing-mode:lr-tb }
    .clsHorizRL         { writing-mode:rl-tb }
    .clsVertTB          { writing-mode:tb-rl }
    .clsVertBT          { writing-mode:bt-rl }
</STYLE>
<head runat="server">
    <title>Untitled Page</title>
    <script src="WaitShow.js"></script>
    <script language="javascript">
        function pageLoad() 
        {
        
            var oPopup = window.createPopup();
            var oPopupBody = oPopup.document.body;
            oPopupBody.style.backgroundColor = "lightyellow";

            form1.txtBtnSave.value="ذخيره شد"

//            oPopup.document.body.innerHTML = txtBtnSave.value
//            oPopup.show(300, 100, 250, 30);

            oPopupBody.innerHTML = form1.txtBtnSave.value;
            //oPopup.style = "VertGradientBlue1";
            //oPopup.background = "LightBlue"
            oPopup.show(100, 100, 200, 50, document.body);
            
            //fnStartInterval()
            //window.setInterval("fLoop()",200);
            
            

			
        }
        ////////////
        function fLoop()
        {
            var j=0;
            for (var i=0 ;i>100;i++)
            {
                if (i==100)
                {
                    form1.rr.focus();
                    
                }
            }
        }
    </script>
</head>
<body>
    <form id="form1"  runat="server">
    <Popup IsOpen="{Binding ElementName=myCheckBox,Path=IsChecked}" 
       PlacementTarget="{Binding ElementName=myCheckBox}"            
       AllowsTransparency="True"
       PopupAnimation="Slide"
       HorizontalOffset="50"
       VerticalOffset="50"
       >
  <!--The Margin set on the Canvas provides the additional 
      area around the Popup so that the Popup is visible when 
      it rotates.-->
  <Canvas Width="100" Height="100" Background="DarkBlue"
          Margin="150">
    <Canvas.RenderTransform>
      <RotateTransform x:Name="theTransform" />
    </Canvas.RenderTransform>
    <TextBlock TextWrapping="Wrap" Foreground="White">
      Rotating Popup
    </TextBlock>
  </Canvas>
</Popup>



    <div>
        <asp:TextBox ID="TextBox1" onkeypress="pageLoad()"  onkeydown="pageLoad()" runat="server"></asp:TextBox>
        <input id="rr" name="rr" type="text" runat="server" />
        
    </div>
    <DIV STYLE="writing-mode:tb-rl">
    First Set of Vertical Text
    <SPAN CLASS="clsHorizLR">First Set of Horizontal Text</SPAN>
    </DIV>
    <div style="DISPLAY: none">
        <input id="txtBtnSave" name="txtBtnSave" type="text" runat="server" />
        
    </div>
    </form>
</body>
</html>
