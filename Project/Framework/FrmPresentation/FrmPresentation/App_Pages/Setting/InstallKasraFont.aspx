<%@ Page Title="نصب فونت" Language="C#" ValidateRequest="false" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="InstallKasraFont.aspx.cs" Inherits="FrmPresentation.App_Pages.Setting.InstallKasraFont" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>
    <table>
    <tr><td style="height:20px"></td></tr>
        <tr>
            <td>
                <fieldset dir="rtl" style="width: 350px; height: 120px; border-right: lightblue thin inset;
                    border-top: #78BED6 thin solid; border-left: #78BED6 thin outset; border-bottom: #78BED6 thin solid;"
                    align="right">
                    <legend style="color: #78BED6">نصب فونت</legend>
                   
                                <table>
                                    <tr>
                                        <td >
                                           <div onclick="Confirm()" id="dd" 
        style="text-decoration: underline; color:#3A77BA; cursor: pointer;height:25">
                                               نصب در فولدر
                                                فونت</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td >
                                        <iframe src="frameDownLoad.aspx" frameborder="0" height="25" width="150" ></iframe>
                                           
                                        </td>
                                    </tr>
                                    <tr>
            <td>
                <div >
                    <asp:HyperLink ID="DownloadRar" style="text-decoration: underline; color:#3A77BA; cursor: pointer;" runat="server" NavigateUrl="http://www.rarlab.com/download.htm">دانلودWinRar</asp:HyperLink></div>
            </td>
        </tr>
                                </table>
                            
                </fieldset>
            </td>
        </tr>
        
       
    </table>
    <div style="display:none">
     <%--<asp:Button ID="BtnConfirm" runat="server" Text="Button" OnClick="BtnConfirm_Click" />--%>
    <%--<input type="text" id="txtCurrentPath" runat="server"/>--%>
     <asp:Button ID="BtnConfirm" runat="server" onclick="Btn_Click"/>
    </div>
    <script language="javascript" type="text/javascript">
        document.body.scroll = "no";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
//        window.name = "InstallKasraFont.aspx";
        // aspnetForm.target = window.name;
       // ------------------------------------------------------
        function Confirm() {
               /* var fso, s, e, x;
                var destination
                fso = new ActiveXObject("Scripting.FileSystemObject");

                var Fdir = fso.GetFolder(document.getElementById(MasterObj + "txtCurrentPath").value + "/App_Utility/Font")
                e = new Enumerator(Fdir.files);
                s = '';
                var strpath = document.getElementById(MasterObj + "txtPath").value
                //        var strlenght = strpath.length;
                //        var name = strpath.split("\\")[1];
                try {
                do {
                    x = e.item();
                    s = x.name
                    if (document.getElementById(MasterObj + "rdSystemF").checked == true) {
                        var wshshell = new ActiveXObject("wscript.shell");
                        destination = wshshell.specialFolders.item(8)
                    }
                    else {
                        if (fso.FolderExists(strpath))
                            destination = strpath
                        else {
                            alert("مسير مورد نظر وجود ندارد")
                            document.getElementById(MasterObj + "txtPath").focus()
                            return;
                        }
                    }
                    fso.CopyFile(x.Path, destination + "\\" + s, 1);
                    e.moveNext();
                }
                while (!e.atEnd());
            }
            catch (e) {
            alert("اجازه ذخيره در فولدر فونت ویندوز را نداريد")
            }*/
            //--------------------------------------------------------
//            if (document.getElementById(MasterObj + "rdSystemF").checked == true) 
                parent.location = '/FrmPresentation/App_Utility/Font/InstallKasraFont.exe'
//            else
//                document.getElementById(MasterObj + "BtnConfirm").click()
            }
       </script>
</asp:Content>
