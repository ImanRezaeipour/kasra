<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AutoComplete.ascx.cs" Inherits="FrmPresentation.App_Utility.AutoComplete.AutoComplete" %>
<link href='<%="/FrmPresentation/App_Utility/AutoComplete/UserPickerCSS_JS/css/jquery.ui.all.css"%>' rel="stylesheet" type="text/css" />
<link href="/FrmPresentation/App_Utility/AutoComplete/UserPickerCSS_JS/css/demos.css" rel="stylesheet" type="text/css" />
<link href="/FrmPresentation/App_Utility/AutoComplete/UserPickerCSS_JS/css/jquery.checkboxtree.css" rel="stylesheet" type="text/css" />
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%--<link href="/FrmPresentation/App_Utility/AutoComplete/UserPickerCSS_JS/css/autoSuggest.css" rel="stylesheet" type="text/css" />--%>
<style type="text/css">
	.ui-autocomplete-loading { background: white url('/FrmPresentation/App_Utility/AutoComplete/UserPickerCSS_JS/css/indicator.gif') left center no-repeat; }
	.SearchWidth{width:100%;}
</style>
<div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
</div>
<asp:Literal ID="LitraltxtPCode" runat="server"></asp:Literal>
<table border="0" id="TBMain" ismaintable="true" runat="server" dir="rtl" align="right"
    cellpadding="0" cellspacing="0" style="border: 1px solid #6699FF; width: 270px;
    height: 20px">
    <tr>
        <td id="tdText" valign="middle">
            <asp:TextBox CssClass="SearchWidth" ID="txtPCode" runat="server" Rows="3" Width="210px" ></asp:TextBox>
        </td>
        <td id="Td1" runat="server" align="right" style="width: 130px; font-family: KasraTahoma;
            font-size: 12px; font-weight: bold;">
            <asp:TextBox CssClass="SearchWidth" ID="txtName" runat="server" ReadOnly="true" Width="100px" onmouseover="javascript:OnMouseOver();" onchange="javascript:OnChange();" Rows="3" 
            BorderStyle="None" BackColor="Transparent" Font-Names="tahoma" Font-Size="11px"
                Font-Bold="True" ForeColor="#006600"></asp:TextBox>
        </td>
    </tr>
</table>
<br />
<br />
<br />

<div style="display: none;">
<asp:TextBox  ID="txtCode" runat="server"></asp:TextBox>
<asp:TextBox CssClass="SearchWidth" ID="txtMultiSelect" runat="server" ></asp:TextBox>
<asp:TextBox CssClass="SearchWidth" ID="txtCode1" runat="server" ></asp:TextBox>

<asp:TextBox ID="txtSessionID" runat="server"></asp:TextBox>
<asp:TextBox ID="txtOnLineUserID" runat="server"></asp:TextBox>
<asp:TextBox ID="txtGetCompanyFinatialPeriodID" runat="server"></asp:TextBox>
<asp:TextBox ID="TxtURL" runat="server"></asp:TextBox>
<asp:TextBox ID="TxtID" runat="server"></asp:TextBox>
</div>
<script src="/FrmPresentation/App_Utility/AutoComplete/UserPickerCSS_JS/Scripts/jquery.ui.autocomplete.js" type="text/javascript"></script>
<script type="text/javascript">
    function OnMouseOver() {
        var tooltip = $("#<%=txtName.ClientID%>").val();
        $("#<%=txtName.ClientID%>").attr('title', tooltip);
    }

    function OnChange() {
        var tooltip = $("#<%=txtName.ClientID%>").val();
        $("#<%=txtName.ClientID%>").attr('title', tooltip);
    }
</script> 
<script type="text/javascript">

    $(function () {

        var multiSelect = "<%=MultiSelect%>";
        $("#<%=txtMultiSelect.ClientID%>").val(multiSelect);

        $("#<%=TxtID.ClientID%>").attr('className', 'ForID');
        $("#<%=TxtID.ClientID%>").val("<%=txtPCode.ClientID%>");

        var currentURl = $("#<%=TxtURL.ClientID%>").val();
        var index = 0;

        for (var loop = 0; loop < 3; loop++)
            index = currentURl.indexOf('/', index + 1);

        var URL = currentURl.substring(0, index);

        function split(val) {
            return val.split(/,\s*/);
        }
        function extractLast(term) {
            return split(term).pop();
        }
        var mode = "combo";
        $("#<%=txtPCode.ClientID%>").autocomplete({

            source: function (request, response) {

                $.getJSON(URL + "/FrmPresentation/App_Utility/AutoComplete/SuggestLists.ashx?sp=<%=SP%>&OnLineUserID=<%=OnLineUserID%>&MenuItemID=<%=MenuItemID%>&CompanyFinatialPeriodID=<%=CompanyFinatialPeriodID%>&SessionID=<%=SessionID%>", {
                    term: extractLast(request.term)
                    , pagesize: request.pagesize
                    , pageindex: request.pageindex
                }, response);
            },
            search: function () {
                var term = extractLast(this.value);
                if (term == null)
                    term = "load"
                if (term.length < 1) {
                    return false;
                }
            },
            focus: function () {
                // prevent value inserted on focus
                return false;
            },
            select: function (event, ui) {

                if (multiSelect == "yes") {
                    var termsSearch = split(this.value);
                    var termsCode = split($("#<%=txtCode.ClientID%>").val());
                    var termsName = split($("#<%=txtName.ClientID%>").val());

                    var current = $("#<%=txtName.ClientID%>").val();
                    if (current.indexOf("(" + ui.item.value + ")") == -1) {//check to not have duplication
                        // remove the current input
                        termsSearch.pop();
                        // add the selected item

                        termsCode.push(ui.item.value);
                        termsName.push(ui.item.label);
                        // add placeholder to get the comma-and-space at the end
                        termsCode.push("");
                        termsName.push("");
                        //this.value = terms.join(", ");
                        //alert("t3:"+this.value)
                        this.value = termsSearch;

                        $("#<%=txtCode.ClientID%>").val(termsCode.join(", "));
                        $("#<%=txtCode.ClientID%>").val(termsCode);

                        $("#<%=txtName.ClientID%>").val(termsName.join(", "));
                        $("#<%=txtName.ClientID%>").val(termsName);

                        $("#<%=txtCode1.ClientID%>").val($("#<%=txtCode.ClientID%>").val());
                    }
                }
                else {
                    var termsPCode = split(this.value);
                    var termsCode = split($("#<%=txtCode.ClientID%>").val());
                    var termsName = split($("#<%=txtName.ClientID%>").val());

                    termsPCode.pop();
                    termsCode.pop();
                    termsName.pop();

                    termsCode.push(ui.item.value);
                    termsName.push(ui.item.label);

                    this.value = termsPCode;

                    $("#<%=txtCode.ClientID%>").val(termsCode);
                    $("#<%=txtName.ClientID%>").val(termsName);
                    $("#<%=txtCode1.ClientID%>").val(termsCode);
                    $("#<%=txtPCode.ClientID%>").val(termsCode);
                }
                return false;
            }
        });
    });
    
</script>

