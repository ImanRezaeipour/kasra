<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" AutoEventWireup="true" CodeBehind="DefineExtendedFields.aspx.cs"
    Inherits="FrmPresentation.App_Pages.BaseInfo.XmlField.DefineExtendedFields" Title="Untitled Page" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1">
        <tr>
            <td>
                نام فيلد:
            </td>
            <td>
                <input id="txtName" type="text" style="width: 120px" class="TxtControls" runat="server" />
            </td>
            <td>
                نام شي انتخابي:
            </td>
            <td>
                <select id="CmbSelectedObj" name="CmbSelectedObj" style="width: 220px" dir="ltr"
                    runat="server" class="TxtControls">
                    <option></option>
                </select>
            </td>
            <td>
                نوع فيلد :
            </td>
            <td>
                <select id="CmbTypeBase" name="CmbTypeBase" style="width: 120px" class="TxtControls">
                    <option value="0">فيلد تک مقداري</option>
                    <option value="1">فيلد چند مقداري</option>
                    <option value="2">فيلد ترکيبي</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <table style="width: 90%" id="TblSimpleField">
                    <tr>
                        <td>
                            <fieldset style="border: 1px solid #33CCCC;">
                                <legend style="color: #75A3D0">تعريف فيلد تک مقداري</legend>
                                <table style="width: 100%" cellpadding="2" cellspacing="2">
                                    <tr>
                                        <td class="style2">
                                            <div align="right">
                                                نوع داده :
                                            </div>
                                        </td>
                                        <td class="style2">
                                            <div align="right">
                                                <select id="CmbType" name="CmbType" style="width: 90px" class="TxtControls" runat="server">
                                                    <option></option>
                                                </select></div>
                                        </td>
                                        <td class="style2">
                                            <div align="right">
                                                <input id="Checkbox1" type="checkbox" />مقدار پيش فرض:
                                            </div>
                                        </td>
                                        <td class="style2">
                                            <div align="right">
                                                <input id="txtDefault" type="text" style="width: 120px" class="TxtControls" runat="server"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <div align="right">
                                                <input id="RDRequire" type="radio" name="RDRequire" checked runat="server"/>اجباري<br />
                                                <input id="RDAttribute" type="radio" name="RDAttrib" runat="server"/>مخفي
                                            </div>
                                        </td>
                                        <td align="right">
                                            <div align="right">
                                                <input id="RDNoRequire" type="radio" name="RDRequire" runat="server"/>غير اجباري<br />
                                                <input id="RDNoAttribute" type="radio" name="RDAttrib" checked runat="server"/>
                                                غير مخفی
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <br />
                                                نام نمايشي:</div>
                                        </td>
                                        <td>
                                            <br />
                                            <div align="right">
                                                <input id="txtCaption" type="text" style="width: 120px" class="TxtControls" runat="server"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="right">
                                                شرح فيلد:</div>
                                        </td>
                                        <td colspan="3">
                                            <div align="right">
                                                <textarea id="txtDesc" cols="20" style="width: 100%; height: 40px; font-weight: bold;
                                                    font-size: 8pt; font-family: Kasratahoma; background-color: white; border-color: lightsteelblue;"
                                                    rows="2" runat="server"></textarea>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
                <%--<table style="width: 90%" id="Table1">
                    <tr>
                        <td>
                            <fieldset style="border: 1px solid #33CCCC;">
                                <legend style="color: #75A3D0">تعريف فيلد تک مقداري</legend>
                                <table style="width: 100%" cellpadding="2" cellspacing="2">
                                    <tr>
                                        <td class="style2">
                                            <div align="right">
                                                نوع داده :
                                            </div>
                                        </td>
                                        <td class="style2">
                                            <div align="right">
                                                <select id="Select1" name="CmbType" style="width: 90px" class="TxtControls" runat="server">
                                                    <option></option>
                                                </select></div>
                                        </td>
                                        <td class="style2">
                                            <div align="right">
                                                <input id="Checkbox2" type="checkbox" />مقدار پيش فرض:
                                            </div>
                                        </td>
                                        <td class="style2">
                                            <div align="right">
                                                <input id="Text1" type="text" style="width: 120px" class="TxtControls" runat="server"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <div align="right">
                                                <input id="Radio1" type="radio" name="RDRequire" checked runat="server"/>اجباري<br />
                                                <input id="Radio2" type="radio" name="RDAttrib" runat="server"/>مخفي
                                            </div>
                                        </td>
                                        <td align="right">
                                            <div align="right">
                                                <input id="Radio3" type="radio" name="RDRequire" runat="server"/>غير اجباري<br />
                                                <input id="Radio4" type="radio" name="RDAttrib" checked runat="server"/>
                                                غير مخفی
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <br />
                                                نام نمايشي:</div>
                                        </td>
                                        <td>
                                            <br />
                                            <div align="right">
                                                <input id="Text2" type="text" style="width: 120px" class="TxtControls" runat="server"/></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="right">
                                                شرح فيلد:</div>
                                        </td>
                                        <td colspan="3">
                                            <div align="right">
                                                <textarea id="Textarea1" cols="20" style="width: 100%; height: 40px; font-weight: bold;
                                                    font-size: 8pt; font-family: Kasratahoma; background-color: white; border-color: lightsteelblue;"
                                                    rows="2" runat="server"></textarea>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>--%>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div >
                            <input type="button" value="ذخیره"  onclick="onclickBtnSave()"/>
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />  
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />   
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />   
            <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />        
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />  
    </div>
    
     <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";        
             
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {
                   
        }

        function EndRequestHandler(sender, args) {      
                
            if ($get(MasterObj + "txtValidate").value != "1") {
                alert($get(MasterObj + "txtAlert").value)
            }
                
               else alert($get(MasterObj + "txtAlert").value );
            
            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value="";
            
        }  


    </script>

    <script language="javascript" type="text/javascript">
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
        function onclickBtnSave() {                    
            document.getElementById(MasterObj + "txtSubmit").value = "Save";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
   //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    
    </script>   
</asp:Content>
