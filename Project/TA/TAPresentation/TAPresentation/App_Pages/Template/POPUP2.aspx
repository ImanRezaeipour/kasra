<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="POPUP2.aspx.cs" Inherits="TAPresentation.App_Pages.Template.POPUP2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script language="javascript">
        function pageLoad() 
        {
        
//            var oPopup = window.createPopup();
//            var oPopupBody = oPopup.document.body;
//            oPopupBody.style.backgroundColor = "lightyellow";

           //form1.txtBtnSave.value="ذخيره شد"

           // oPopup.document.body.innerHTML = "ذخيره شد"
            //            oPopup.show(300, 100, 250, 30);
            form1.myCheckBox.checked= true;
            form1.Btnpopup.click();
            //oPopupBody.innerHTML = form1.txtBtnSave.value;
            //oPopup.show(100, 100, 200, 50, document.body);
            
            

			
        }
        ////////////
        
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
     <div >
         <input id="myCheckBox" type="checkbox" Margin="20,20,0,0" />
        <asp:TextBox ID="TextBox1" onkeypress="pageLoad()"  onkeydown="pageLoad()" runat="server"></asp:TextBox>
     </div>
    <div>
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
    </div>
   
    <div style="DISPLAY: none">
         
       <input type="button" id="Btnpopup" runat="server" name="Btnpopup" HorizontalAlignment="Left" Width="200" Margin="20,10,0,0">
      
      <Button.Triggers>
        <EventTrigger RoutedEvent="Button.Click">
          <BeginStoryboard>
            <Storyboard>
              <DoubleAnimation 
                Storyboard.TargetName="theTransform"
                Storyboard.TargetProperty="(RotateTransform.Angle)" 
                From="0" To="360" Duration="0:0:5" AutoReverse="True"/>
            </Storyboard>
          </BeginStoryboard>
        </EventTrigger>
      </Button.Triggers>
      Click to see the Popup animate
    </Button>
    </div>
    </form>
</body>
</html>
