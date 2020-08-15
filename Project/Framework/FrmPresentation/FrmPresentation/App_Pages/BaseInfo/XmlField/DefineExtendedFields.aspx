<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    ValidateRequest="false" AutoEventWireup="true" CodeBehind="DefineExtendedFields.aspx.cs"
    Inherits="FrmPresentation.App_Pages.BaseInfo.XmlField.DefineExtendedFields" Title="Untitled Page" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register src="../../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script language="javascript" type="text/javascript">
    [ ].indexOf || (Array.prototype.indexOf = function(v, n) {
        n = (n == null) ? 0 : n; var m = this.length;
        for (var i = n; i < m; i++)
            if (this[i] == v)

            return i;
        return -1;
    });   
</script>
    <style type="text/css">
        .style1
        {
            width: 90%;
        }
        .NewEntity
        {
            background-color: #DFD5EC;
            border-top-color: #FFFFFF;
            border-top-width: 2px;
            border-top-style: groove;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager AsyncPostBackTimeout="600" ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="4">
            
         <uc1:ToolBar ID="OToolBar" runat="server" />
            
            </td>
        </tr>
        <!-----------------------------------------------فیلتر شی انتخابی و نوع فیلد------------------------------------->
        <tr id="TRNewSchema" style="display: none" runat="server">
            <td colspan="4" style="font-size: 14; color: red">
                براي تعريف شِمای جديد حداقل بايد يک فيلد تعريف شود
            </td>
        </tr>
        <tr id="TRBase" runat="server">
            <td valign="top">
                <table>
                    <tr>
                        <td>
                            <div align="left">
                                نام شِما:</div>
                        </td>
                        <td>
                            <div id="DivEdit" align="right" style="display:none">
                                <select id="CmbSelectedObj" name="CmbSelectedObj" style="width: 220px" dir="ltr"
                                    runat="server" class="TxtControls">
                                    <option></option>
                                </select></div>
                            <div id="DivDefine" style="display: inline;width: 300px">                                
                                <input type="text" id="txtSelectedBase" dir="ltr" onkeydown="KeyDownEng(this,event)" runat="server" class="TxtControls"  />&nbsp;.&nbsp;
                                <select id="CmbSchemas" name="CmbSchemas" style="width: 50px" dir="ltr"
                                    runat="server" class="TxtControls">
                                    <option></option>
                                </select>
                            </div>
                        </td>
                    </tr>
                </table>                
            </td>
            <td valign="top">
                <div align="left">
                    نوع فيلد :</div>
            </td>
            <td>
                <div align="right">
                    <select id="CmbTypeBase" name="CmbTypeBase" style="width: 150px" class="TxtControls"
                        onchange="onchangeCmbTypeBase()" runat="server">
                        <option value="0">فيلد ساده</option>
                        <option value="1">فيلد چند مقداري</option>
                        <option value="2">فيلد از نوع فيلد خارجي</option>
                        <option value="3">فيلد از نوع شی جديد</option>
                    </select></div>                
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <hr class="CssHR" style="width: 700px" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <!----------------------------------------------------نوع فیلد ساده--------------------------------------------------->
                <table id="TblSimpleField" style="border: 2px solid #000000; display: inline; width: 600px; height:250px; background-color: #9BB4D0;">
                    <tr>
                        <td>
                            <fieldset style="border: 1px solid #33CCCC; width: 500px; background-color: #E3EFFF;">
                                <legend style="color: #75A3D0">تعريف فيلد ساده</legend>
                                <table style="width: 100%" cellpadding="2" cellspacing="2">
                                    <tr>
                                        <td>
                                            نام فيلد:
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input id="txtName" onkeydown="KeyDownEng(this,event)" type="text" style="width: 120px" class="TxtControls" runat="server" /></div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                نام نمايشي:</div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input id="txtCaption" type="text" style="width: 120px" class="TxtControls" runat="server" /></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="right">
                                                نوع داده :
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <select id="CmbType" name="CmbType" style="width: 90px" class="TxtControls" runat="server"
                                                    onchange="onchangeCmbType(0)">
                                                    <option></option>
                                                </select></div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                مقدار پيش فرض:
                                            </div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input id="txtDefault" type="text" style="width: 120px" class="TxtControls" runat="server" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                     <td align="right">
                                            <div align="right">
                                                <input id="RDRequire" type="checkbox" name="RDRequire" checked runat="server" />اجباري
                                            </div>
                                        </td>
                                        <td align="right">
                                            <div align="right">
                                                <input id="RDAttribute" type="checkbox" name="RDAttrib" runat="server" />مخفي
                                            </div>
                                        </td>
                                                                           
                                       <td style="text-align:right"> اولويت:   <input type="text" id="txtIntval" style="width:50px" onkeydown="OnKeyDownInt(this)" runat="server" /></td>
                                       <td style="text-align:right">طول آيتم <input type="text" id="txtWidth" style="width:50px" onkeydown="OnKeyDownInt(this)" runat="server" />px</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="right">
                                                شرح فيلد:</div>
                                        </td>
                                        <td colspan="5">
                                            <div align="right">
                                                <textarea id="txtDesc" cols="20" style="width: 95%; height: 40px; font-weight: bold;
                                                    font-size: 8pt; font-family: Tahoma; background-color: white; border-color: lightsteelblue;"
                                                    rows="2" runat="server"></textarea>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
                <!----------------------------------------------------نوع فیلد چند مقداری--------------------------------------------------->
                <table id="TblMultiValue" style="border: 2px solid #000000; display: none; width: 600px; height:360px; background-color: #9BB4D0;">
                    <tr>
                        <td>
                            <fieldset style="border: 1px solid #33CCCC; width: 500px; background-color: #E3EFFF;">
                                <legend style="color: #75A3D0">تعريف فيلد چند مقداري</legend>
                                <table style="width: 95%;" cellpadding="2" cellspacing="2">
                                    <tr>
                                        <td>
                                            نام فيلد:
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input id="txtDLookupName"  onkeydown="KeyDownEng(this,event)" type="text" style="width: 120px" class="TxtControls" runat="server" /></div>
                                        </td>
                                        <td>
                                            نام نمايشي:
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input id="txtCaptionMulti" type="text" style="width: 120px" class="TxtControls"
                                                    runat="server" /></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 60px">
                                            <div align="right">
                                                نوع داده :
                                            </div>
                                        </td>
                                        <td style="width: 90px">
                                            <div align="right">
                                                <select id="CmbTypeMulti" name="CmbTypeMulti" style="width: 90px" class="TxtControls"
                                                    runat="server">
                                                    <option></option>
                                                </select></div>
                                        </td>
                                        <td style="text-align:right">طول آيتم</td>
                                        <td style="text-align:right"> <input type="text" id="txtMultiWidth" style="width:50px" onkeydown="OnKeyDownInt(this)" runat="server" />px</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            اولويت:
                                        </td>
                                        <td style="text-align: right">
                                            <input id="txtMultiIntval" type="text" style="width: 50px" onkeydown="OnKeyDownInt(this)" runat="server"/>
                                        </td>                                        
                                        <td>
                                            <div align="right">
                                                <input id="ChkRequire" type="checkbox" runat="server" />اجباري</div>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input id="ChkHide" type="checkbox" runat="server" />مخفي</div>
                                        </td></tr>
                                    <tr>
                                        <td>
                                            <div align="right">
                                                شرح فيلد:</div>
                                        </td>
                                        <td colspan="5">
                                            <div align="right">
                                                <textarea id="txtDescMulti" cols="20" style="width: 100%; height: 40px; font-weight: bold;
                                                    font-size: 8pt; font-family: Tahoma; background-color: white; border-color: lightsteelblue;"
                                                    rows="2" runat="server"></textarea>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" style="border-right-color: #000000; border-right-width: 2px; border-right-style: ridge;
                                            border-left-color: #000000; border-left-width: 2px; border-left-style: ridge;
                                            border-top-color: #000000; border-top-width: 1px; border-top-style: inset; border-bottom-color: #000000;
                                            border-bottom-width: 1px; border-bottom-style: inset;" valign="top">
                                            <table style="height: 180px; width: 90%">
                                                <tr style="height: 10px">
                                                    <td style="width: 150px">
                                                        <div style="width: 150px" align="right">
                                                            انتخاب مجموعه مقادير:
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="right">
                                                            <select id="CmbBasicInfo" name="CmbBasicInfo" style="width: 150px" class="TxtControls"
                                                                runat="server" onchange="onchangeCmbBasicInfo(1)">
                                                                <option></option>
                                                            </select></div>
                                                    </td>
                                                    <td style="width: 300px">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" valign="top">
                                                        <table>
                                                            <tr>
                                                                <td class="CssHeaderStyle" style="width: 60px">
                                                                    پيش فرض
                                                                </td>
                                                                <td class="CssHeaderStyle" style="width: 300px">
                                                                    مقدار
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <div style="scrollbar-highlight-color: white; overflow: auto; scrollbar-arrow-color: black;
                                                            scrollbar-base-color: #b0c4de; height: 120px;">
                                                            <table id="TblDLookup">
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
                <!----------------------------------------------------نوع فیلد خارجی--------------------------------------------------->
                <table id="TblOwnField" 
                    style="border: 2px solid #000000; display: none; width: 600px; height:250px; background-color: #9BB4D0;">
                    <tr>
                        <td>
                            <fieldset style="border: 1px solid #33CCCC; width: 550px; background-color: #E3EFFF;">
                                <legend style="color: #75A3D0">تعريف فيلد از نوع فيلد خارجی </legend>
                                <table>
                                    <tr>
                                        <td>
                                            نام جدول
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                <ContentTemplate>
                                                    <select id="CmbSourceTable" dir="ltr" style="width: 150px" class="TxtControls" runat="server"
                                                        onchange="onchangeCmbSourceTable(0)">
                                                        <option></option>
                                                    </select>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td>
                                            نام فيلد نمايشي
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                <ContentTemplate>
                                                    <select id="CmbFieldName" dir="ltr" style="width: 150px" class="TxtControls" runat="server">
                                                        <option></option>
                                                    </select>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                    <td>
                                            نام فيلد ذخيره
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                <ContentTemplate>
                                                    <select id="CmbSecondField" dir="ltr" style="width: 150px" class="TxtControls" runat="server">
                                                        <option></option>
                                                    </select>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            </td>
                                            <td>اولويت:</td>
                                            <td style="text-align:right"><input id="txtFieldIntval" type="text" style="width:50px" onkeydown="OnKeyDownInt(this)" runat="server"/></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            نام فيلد:
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input id="txtOtherField" onkeydown="KeyDownEng(this,event)" type="text" style="width: 120px" class="TxtControls" runat="server" /></div>
                                        </td>
                                        <td>
                                            نوع
                                        </td>
                                        <td>
                                            <div align="right">
                                                <select id="CmbTypeField" style="width: 100px" class="TxtControls" runat="server">
                                                    <option></option>
                                                </select></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input id="ChkFieldRequire" type="checkbox" runat="server" />اجباري
                                                <input id="ChkFieldHide" type="checkbox" runat="server" />مخفي</div>
                                        </td>
                                        <td>
                                            نام نمايشي:
                                        </td>
                                        <td>
                                            <div align="right">
                                                <input id="txtFieldCaption" type="text" style="width: 120px" class="TxtControls"
                                                    runat="server" /></div>
                                        </td>
                                    </tr>
                                    <tr> <td style="text-align:right">طول آيتم</td>
                                        <td style="text-align:right"> <input type="text" id="txtFieldWidth" style="width:50px" onkeydown="OnKeyDownInt(this)" runat="server" />px</td></tr>
                                    <tr>
                                        <td>
                                            شرح:
                                        </td>
                                        <td colspan="5">
                                            <textarea id="txtFieldDescr" cols="20" style="width: 100%; height: 40px; font-weight: bold;
                                                font-size: 8pt; font-family: Tahoma; background-color: white; border-color: lightsteelblue;"
                                                rows="2" runat="server"></textarea>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
                <!----------------------------------------------------نوع فیلد شي جدید--------------------------------------------------->
                <table id="TblSeveralValue" style="display: none" width="100%" cellpadding="0"
                    cellspacing="0">
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        نام شي:
                                    </td>
                                    <td>
                                        <div align="right">
                                            <input id="txtNewName" onkeydown="KeyDownEng(this,event)" type="text" class="TxtControls" runat="server" /></div>
                                    </td>   
                                    <td>اولويت :</td>    
                                    <td> <input id="txtNewIntval" type="text" style="width:50px" onkeydown="OnKeyDownInt(this)" runat="server"/></td>                 
                                    <td style="text-align:right">طول آيتم</td>
                                        <td style="text-align:right"> <input type="text" id="txtNewWidth" style="width:50px" onkeydown="OnKeyDownInt(this)" runat="server" />px</td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <hr class="CssHR" style="width: 700px" />
                                    </td>
                                </tr>
                            </table>
                            <table width="95%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <div style="background-color: #9BBCEB">
                                            فيلد ساده</div>
                                    </td>
                                    <td align="right">
                                        <table align="right" cellspacing="0" cellpadding="0" width="760px">
                                            <tr>
                                                <td class="NewEntity" style="width: 90px">
                                                    نام
                                                </td>
                                                <td class="NewEntity" style="width: 80px">
                                                    نوع داده
                                                </td>
                                                <td class="NewEntity" style="width: 30px">
                                                    اجباري
                                                </td>
                                                <td class="NewEntity" style="width: 30px">
                                                    مخفي
                                                </td>
                                                <td class="NewEntity" style="width: 90px">
                                                    نام نمايشي
                                                </td>
                                                <td class="NewEntity" style="width: 100px">
                                                    مقدار پيش فرض
                                                </td>
                                                <td class="NewEntity" style="width: 100px">
                                                    شرح
                                                </td>
                                                <td style="width: 30px">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="NewEntity" style="width: 100px">
                                                    <input type="text" id="txtSimpleName" onkeydown="KeyDownEng(this,event)" style="width: 90px" class="TxtControls" align="left" />
                                                </td>
                                                <td class="NewEntity" style="width: 80px">
                                                    <select id="CmbTypeSeveral1" name="CmbType" style="width: 90px" class="TxtControls"
                                                        runat="server" onchange="onchangeCmbType(1)">
                                                        <option></option>
                                                    </select>
                                                </td>
                                                <td class="NewEntity" style="width: 30px">
                                                    <input id="ChkSimplerequire" type="checkbox" />
                                                </td>
                                                <td class="NewEntity" style="width: 30px">
                                                    <input id="ChkSimpleHide" type="checkbox" />
                                                </td>
                                                <td class="NewEntity" style="width: 90px">
                                                    <input type="text" id="txtCaptionSimple" style="width: 90px" class="TxtControls" />
                                                </td>
                                                <td class="NewEntity" style="width: 100px">
                                                    <input type="text" id="txtSimpleDefault" style="width: 90px" class="TxtControls" />
                                                </td>
                                                <td class="NewEntity" style="width: 130px">
                                                    <input type="text" id="txtSimpleDescr" style="width: 120px" class="TxtControls" align="right" />
                                                </td>
                                                <td style="width: 30px">
                                                    <img src="../../../App_Utility/Images/Icons/Down.gif" onclick="onclickImgDown()" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="background-color: #9BBCEB">
                                            چند مقداري</div>
                                    </td>
                                    <td align="right" valign="top" style="width: 95%">
                                        <table align="right" cellspacing="0" cellpadding="0" width="755px">
                                            <tr>
                                                <td class="NewEntity" style="width: 90px">
                                                    نام
                                                </td>
                                                <td class="NewEntity" style="width: 80px">
                                                    نوع داده
                                                </td>
                                                <td class="NewEntity" style="width: 30px">
                                                    اجباري
                                                </td>
                                                <td class="NewEntity" style="width: 30px">
                                                    مخفي
                                                </td>
                                                <td class="NewEntity" style="width: 90px">
                                                    نام نمايشي
                                                </td>
                                                <td class="NewEntity" style="width: 90px">
                                                    مجموعه مقادير
                                                </td>
                                                <td class="NewEntity" style="width: 100px">
                                                    مقدار پيش فرض
                                                </td>
                                                <td class="NewEntity" style="width: 100px">
                                                    شرح
                                                </td>
                                                <td style="width: 30px">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="NewEntity" style="width: 100px">
                                                    <input type="text" id="txtSeveralName" onkeydown="KeyDownEng(this,event)" style="width: 90px" class="TxtControls" align="left" />
                                                </td>
                                                <td class="NewEntity" style="width: 80px">
                                                    <select id="CmbTypeSeveral2" name="CmbType" style="width: 90px" class="TxtControls"
                                                        runat="server">
                                                        <option></option>
                                                    </select>
                                                </td>
                                                <td class="NewEntity" style="width: 30px">
                                                    <input id="ChkSeveralRequire" type="checkbox" />
                                                </td>
                                                <td class="NewEntity" style="width: 30px">
                                                    <input id="ChkSeveralHide" type="checkbox" />
                                                </td>
                                                <td class="NewEntity" style="width: 90px">
                                                    <input type="text" id="txtSeveralCaption" style="width: 90px" class="TxtControls" />
                                                </td>
                                                <td class="NewEntity" style="width: 90px">
                                                    <select id="CmbSeveralBasic" name="CmbType" style="width: 90px" class="TxtControls"
                                                        runat="server" onchange="onchangeCmbBasicInfo(0)">
                                                        <option></option>
                                                    </select>
                                                </td>
                                                <td class="NewEntity" style="width: 100px">
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <select id="CmbDLookup" name="CmbDLookup" style="width: 90px" class="TxtControls"
                                                                runat="server">
                                                                <option></option>
                                                            </select>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td class="NewEntity" style="width: 130px">
                                                    <input type="text" id="txtSeveralDescr" style="width: 120px" class="TxtControls"
                                                        align="right" />
                                                </td>
                                                <td style="width: 30px">
                                                    <img src="../../../App_Utility/Images/Icons/Down.gif" onclick="onclickImgDownSeveral()" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="background-color: #9BBCEB">
                                            فيلد خارجي</div>
                                    </td>
                                    <td align="right">
                                        <table align="right" cellpadding="0" cellspacing="0" style="width: 95%">
                                            <tr>
                                                <td align="right">
                                                    <table align="right" cellspacing="0" cellpadding="0" width="752px">
                                                        <tr>
                                                            <td class="NewEntity" style="width: 90px;">
                                                                نام
                                                            </td>
                                                            <td class="NewEntity" style="width: 80px;">
                                                                نوع داده
                                                            </td>
                                                            <td class="NewEntity" style="width: 30px;">
                                                                اجباري
                                                            </td>
                                                            <td class="NewEntity" style="width: 30px;">
                                                                مخفي
                                                            </td>
                                                            <td class="NewEntity" style="width: 90px;">
                                                                نام نمايشي
                                                            </td>
                                                            <td class="NewEntity" style="width: 100px;">
                                                                جدول منبع
                                                            </td>
                                                            <td class="NewEntity" style="width: 100px;">
                                                                 فيلد نمايشي
                                                            </td>
                                                            <td class="NewEntity" style="width: 100px;">
                                                                فيلد ذخيره
                                                            </td>
                                                            <td class="NewEntity" style="width: 100px;">
                                                                شرح
                                                            </td>
                                                            <td style="width: 30px">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="NewEntity" style="width: 100px;">
                                                                <input type="text" id="txtOwnName" onkeydown="KeyDownEng(this,event)" style="width: 90px" class="TxtControls" align="left" />
                                                            </td>
                                                            <td class="NewEntity" style="width: 80px;">
                                                                <select id="CmbOwnType" name="CmbType" style="width: 90px" class="TxtControls" runat="server">
                                                                    <option></option>
                                                                </select>
                                                            </td>
                                                            <td class="NewEntity" style="width: 30px;">
                                                                <input id="ChkOwnRequire" type="checkbox" />
                                                            </td>
                                                            <td class="NewEntity" style="width: 30px;">
                                                                <input id="ChkOwnHide" type="checkbox" />
                                                            </td>
                                                            <td class="NewEntity" style="width: 90px;">
                                                                <input type="text" id="txtOwnCaption" style="width: 90px" class="TxtControls" />
                                                            </td>
                                                            <td class="NewEntity" style="width: 150px;">
                                                                <select id="CmbOwnSourceTable" name="CmbOwnSourceTable" dir="ltr" style="width: 100px"
                                                                    class="TxtControls" runat="server" onchange="onchangeCmbSourceTable(1)">
                                                                    <option></option>
                                                                </select>
                                                            </td>
                                                            <td class="NewEntity" style="width: 100px;">
                                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <select id="CmbOwnFieldsName" name="CmbType" dir="ltr" style="width: 90px" class="TxtControls"
                                                                            runat="server">
                                                                            <option></option>
                                                                        </select>
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmitNew" EventName="click" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                            <td class="NewEntity" style="width: 100px;">
                                                                <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <select id="CmbSaveFieldsName" name="CmbSaveFieldsName" dir="ltr" style="width: 90px" class="TxtControls"
                                                                            runat="server">
                                                                            <option></option>
                                                                        </select>
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="BtnSubmitNew" EventName="click" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                            <td class="NewEntity" style="width: 130px;">
                                                                <input type="text" id="txtOwnDesc" style="width: 120px" class="TxtControls" align="right" />
                                                            </td>
                                                            <td style="width: 30px">
                                                                <img src="../../../App_Utility/Images/Icons/Down.gif" onclick="onclickImgDownOwn()" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="right">
                                        <table align="right">
                                            <tr>
                                                <td class="CssHeaderStyle" style="width: 90px">
                                                    نوع فيلد
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 90px">
                                                    نام
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 90px">
                                                    نوع داده
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 30px">
                                                    اجباری
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 30px">
                                                    مخفي
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 90px">
                                                    نام نمايشي
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 90px">
                                                    مجموعه مقادير
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 90px">
                                                    پيش فرض
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 100px">
                                                    فيلد خارجي
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 90px">
                                                    شرح
                                                </td>
                                                <td class="CssHeaderStyle" style="width: 30px">
                                                    حذف
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="right">
                                        <div style="width: 820px; height: 150px; overflow: auto; scrollbar-highlight-color: white;
                                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;" align="right">
                                            <table id="TblSeveral" align="right">
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <br style="font-size: 4px" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <!-------------------------------------------------------#######################3--------------------------------------------------->
        <tr>
            <td colspan="6">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div>                            
                            <asp:HiddenField ID="txtAlert" runat="server" />
                            <asp:HiddenField ID="txtValidate" runat="server" />
                            <asp:HiddenField ID="txtBasicInfo" runat="server" />
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
        <asp:Button ID="BtnSubmitNew" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" name="txtCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtSchemaName" name="txtSchemaName" runat="server" />
        <input type="text" id="txtFieldName" name="txtFieldName" runat="server" />
        <input type="text" id="txtMode" name="txtMode" runat="server" />
        <input type="text" id="txtDLookupDefault" name="txtDLookupDefault" runat="server" />
        <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" />
    </div>
    <!-------------------------------------------------------#######################3--------------------------------------------------->

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        window.name = "DefineExtendedFields.aspx";
        window.target = window.name;

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {
            if (document.getElementById(MasterObj + "txtSubmit").value == "DLookup"
            || document.getElementById(MasterObj + "txtSubmit").value == "DLookupBind"
            || document.getElementById(MasterObj + "txtSubmit").value == "GetFields"
            || document.getElementById(MasterObj + "txtSubmit").value == "GetFieldsOwn")
                document.getElementById("ctl00_ProgressState").value = 1;
            $get(MasterObj + "txtAlert").value = "";
        }

        function EndRequestHandler(sender, args) {

            if ($get(MasterObj + "txtAlert").value != "") {
                if ($get(MasterObj + "txtValidate").value != "1") {
                    alert($get(MasterObj + "txtAlert").value)
                }
                else alert($get(MasterObj + "txtAlert").value);
            }
            if ($get(MasterObj + "txtSubmit").value == "DLookup") {

                CreateGrid();

            }

            if ($get(MasterObj + "txtValidate").value == 1) {
                window.returnValue = 1;
                if ($get(MasterObj + "txtSubmit").value == "Save" && document.getElementById(MasterObj + "txtMode").value != "Edit")
                    ClearType0();
                if ($get(MasterObj + "txtSubmit").value == "SaveDLookup" && document.getElementById(MasterObj + "txtMode").value != "Edit")
                    ClearType1();
                if ($get(MasterObj + "txtSubmit").value == "SaveType2" && document.getElementById(MasterObj + "txtMode").value != "Edit")
                    ClearType2();
                if ($get(MasterObj + "txtSubmit").value == "Type3" && document.getElementById(MasterObj + "txtMode").value != "Edit")
                    ClearType3();
                if (document.getElementById(MasterObj + "txtMode").value == "NewSchema") {
                    window.close();
                }
            }

            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";

        }
        //========================================Modify=======================
        if (document.getElementById(MasterObj + "txtMode").value == "Edit") {
            document.getElementById(MasterObj + "CmbSchemas").disabled = true;
            document.getElementById(MasterObj + "CmbTypeBase").disabled = true;
            DivEdit.style.display = "none";
            DivDefine.style.display = "inline";
            DivDefine.disabled = true;
            if (document.getElementById(MasterObj + "CmbTypeBase").value == 1) {
                CreateGrid();
                var i = 0, flag = true;
                while (i < TblDLookup.rows.length && flag) {
                    if (TblDLookup.rows(i).ID == document.getElementById(MasterObj + "txtDLookupDefault").value) {
                        TblDLookup.rows(i).cells(0).firstChild.checked = true;
                        flag = false;
                    }
                    i++;
                }
            }
        }
        //################################################################################################
        if (document.getElementById(MasterObj + "txtMode").value == "NewField") {
            document.getElementById(MasterObj + "CmbTypeBase").value = "0";
            DivEdit.style.display = "inline";
            DivDefine.style.display = "none";
        }
        else if (document.getElementById(MasterObj + "txtMode").value == "NewSchema") {
            document.getElementById(MasterObj + "CmbTypeBase").value = "0";
            document.getElementById(MasterObj + "TRNewSchema").style.display = "inline";
            DivDefine.style.display = "inline";
            DivEdit.style.display = "none";
        }
        onchangeCmbTypeBase();
        //========================================================
        function CreateGrid() {
            var i = 0
            while (i < TblDLookup.rows.length) {
                TblDLookup.deleteRow(i);
            }
            //-----------------------------
            if ($get(MasterObj + 'txtBasicInfo').value != "") {
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($get(MasterObj + 'txtBasicInfo').value)
                var XmlNodes = oXmlDoc.documentElement.selectNodes("/GeneralEntity/Lcombo");
                //-----------------------------------
                for (var j = 0; j < XmlNodes.length; j++) {
                    var ORow = TblDLookup.insertRow();
                    ORow.setAttribute("ID", XmlNodes.item(j).selectSingleNode("Val").text);
                    ORow.insertCell();
                    ORow.insertCell();
                    ORow.cells(0).innerHTML = "<input type='radio' name='RD'/>";

                    ORow.cells(1).innerText = XmlNodes.item(j).selectSingleNode("Title").text;
                    ORow.cells(0).style.width = "60px";
                    ORow.cells(1).style.width = "400px";
                    ORow.cells(1).align = "right";
                }
                if (TblDLookup.rows.length > 0)
                    TblDLookup.rows(0).cells(0).firstChild.checked = true;
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function CheckDataValidate(Sign) {
            if (Sign == 0) {
                if (document.getElementById(MasterObj + "txtName").value == "") {
                    alert("نام فيلد را وارد کنيد")
                    document.getElementById(MasterObj + "txtName").focus();
                    document.getElementById(MasterObj + "txtName").select();
                    return false;
                }
                if (document.getElementById(MasterObj + "txtCaption").value == "") {
                    alert("نام نمايشي را وارد کنيد")
                    document.getElementById(MasterObj + "txtCaption").focus();
                    document.getElementById(MasterObj + "txtCaption").select();
                    return false;
                }
                if (document.getElementById(MasterObj + "txtIntval").value == "") {                   
                    alert("اولويت را وارد کنيد") 
                    document.getElementById(MasterObj + "txtIntval").focus();
                    document.getElementById(MasterObj + "txtIntval").select();
                    return false;
                }
                if (document.getElementById(MasterObj + "txtWidth").value == "") {
                    alert("طول آیتم را وارد کنيد")
                    document.getElementById(MasterObj + "txtWidth").focus();
                    document.getElementById(MasterObj + "txtWidth").select();
                    return false;
                }
            }
            else if (Sign == 1) {
                if (document.getElementById(MasterObj + "txtDLookupName").value == "") {
                    alert("نام فيلد را وارد کنيد")
                    document.getElementById(MasterObj + "txtDLookupName").focus();
                    document.getElementById(MasterObj + "txtDLookupName").select();
                    return false;
                }
                if (document.getElementById(MasterObj + "txtCaptionMulti").value == "") {
                    alert("نام نمايشي را وارد کنيد")
                    document.getElementById(MasterObj + "txtCaptionMulti").focus();
                    document.getElementById(MasterObj + "txtCaptionMulti").select();
                    return false;
                }
                if (document.getElementById(MasterObj + "txtMultiIntval").value == "") {
                    alert("اولويت را وارد کنيد")
                    document.getElementById(MasterObj + "txtMultiIntval").focus();
                    document.getElementById(MasterObj + "txtMultiIntval").select();
                    return false;
                }
                if (document.getElementById(MasterObj + "txtMultiWidth").value == "") {
                    alert("طول آیتم را وارد کنيد")
                    document.getElementById(MasterObj + "txtMultiWidth").focus();
                    document.getElementById(MasterObj + "txtMultiWidth").select();
                    return false;
                }
            }
            else if (Sign == 2) {
                if (document.getElementById(MasterObj + "txtOtherField").value == "") {
                    alert("نام فيلد را وارد کنيد")
                    document.getElementById(MasterObj + "txtOtherField").focus();
                    document.getElementById(MasterObj + "txtOtherField").select();
                    return false;
                }
                if (document.getElementById(MasterObj + "txtFieldIntval").value == "") {
                    alert("اولويت را وارد کنيد")
                    document.getElementById(MasterObj + "txtFieldIntval").focus();
                    document.getElementById(MasterObj + "txtFieldIntval").select();
                    return false;
                }
                if (document.getElementById(MasterObj + "txtFieldCaption").value == "") {
                    alert("نام نمايشي را وارد کنيد")
                    document.getElementById(MasterObj + "txtFieldCaption").focus();
                    document.getElementById(MasterObj + "txtFieldCaption").select();
                    return false;
                }
                if (document.getElementById(MasterObj + "txtFieldWidth").value == "") {
                    alert("طول آیتم را وارد کنيد")
                    document.getElementById(MasterObj + "txtFieldWidth").focus();
                    document.getElementById(MasterObj + "txtFieldWidth").select();
                    return false;
                }
            }
            else if (Sign == 3) {
                if (document.getElementById(MasterObj + "txtNewName").value == "") {
                    alert("نام فيلد را وارد کنيد")
                    document.getElementById(MasterObj + "txtNewName").focus();
                    document.getElementById(MasterObj + "txtNewName").select();
                    return false;
                }
                if (document.getElementById(MasterObj + "txtNewIntval").value == "") {
                    alert("اولويت را وارد کنيد")
                    document.getElementById(MasterObj + "txtNewIntval").focus();
                    document.getElementById(MasterObj + "txtNewIntval").select();
                    return false;
                }
                if (TblSeveral.rows.length == 0) {
                    alert("هيچ آيتمي براي ذخيره تعريف نشده است");
                    return false;
                }
                if (document.getElementById(MasterObj + "txtNewWidth").value == "") {
                    alert("طول آیتم را وارد کنيد")
                    document.getElementById(MasterObj + "txtNewWidth").focus();
                    document.getElementById(MasterObj + "txtNewWidth").select();
                    return false;
                }
            }
            return true;
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
        function OnClickBtnSave() {
            if ((document.getElementById(MasterObj + "CmbSelectedObj").value != "0" && document.getElementById(MasterObj + "txtMode").value != "NewSchema")
                 ||
                (document.getElementById(MasterObj + "txtSelectedBase").value != "" && document.getElementById(MasterObj + "txtMode").value == "NewSchema")) {
                //----------------------------------------------------------------ذخیره نوع فيلد ساده
                if (document.getElementById(MasterObj + "CmbTypeBase").value == 0) {
                    if (CheckDataValidate(0)) {
                        document.getElementById(MasterObj + "txtSubmit").value = "Save";
                        document.getElementById(MasterObj + "BtnSubmit").click();
                    }
                }
                //----------------------------------------------------------------ذخیره نوع فيلد چند مقداري
                else if (document.getElementById(MasterObj + "CmbTypeBase").value == 1) {
                    if (CheckDataValidate(1)) {
                        var j = 0;
                        document.getElementById(MasterObj + "txtDLookupDefault").value = "";
                        while (j < TblDLookup.rows.length && document.getElementById(MasterObj + "txtDLookupDefault").value == "") {
                            if (TblDLookup.rows(j).cells(0).firstChild.checked)
                                document.getElementById(MasterObj + "txtDLookupDefault").value = TblDLookup.rows(j).ID;
                            j++;
                        }
                        document.getElementById(MasterObj + "txtSubmit").value = "SaveDLookup";
                        document.getElementById(MasterObj + "BtnSubmit").click();
                    }
                }
                //----------------------------------------------------------------ذخیره نوع فيلد خارجي
                else if (document.getElementById(MasterObj + "CmbTypeBase").value == 2) {
                    if (CheckDataValidate(2)) {
                        document.getElementById(MasterObj + "txtSubmit").value = "SaveType2";
                        document.getElementById(MasterObj + "BtnSubmit").click();
                    }
                }
                //----------------------------------------------------------------ذخیره نوع شي جدید
                else if (document.getElementById(MasterObj + "CmbTypeBase").value == 3) {
                    if (CheckDataValidate(3)) {

                        var Str = "<Root>";
                        for (var i = 0; i < TblSeveral.rows.length; i++) {
                            if (TblSeveral.rows(i).Type == 0) {
                                Str = Str + "<Data>";
                                Str = Str + "<name>" + TblSeveral.rows(i).cells(1).innerText + "</name>";
                                Str = Str + "<Type>" + TblSeveral.rows(i).DataType + "</Type>";
                                Str = Str + "<Default>" + TblSeveral.rows(i).cells(7).innerText + "</Default>";
                                Str = Str + "<ISRequire>" + TblSeveral.rows(i).ISRequire + "</ISRequire>";
                                Str = Str + "<ISAttribute>" + TblSeveral.rows(i).ISAttribute + "</ISAttribute>";
                                Str = Str + "<Caption>" + TblSeveral.rows(i).cells(5).innerText + "</Caption>";
                                Str = Str + "<Descr>" + TblSeveral.rows(i).cells(9).innerText + "</Descr>";
                                Str = Str + "</Data>";
                            }
                            else if (TblSeveral.rows(i).Type == 1) {
                                Str = Str + "<Data>";
                                Str = Str + "<name>" + TblSeveral.rows(i).cells(1).innerText + "</name>";
                                Str = Str + "<Type>" + TblSeveral.rows(i).DataType + "</Type>";
                                Str = Str + "<Default>" + TblSeveral.rows(i).Default + "</Default>";
                                Str = Str + "<DLookup>" + TblSeveral.rows(i).DLookup + "</DLookup>";
                                Str = Str + "<ISRequire>" + TblSeveral.rows(i).ISRequire + "</ISRequire>";
                                Str = Str + "<ISAttribute>" + TblSeveral.rows(i).ISAttribute + "</ISAttribute>";
                                Str = Str + "<Caption>" + TblSeveral.rows(i).cells(5).innerText + "</Caption>";
                                Str = Str + "<Descr>" + TblSeveral.rows(i).cells(9).innerText + "</Descr>";
                                Str = Str + "</Data>";
                            }
                            else if (TblSeveral.rows(i).Type == 2) {
                                Str = Str + "<Data>";
                                Str = Str + "<name>" + TblSeveral.rows(i).cells(1).innerText + "</name>";
                                Str = Str + "<Type>" + TblSeveral.rows(i).DataType + "</Type>";
                                Str = Str + "<Default></Default>";
                                Str = Str + "<DLookup>0</DLookup>";
                                Str = Str + "<ISRequire>" + TblSeveral.rows(i).ISRequire + "</ISRequire>";
                                Str = Str + "<ISAttribute>" + TblSeveral.rows(i).ISAttribute + "</ISAttribute>";
                                Str = Str + "<SelectValues>" + TblSeveral.rows(i).cells(8).innerText + "</SelectValues>";
                                Str = Str + "<Caption>" + TblSeveral.rows(i).cells(5).innerText + "</Caption>";
                                Str = Str + "<Descr>" + TblSeveral.rows(i).cells(9).innerText + "</Descr>";
                                Str = Str + "</Data>";
                            }
                        }
                        Str = Str + "</Root>";
                        document.getElementById(MasterObj + "txtXmlSave").value = Str;
                        document.getElementById(MasterObj + "txtSubmit").value = "Type3";
                        document.getElementById(MasterObj + "BtnSubmit").click();

                    }
                }
            }
            else alert("لطفا نام شِما را انتخاب کنيد")

        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function onchangeCmbTypeBase() {
            if (document.getElementById(MasterObj + "CmbTypeBase").value == 0) {
                TblSimpleField.style.display = "inline";
                TblMultiValue.style.display = "none";
                TblSeveralValue.style.display = "none";
                TblOwnField.style.display = "none";
                onchangeCmbType(0);
                onchangeCmbType(1);
                if (document.getElementById(MasterObj + "txtMode").value != "Edit")
                    ClearType0();
            } else if (document.getElementById(MasterObj + "CmbTypeBase").value == 1) {
                TblOwnField.style.display = "none";
                TblSimpleField.style.display = "none";
                TblSeveralValue.style.display = "none";
                TblMultiValue.style.display = "inline";
                if (document.getElementById(MasterObj + "txtMode").value != "Edit")
                    ClearType1();
            }
            else if (document.getElementById(MasterObj + "CmbTypeBase").value == 2) {
                TblOwnField.style.display = "inline";
                TblSimpleField.style.display = "none";
                TblSeveralValue.style.display = "none";
                TblMultiValue.style.display = "none";
                if (document.getElementById(MasterObj + "txtMode").value != "Edit")
                    ClearType2();
            }
            else if (document.getElementById(MasterObj + "CmbTypeBase").value == 3) {
                TblOwnField.style.display = "none";
                TblSimpleField.style.display = "none";
                TblMultiValue.style.display = "none";
                TblSeveralValue.style.display = "inline";
                if (document.getElementById(MasterObj + "txtMode").value != "Edit")
                    ClearType3();
            }
        }
        //======================================================================
        function onchangeCmbBasicInfo(Sign) {
            if (Sign == 1) {
                if (document.getElementById(MasterObj + "CmbBasicInfo").value != "0") {
                    document.getElementById(MasterObj + "txtSubmit").value = "DLookup";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
                else {
                    $get(MasterObj + "txtBasicInfo").value = "";
                    CreateGrid();
                }
            }
            else {
                if (document.getElementById(MasterObj + "CmbSeveralBasic").value != "0") {
                    document.getElementById(MasterObj + "txtSubmit").value = "DLookupBind";
                    document.getElementById(MasterObj + "BtnSubmit").click();
                }
                else {
                    alert(document.getElementById(MasterObj + "CmbDLookup").text);
                }
            }
        }
        //=====================================================================
        function onclickImgDown() {
            if (CheckName(document.getElementById("txtSimpleName").value)) {
                if (document.getElementById("txtSimpleName").value != ""
                && document.getElementById("txtCaptionSimple").value != "") {
                    AddRowToGrid(0);
                    document.getElementById(MasterObj + "CmbTypeSeveral1").selectedIndex = 0;
                    document.getElementById("txtSimpleName").value = ""
                    document.getElementById("txtCaptionSimple").value = "";
                    document.getElementById("txtSimpleDefault").value = "";
                    document.getElementById("ChkSimplerequire").checked = false;
                    document.getElementById("ChkSimpleHide").checked = false;
                    document.getElementById("txtSimpleDescr").value = "";

                }
            }
            else {
                alert("نام فيلد تکراريست");
            }

        }
        //======================================================================
        function AddRowToGrid(Sign) {

            var Orow = TblSeveral.insertRow();
            Orow.setAttribute("Type", Sign);
            Orow.className = "CssItemStyle";
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.insertCell();
            Orow.cells(10).innerHTML = "<img src='../../../App_Utility/Images/Icons/DelIcon.gif' onclick='onclickDelete(this)' />";
            if (Sign == 1) {
                Orow.cells(0).innerText = "فيلد چند مقداري";
                Orow.cells(1).innerText = document.getElementById("txtSeveralName").value
                Orow.cells(2).innerText = document.getElementById(MasterObj + "CmbTypeSeveral2")[document.getElementById(MasterObj + "CmbTypeSeveral2").selectedIndex].text;
                Orow.cells(3).innerHTML = document.getElementById("ChkSeveralRequire").checked ? "<img src='../../../App_Utility/Images/Icons/BlueTick.gif'/>" : "<img src='../../../App_Utility/Images/Icons/Cross.gif'/>";
                Orow.cells(4).innerHTML = document.getElementById("ChkSeveralHide").checked ? "<img src='../../../App_Utility/Images/Icons/BlueTick.gif'/>" : "<img src='../../../App_Utility/Images/Icons/Cross.gif'/>";
                Orow.cells(5).innerText = document.getElementById("txtSeveralCaption").value;
                Orow.cells(6).innerText = document.getElementById(MasterObj + "CmbSeveralBasic")[document.getElementById(MasterObj + "CmbSeveralBasic").selectedIndex].text;
                Orow.cells(7).innerText = document.getElementById(MasterObj + "CmbDLookup")[document.getElementById(MasterObj + "CmbDLookup").selectedIndex].text;
                Orow.cells(9).innerText = document.getElementById("txtSeveralDescr").value;
                Orow.setAttribute("DataType", document.getElementById(MasterObj + "CmbTypeSeveral2").value);
                Orow.setAttribute("DLookup", document.getElementById(MasterObj + "CmbSeveralBasic").value);
                Orow.setAttribute("Default", document.getElementById(MasterObj + "CmbDLookup").value);
                Orow.setAttribute("ISRequire", document.getElementById("ChkSeveralRequire").checked ? 1 : 0);
                Orow.setAttribute("ISAttribute", document.getElementById("ChkSeveralHide").checked ? 1 : 0);
            }
            else if (Sign == 0) {
                Orow.cells(0).innerText = "فيلد ساده";
                Orow.cells(1).innerText = document.getElementById("txtSimpleName").value
                Orow.cells(2).innerText = document.getElementById(MasterObj + "CmbTypeSeveral1")[document.getElementById(MasterObj + "CmbTypeSeveral1").selectedIndex].text;
                Orow.cells(3).innerHTML = document.getElementById("ChkSimplerequire").checked ? "<img src='../../../App_Utility/Images/Icons/BlueTick.gif'/>" : "<img src='../../../App_Utility/Images/Icons/Cross.gif'/>";
                Orow.cells(4).innerHTML = document.getElementById("ChkSimpleHide").checked ? "<img src='../../../App_Utility/Images/Icons/BlueTick.gif'/>" : "<img src='../../../App_Utility/Images/Icons/Cross.gif'/>";
                Orow.cells(5).innerText = document.getElementById("txtCaptionSimple").value;
                Orow.cells(7).innerText = document.getElementById("txtSimpleDefault").value;
                Orow.cells(9).innerText = document.getElementById("txtSimpleDescr").value;
                Orow.setAttribute("DataType", document.getElementById(MasterObj + "CmbTypeSeveral1").value);
                Orow.setAttribute("ISRequire", document.getElementById("ChkSimplerequire").checked ? 1 : 0);
                Orow.setAttribute("ISAttribute", document.getElementById("ChkSimpleHide").checked ? 1 : 0);
            }
            else {

                Orow.cells(0).innerText = "فيلد خارجي";
                Orow.cells(1).innerText = document.getElementById("txtOwnName").value
                Orow.cells(2).innerText = document.getElementById(MasterObj + "CmbOwnType")[document.getElementById(MasterObj + "CmbOwnType").selectedIndex].text;
                Orow.cells(3).innerHTML = document.getElementById("ChkOwnRequire").checked ? "<img src='../../../App_Utility/Images/Icons/BlueTick.gif'/>" : "<img src='../../../App_Utility/Images/Icons/Cross.gif'/>";

                Orow.cells(4).innerHTML = document.getElementById("ChkOwnHide").checked ? "<img src='../../../App_Utility/Images/Icons/BlueTick.gif'/>" : "<img src='../../../App_Utility/Images/Icons/Cross.gif'/>";
                Orow.cells(5).innerText = document.getElementById("txtOwnCaption").value;
                Orow.cells(8).innerText = document.getElementById(MasterObj + "CmbOwnSourceTable")[document.getElementById(MasterObj + "CmbOwnSourceTable").selectedIndex].text + "." + document.getElementById(MasterObj + "CmbOwnFieldsName")[document.getElementById(MasterObj + "CmbOwnFieldsName").selectedIndex].text + "." + document.getElementById(MasterObj + "CmbSaveFieldsName")[document.getElementById(MasterObj + "CmbSaveFieldsName").selectedIndex].text;

                Orow.cells(9).innerText = document.getElementById("txtOwnDesc").value;
                Orow.setAttribute("DataType", document.getElementById(MasterObj + "CmbOwnType").value);
                Orow.setAttribute("ISRequire", document.getElementById("ChkOwnRequire").checked ? 1 : 0);
                Orow.setAttribute("ISAttribute", document.getElementById("ChkOwnHide").checked ? 1 : 0);
            }
            Orow.cells(0).style.width = "90px";
            Orow.cells(1).style.width = "90px";
            Orow.cells(2).style.width = "90px";
            Orow.cells(3).style.width = "30px";
            Orow.cells(4).style.width = "30px";
            Orow.cells(5).style.width = "90px";
            Orow.cells(6).style.width = "90px";
            Orow.cells(7).style.width = "90px";
            Orow.cells(8).style.width = "100px";
            Orow.cells(9).style.width = "100px";
            Orow.cells(10).style.width = "30px";
        }
        //==============================================================
        function onclickEdit(obj) {
        }
        //==============================================================
        function onclickDelete(obj) {
            if (confirm("آيا براي حذف مطمئن هستيد؟"))
                TblSeveral.deleteRow(obj.parentElement.parentElement.rowIndex);
        }
        //===============================================================
        function CheckName(Name) {
            var i = 0, Flag = true;
            while (i < TblSeveral.rows.length && Flag) {
                if (TblSeveral.rows(i).cells(1).innerText.trim() == Name.trim()) {
                    Flag = false;
                }
                i++;
            }
            return Flag;
        }
        //===================================================================
        function onclickImgDownSeveral() {
            if (CheckName(document.getElementById("txtSeveralName").value)) {
                if (document.getElementById("txtSeveralName").value != ""
                && document.getElementById("txtSeveralCaption").value != "") {
                    AddRowToGrid(1);
                    document.getElementById(MasterObj + "CmbTypeSeveral2").selectedIndex = 0;
                    document.getElementById("txtSeveralName").value = ""
                    document.getElementById("txtSeveralCaption").value = "";
                    document.getElementById("ChkSeveralRequire").checked = false;
                    document.getElementById("ChkSeveralHide").checked = false;
                    document.getElementById("txtSeveralDescr").value = "";
                    document.getElementById(MasterObj + "CmbSeveralBasic").selectedIndex = 0;
                    document.getElementById(MasterObj + "CmbDLookup").selectedIndex = 0;
                }
            }
            else {
                alert("نام فيلد تکراريست");
            }

        }
        //================================================================
        function onchangeCmbSourceTable(Sign) {
            if (Sign == 0)
                document.getElementById(MasterObj + "txtSubmit").value = "GetFields";
            else document.getElementById(MasterObj + "txtSubmit").value = "GetFieldsOwn";
            document.getElementById(MasterObj + "BtnSubmitNew").click();
        }
        //================================================================
        function onclickImgDownOwn() {
            if (CheckName(document.getElementById("txtOwnName").value)) {
                if (document.getElementById("txtOwnName").value != ""
                && document.getElementById("txtOwnCaption").value != "") {
                    AddRowToGrid(2);
                    document.getElementById(MasterObj + "CmbOwnSourceTable").selectedIndex = 0;
                    document.getElementById(MasterObj + "CmbOwnFieldsName").selectedIndex = 0;
                    document.getElementById(MasterObj + "CmbOwnType").selectedIndex = 0;
                    document.getElementById("txtOwnName").value = ""
                    document.getElementById("txtOwnCaption").value = "";
                    document.getElementById("ChkOwnRequire").checked = false;
                    document.getElementById("ChkOwnHide").checked = false;
                    document.getElementById("txtOwnDesc").value = "";
                }
            }
            else {
                alert("نام فيلد تکراريست");
            }
        }
        //===============================================================
        function onchangeCmbType(Sign) {
            if (Sign == 0) {
                if (document.getElementById(MasterObj + "CmbType")[document.getElementById(MasterObj + "CmbType").selectedIndex].text == 'عدد' || document.getElementById(MasterObj + "CmbType")[document.getElementById(MasterObj + "CmbType").selectedIndex].text == 'عدد با طول زياد') {
                    if (!CheckValidData(document.getElementById(MasterObj + "txtDefault")))
                        document.getElementById(MasterObj + "txtDefault").value = "";
                    document.getElementById(MasterObj + "txtDefault").attachEvent("onkeydown", OnKeyDownInt);
                }
                else
                    document.getElementById(MasterObj + "txtDefault").detachEvent("onkeydown", OnKeyDownInt);
            }
            else {
                if (document.getElementById(MasterObj + "CmbTypeSeveral1")[document.getElementById(MasterObj + "CmbTypeSeveral1").selectedIndex].text == 'عدد' || document.getElementById(MasterObj + "CmbTypeSeveral1")[document.getElementById(MasterObj + "CmbTypeSeveral1").selectedIndex].text == 'عدد با طول زياد') {
                    if (!CheckValidData(document.getElementById("txtSimpleDefault")))
                        document.getElementById("txtSimpleDefault").value = "";
                    document.getElementById("txtSimpleDefault").attachEvent("onkeydown", OnKeyDownInt);
                }
                else
                    document.getElementById("txtSimpleDefault").detachEvent("onkeydown", OnKeyDownInt);
            }
        }
        //===============================================================
        function ClearType0() {
            document.getElementById(MasterObj + "CmbType").selectedIndex = 0;
            document.getElementById(MasterObj + "txtName").value = ""
            document.getElementById(MasterObj + "txtCaption").value = "";
            document.getElementById(MasterObj + "txtDefault").value = "";
            document.getElementById(MasterObj + "RDRequire").checked = false;
            document.getElementById(MasterObj + "RDAttribute").checked = false;
            document.getElementById(MasterObj + "txtDesc").value = "";
        }
        //=================================================================
        function ClearType1() {
            document.getElementById(MasterObj + "CmbTypeMulti").selectedIndex = 0;
            document.getElementById(MasterObj + "txtDLookupName").value = ""
            document.getElementById(MasterObj + "txtCaptionMulti").value = "";
            document.getElementById(MasterObj + "ChkRequire").checked = false;
            document.getElementById(MasterObj + "ChkHide").checked = false;
            document.getElementById(MasterObj + "txtDescMulti").value = "";
            document.getElementById(MasterObj + "CmbBasicInfo").selectedIndex = 0;
            var i = 0
            while (i < TblDLookup.rows.length) {
                TblDLookup.deleteRow(i);
            }
        }
        //=============================================================
        function ClearType2() {
            document.getElementById(MasterObj + "CmbSourceTable").selectedIndex = 0;
            document.getElementById(MasterObj + "CmbFieldName").selectedIndex = 0;
            document.getElementById(MasterObj + "CmbTypeField").selectedIndex = 0;
            document.getElementById(MasterObj + "txtOtherField").value = ""
            document.getElementById(MasterObj + "txtFieldCaption").value = "";
            document.getElementById(MasterObj + "ChkFieldRequire").checked = false;
            document.getElementById(MasterObj + "ChkFieldHide").checked = false;
            document.getElementById(MasterObj + "txtFieldDescr").value = "";
        }
        //=================================================================
        function ClearType3() {
            document.getElementById(MasterObj + "txtNewName").value = ""

            //----------------------------------------------
            document.getElementById(MasterObj + "CmbOwnSourceTable").selectedIndex = 0;
            document.getElementById(MasterObj + "CmbOwnFieldsName").selectedIndex = 0;
            document.getElementById(MasterObj + "CmbOwnType").selectedIndex = 0;
            document.getElementById("txtOwnName").value = ""
            document.getElementById("txtOwnCaption").value = "";
            document.getElementById("ChkOwnRequire").checked = false;
            document.getElementById("ChkOwnHide").checked = false;
            document.getElementById("txtOwnDesc").value = "";
            //------------------------------------------------------------
            document.getElementById(MasterObj + "CmbTypeSeveral2").selectedIndex = 0;
            document.getElementById("txtSeveralName").value = ""
            document.getElementById("txtSeveralCaption").value = "";
            document.getElementById("ChkSeveralRequire").checked = false;
            document.getElementById("ChkSeveralHide").checked = false;
            document.getElementById("txtSeveralDescr").value = "";
            document.getElementById(MasterObj + "CmbSeveralBasic").selectedIndex = 0;
            document.getElementById(MasterObj + "CmbDLookup").selectedIndex = 0;
            //---------------------------------------------------------------
            document.getElementById(MasterObj + "CmbTypeSeveral1").selectedIndex = 0;
            document.getElementById("txtSimpleName").value = ""
            document.getElementById("txtCaptionSimple").value = "";
            document.getElementById("txtSimpleDefault").value = "";
            document.getElementById("ChkSimplerequire").checked = false;
            document.getElementById("ChkSimpleHide").checked = false;
            document.getElementById("txtSimpleDescr").value = "";
            //-----------------------------------------------------------------
            var i = 0
            while (i < TblSeveral.rows.length) {
                TblSeveral.deleteRow(i);
            }
        }
        //============================================================
        function OnKeyDownInt() {
            var key = window.event.keyCode
            window.event.returnValue =
		(
			((key >= 96) && (key <= 105)) ||
			((key >= 48) && (key <= 57)) ||
			(key == 8) || (key == 9) || (key == 46) ||
			((key >= 35) && (key <= 40))
		)
        }
        //=============================================================
        function CheckValidData(Obj) {
            var Val = new Array;
            for (var i = 0; i < Obj.value.length; i++) {
                Val[i] = Obj.value.substr(i, 1);
            }
            var flag = true;
            var j = 0;
            while (j < Val.length && flag) {
                var key = Val[j];
                if (!(
            (key >= 96 && key <= 105) || (key >= 48 && key <= 57) || (key == 8) || (key == 9) || (key == 46) ||
			(key >= 35 && key <= 40)
			))
                    flag = false;

                j++
            }
            return flag;
        }
        //======================================
        function KeyDownEng(field, e) {
            var Key = e.keyCode;
            if (Key != 46 && Key != 8)
                window.event.returnValue = null;
            if (Key != 16 && Key != 18 && Key != 46 && Key != 8) {
                if ((Key <= 57 && Key >= 48) ||
                    (Key <= 90 && Key >= 65))
                    field.value += (String.fromCharCode(Key).toString());
                else if ((Key <= 40 && Key >= 37) || (Key <= 105 && Key >= 96))
                    window.event.returnValue = Key;
            }
        }
        //--------------------------------------------------------------------
        
</script>
</asp:Content>
