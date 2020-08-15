<%@ Page Title="------------------------------------------------------------------------------------------" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="CardTableNotAcceptDesc.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.WorkFlow.CardTableNotAcceptDesc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    .CssBtn
    {
        background-position:center;
	    BACKGROUND-REPEAT: no-repeat;	
	    BACKGROUND-COLOR: transparent;
	    BORDER-RIGHT: #346fa4 2px solid; 
	    BORDER-TOP: lightsteelblue 2px solid; 
	    BORDER-LEFT: lightsteelblue 2px solid; 
	    BORDER-BOTTOM: #346fa4 2px solid;  
	    WIDTH: 65px;
	    HEIGHT: 30px	
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center;vertical-align:middle">
        <table align="center"  dir="rtl">
            <tr>
                <td>
                    <fieldset dir="rtl" style="height:100px; width:400px; border-right: lightblue thin inset; border-top: lightblue thin solid;
                        border-left: lightblue thin outset; border-bottom: lightblue thin solid;" align="middle">
                        <legend style="color: lightblue">شرح عدم تاييد</legend>
                        <table id="Table1" style="width: 299px; height: 100px;" cellpadding="0" align="center"
                            cellspacing="0">
                            <tr>
                                <td>
                                    <asp:TextBox runat="server" ID="txtDesrc" TextMode="MultiLine" 
                                       Height="100px" Width="350px" CssClass="TxtControls"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
           
            <tr>
                <td colspan="2" >
                    <table style="width: 94px" align="center">
                        <tr>
                            <td>
                                <input id="BtnOK" name="BtnOK" type="button" onclick="onClickBtnOK()" style="background-image: url('../../../App_Utility/Images/Buttons/btnsave.gif');
                                    cursor: pointer;" class="CssBtn" />
                            </td>
                           <%-- <td>
                                <input id="BtnCancel" onclick="onClickBtnCancel()" name="BtnCancel" type="button"
                                    style="background-image: url('../../../App_Utility/Images/ModifyPersonImage/Cancel.gif');
                                    cursor: pointer;" class="CssBtn" />
                            </td>--%>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        //================================================================
        function onClickBtnOK() {
            window.returnValue = document.getElementById(MasterObj + "txtDesrc").value;
            window.close();
        }
        function onClickBtnCancel() {
            window.returnValue = "";
            window.close();
        }
    </script>
</asp:Content>
