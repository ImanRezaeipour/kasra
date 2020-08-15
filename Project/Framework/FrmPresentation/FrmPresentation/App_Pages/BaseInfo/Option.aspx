<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="Option.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.Option" ValidateRequest="false"%>
<%@ Register src="../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 75%;
        }
        .RedCss
        {
            color:Red;
        }
        .BlackCss
        {
            color:Black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
    <table><tr style="height:10px">
    <td></td>
    </tr></table>
    <table id="TBL01" class="style1" runat="server" >
    
        <tr>
            <td>                
                <table >
                
                    <tr>
                        <td>
                            مقدار:
                        </td>
                        <td>
                            <input id="txtValue" type="text" align="right" class="TxtControls" />
                        </td>
                        <td align="right">
                            شرح:
                        </td>
                        <td>
                            <input id="txtDesc" type="text" align="right" />
                        </td> 
                         <td align="right">
                           نام سيستم:
                        </td>
                        <td>
                            <select id="CmbSystem" class="TxtControls" runat="server" style="width:150PX">
                                <option></option>
                            </select>                            
                        </td>                                            
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                         <div style="scrollbar-highlight-color: white; overflow: auto; width: 100%; scrollbar-arrow-color: black;
                            scrollbar-base-color: #b0c4de; height: 480px;">
                        <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />                                            
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
    <cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity>
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
            runat="server" />
        <input type="text"  id="txtSubmit" name="txtSubmit" runat="server" />
        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
        <input type="text" id="txtOnlineUser" name="txtOnlineUser" runat="server" />
        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
            runat="server" />
        <input type="text" id="Text1" enableviewstate="true" name="txtSortExpression" runat="server" />
        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />  
        <!-------------------------------------------------------------------------->
        <input type="text" id="txtTempValue" name="txtTempValue" runat="server" />  
        <input type="text" id="txtTempDesc" name="txtTempDesc" runat="server" /> 
        <input type="text" id="txtOptionID" name="txtOptionID" runat="server" /> 
        <input type="text" id="txtTempSystem" name="txtTempSystem" runat="server" /> 
         <input type="text" id="txtEditID" name="txtEditID" runat="server" /> 
         <input type="text" id="txtArray" name="txtArray" runat="server" /> 
         <input type="text" id="txtXmlSave" name="txtXmlSave" runat="server" /> 
         <input type="text" id="txtArrayValue" name="txtArrayValue" runat="server" /> 
        <a href="../../App_Utility/Images/Icons/btnSubNodes.gif" id="Url"></a>    
     </div>
    <script type="text/javascript" language="javascript">
        //*************************************Declaration*************************************
        var str = "<Root></Root>";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var PersonCode = "0";
        var LastSelectedRow = null
        var LastSelectedRowClass = "";

       
    //=====================================================        
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    //========================================================
    document.getElementById(MasterObj+ "txtArrayValue").value = "";
    var Ogrid = document.getElementById("GrdOption");
    var VALUEArray = new Array();       
    var Counter = 0;  
    if (Ogrid != null) {
        for (var i = 1; i < Ogrid.rows.length; ++i) {
            document.getElementById(MasterObj + "txtArrayValue").value += Ogrid.rows[i].cells[4].firstChild.value + ",";
            if (Ogrid.rows[i].OPID != 0)
                Ogrid.rows[i].style.display = "none";                
            else {
                Counter++;
                //Ogrid.rows[i].cells[4].firstChild.style.visibility = "hidden";          
                Ogrid.rows[i].style.display = "inline";                  
            }
        }
    }     
    //==============================================    
        for (var j = 0; j < Counter; j++) {
            VALUEArray[j] = 0;
        }    
        document.getElementById(MasterObj + "txtArray").value = VALUEArray;
        
    //========================================
        function OnClickImg(Obj) {
        var Counter1=0;
        var Url = document.getElementById("Url").href;
        var Ogrid = document.getElementById("GrdOption");  
        var CAIDval = Obj.parentElement.parentElement.CAID;        
        if (Obj.src == Url) {
            Obj.src = "../../App_Utility/Images/Icons/btnNodes.gif";
            for (var i = 0; i < Ogrid.rows.length; i++) {
                if (Ogrid.rows[i].OPID == 0 && Ogrid.rows(i).CAID <= CAIDval) {
                    Counter1++;
                }
                if (Ogrid.rows(i).CAID == CAIDval && Ogrid.rows(i).OPID != 0) {                   
                    Ogrid.rows(i).style.display = "inline";
                }
            }
            VALUEArray[Counter1 - 1] = 1;
        }
        else
        {
            Obj.src = Url;
            for (var i = 0; i < Ogrid.rows.length; i++) {
                if (Ogrid.rows[i].OPID == 0 && Ogrid.rows(i).CAID <= CAIDval) {
                    Counter1++;
                } 
                if (Ogrid.rows[i].CAID == CAIDval && Ogrid.rows[i].OPID != 0)                  
                Ogrid.rows[i].style.display = "none";
        }
        VALUEArray[Counter1 - 1] = 0;
    }
    document.getElementById(MasterObj + "txtArray").value = VALUEArray;
    }
    //================================================
    function BeginRequestHandler(sender, args) {
        
    }
    function EndRequestHandler(sender, args) {
        
        if (LastSelectedRow != null) {
            LastSelectedRow.className = LastSelectedRowClass;
            LastSelectedRow = null;
        }
        var StrVal = $get(MasterObj + "txtSubmit").value
        if (StrVal != "") {            
               if(StrVal=="Save")
               {
                   SetMsg($get(MasterObj + "txtAlert").value);
                   $get(MasterObj + "txtAlert").value = ""; 
               }
           }        
        document.getElementById(MasterObj + "txtSubmit").value = "";
        var Ogrid = document.getElementById("GrdOption");

        if (Ogrid != null) {
            for (var i = 1; i < Ogrid.rows.length; ++i) {
                if (Ogrid.rows[i].OPID != 0)
                    Ogrid.rows[i].style.display = "none";
                else {
                    Ogrid.rows[i].style.display = "inline";
                }
            }
            var Counter2 = 0;
            document.getElementById(MasterObj + "txtArrayValue").value = "";

            for (var i = 1; i < Ogrid.rows.length; ++i) {
                document.getElementById(MasterObj + "txtArrayValue").value += Ogrid.rows[i].cells[4].firstChild.value + ",";
            }

            if (StrVal == "Save")
                for (var i = 1; i < Ogrid.rows.length; ++i) {
                if (Ogrid.rows[i].OPID == 0) {
                    Counter2++;
                    if (document.getElementById(MasterObj + "txtArray").value.split(",")[Counter2 - 1] == "1")
                        OnClickImg(Ogrid.rows[i].cells[0].firstChild);
                }
            }
            else
                for (var j = 0; j < Counter; j++) {
                VALUEArray[j] = 0;
            }
        }
       document.getElementById(MasterObj + "txtArray").value = VALUEArray;                   
    }
    //==============================================================================    
    function OnClickGrd(SelectedRow) {
        if (SelectedRow.OPID != "0") {
            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
            document.getElementById(MasterObj + "txtOptionID").value = LastSelectedRow.OPID;
        }
    }
    //=====================================
//    function OndbClickGrd(Obj) {
//        OnClickBtnEdit();
//    }
    //==================================
    function onblurtextBox(Obj) {
        var index = Obj.parentElement.parentElement.rowIndex;
        //alert(document.getElementById(MasterObj + "txtArrayValue").value.split(",")[index - 1])
        if (Obj.value != document.getElementById(MasterObj + "txtArrayValue").value.split(",")[index - 1])
            Obj.className = "RedCss";
        else Obj.className = "BlackCss";     
    }
    //======================================
    function OnClickBtnFilter() {   
        document.getElementById(MasterObj + "txtTempValue").value = document.getElementById("txtValue").value;
        document.getElementById(MasterObj + "txtTempDesc").value = document.getElementById("txtDesc").value;
        document.getElementById(MasterObj + "txtTempSystem").value = (document.getElementById(MasterObj + "CmbSystem").value == "1" ? document.getElementById(MasterObj + "CmbSystem").value + "1" : document.getElementById(MasterObj + "CmbSystem").value);        
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }   
    //===============================
//    function OnClickBtnEdit() {    
//        if (LastSelectedRow != null) {
//            document.getElementById(MasterObj + "txtEditID").value = document.getElementById(MasterObj + "txtOptionID").value;
//            document.getElementById("txtEditVariable").disabled = false;
//            if (LastSelectedRow.cells(4).firstChild.title != "")
//                document.getElementById(MasterObj + "txtEditValue").value = LastSelectedRow.cells(4).firstChild.title;
//            else document.getElementById(MasterObj + "txtEditValue").value = LastSelectedRow.cells(4).firstChild.innerText;
//            if (LastSelectedRow.cells(2).firstChild.title != "")
//                document.getElementById("txtEditVariable").value = LastSelectedRow.cells(2).firstChild.title;
//            else document.getElementById("txtEditVariable").value = LastSelectedRow.cells(2).firstChild.innerText;
//            document.getElementById("txtEditVariable").disabled = true;
//        }
//        else alert("يک سطر را انتخاب کنيد");
//       
//    }    
    //========================
    function OnClickBtnShowAll() {
        document.getElementById("txtValue").value = "";
        document.getElementById("txtDesc").value = "";
        document.getElementById(MasterObj + "CmbSystem").value = "0";
        document.getElementById(MasterObj + "txtTempValue").value = document.getElementById("txtValue").value;
        document.getElementById(MasterObj + "txtTempDesc").value = document.getElementById("txtDesc").value;
        document.getElementById(MasterObj + "txtTempSystem").value = document.getElementById(MasterObj + "CmbSystem").value
        document.getElementById(MasterObj + "txtSubmit").value = "Filter";
        document.getElementById(MasterObj + "BtnSubmit").click();
    }
    //============================
    function OnClickBtnSave() {
        document.getElementById(MasterObj + "txtXmlSave").value = "<Root>";
        var str="";
        var Ogrid = document.getElementById("GrdOption");        
        for (var i = 1; i < Ogrid.rows.length; ++i) {
            if (Ogrid.rows[i].cells[4].firstChild.className == "RedCss") {
               str += "<OP>";
               str += "<ID>" + Ogrid.rows[i].OPID + "</ID>";
               str += "<Val>" + Ogrid.rows[i].cells(4).firstChild.value + "</Val>";
               str += "</OP>"; 
              }
          }
          document.getElementById(MasterObj + "txtXmlSave").value += str + "</Root>";         
          if (document.getElementById(MasterObj + "txtXmlSave").value == "<Root></Root>")
              alert("هيچ آيتمي براي ذخيره وجود ندارد");
          else {
              document.getElementById(MasterObj + "txtSubmit").value = "Save";
              document.getElementById(MasterObj + "BtnSubmit").click();
          }
                  
    }
    //============================
    
</script>
</asp:Content>
