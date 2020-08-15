<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="RequestConfig.aspx.cs" Inherits="TAPresentation.App_Pages.DataEntry.TouchPages.RequestConfig"
    ValidateRequest="false" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="border: 1px ridge #000000; width:80%; height:80%">
    <div style="height: 300px; ">
        <table id="TblConfig">
            <thead>
                <tr>
                    <td class="CssHeaderStyle" align="center" style="width: 100px">
                        کد
                    </td>
                    <td class="CssHeaderStyle" align="center" style="width: 200px">
                        عنوان
                    </td>
                    <td class="CssHeaderStyle" align="center" style="width: 100px">
                        نوع
                    </td>
                    <td class="CssHeaderStyle" align="center" style="width: 100px">
                        کدهای نمایشي
                    </td>
                </tr>
            </thead>
        </table>
    </div>
    <hr />
    <div id="DivCode" requestid="0" style="height: 200px">
        <table>
            <tr>
                <td>
                    کد درخواست:
                </td>
                <td>
                    <select id="cmbCode" runat="server" style="width: 200px" class="TxtControls">
                    </select>
                </td>
                <td>
                    نوع:
                </td>
                <td>
                    روزانه
                    <input type="radio" id="rdDaily" name="RdType" />&nbsp; ساعتی
                    <input type="radio" id="rdTimely" name="RdType" />
                </td>
                <td>
                    عنوان درخواست:
                </td>
                <td>
                    <textarea id="txtTitle" rows="1" cols="30"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <fieldset style="text-align: center">
                        <legend>کدهای نمايشی</legend>
                        <table>
                            <tr>
                                <td class="CssHeaderStyle">
                                    کد نمایشي
                                </td>
                                <td class="CssHeaderStyle">
                                    نام نمايشي
                                </td>
                                <td class="CssHeaderStyle">
                                    فرمت نمايش
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <select id="cmbFCode" style="width: 200px" class="TxtControls">
                                    </select>
                                </td>
                                <td>
                                    <input id="txtFCodeName" type="text" style="width: 200px" />
                                </td>
                                <td>
                                    <select id="CmbFFormat" style="width: 80px" class="TxtControls">
                                        <option value="M">دقيقه</option>
                                        <option value="H:M">ساعتي</option>
                                        <option value="D,H:M">روز و ساعت</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <select id="cmbSCode" style="width: 200px" class="TxtControls">
                                    </select>
                                </td>
                                <td>
                                    <input id="txtSCodeName" type="text" style="width: 200px" />
                                </td>
                                <td>
                                    <select id="CmbSFormat" style="width: 80px" class="TxtControls">
                                        <option value="M">دقيقه</option>
                                        <option value="H:M">ساعتي</option>
                                        <option value="D,H:M">روز و ساعت</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <input type="button" id="BtnSave" class="CssHeaderStyle" style="width: 100px" value="ذخيره" />
                        <input type="button" id="BtnDelete" class="CssHeaderStyle" style="width: 100px" value="حذف" />
                        <input type="button" id="BtnCreate" class="CssHeaderStyle" style="width: 100px" value="ايجاد" />
                    </fieldset>
                </td>
            </tr>
        </table>
    </div>
    </div>
    <input type="hidden" id="txtPageID" runat="server" />
    <input type="hidden" id="txtCompanyID" runat="server" />
    <input type="hidden" id="txtSessionID" runat="server" />
    <input type="hidden" id="txtRowInfo" runat="server" />
    <input type="hidden" id="txtData" runat="server" />
    <cc1:MySecurity ID="OnLineUser" runat="server" Visible="false">
    </cc1:MySecurity>
    <script src="../../../App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>
    <script src="../../../App_Utility/Scripts/DataEntry/TouchPages/RequestConfig.js" type="text/javascript"></script>
</asp:Content>
