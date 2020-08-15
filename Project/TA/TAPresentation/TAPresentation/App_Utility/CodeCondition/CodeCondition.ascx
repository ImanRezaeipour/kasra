<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CodeCondition.ascx.cs" Inherits="TAPresentation.App_Utility.CodeCondition.CodeCondition" %>

<link href="/TAPresentation/App_Utility/ComboBox/Style/PersonComboStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../Scripts/General.js" ></script>
    <script type="text/javascript" language="javascript">
        var ThisID = null;
     
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        function BtnDown1_onclick() {
//        alert()
            if (window.event != null && window.event.srcElement != null) {
                this.id = F_GetUserControlID(window.event.srcElement);

                ThisID = this.id
            }
//            alert(ThisID)

            if (ThisID != null && ThisID != undefined && ThisID != "") {

                document.getElementById(ThisID + "_txtHidden").value = ReplaceAll(document.getElementById(ThisID + "_txtHidden").value, '&gt;', '>')
                document.getElementById(ThisID + "_txtHidden").value = ReplaceAll(document.getElementById(ThisID + "_txtHidden").value, '&lt;', '<')
                document.getElementById(ThisID + "_txtHidden").value = ReplaceAll(document.getElementById(ThisID + "_txtHidden").value, ';', '-')
                document.getElementById(ThisID + "_txtHidden").value = ReplaceAll(document.getElementById(ThisID + "_txtHidden").value, '>', ')')
                document.getElementById(ThisID + "_txtHidden").value = ReplaceAll(document.getElementById(ThisID + "_txtHidden").value, '<', '(')
                document.getElementById(ThisID + "_txtHidden").value = ReplaceAll(document.getElementById(ThisID + "_txtHidden").value, '#', '!')



//             document.getElementById(ThisID + "_txtAcronym").value = "Report"
//            document.getElementById(ThisID + "_txtAcronym").value = "Condition"
                //              document.getElementById(ThisID + "_txtAcronym").value = "SelectCode"
                if (document.getElementById(ThisID + "_txtAcronym").value == "")
                    document.getElementById(ThisID + "_txtAcronym").value = "Report"
                 var strUrl = "/TAPresentation/App_Utility/CodeCondition/CodeCondition.aspx?txtHidden=" + document.getElementById(ThisID + "_txtAcronym").value
                  strUrl = encodeURI(strUrl)
                    var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 450px;dialogWidth: 650px;center: Yes;help: no;status: no')
                

                    if ((rValue != undefined) && (rValue != "")) {
                    document.getElementById(ThisID + "_lblCode").innerHTML = rValue.split("|")[1]

                    document.getElementById(ThisID + "_lblCode").innerHTML = ReplaceAll(document.getElementById(ThisID + "_lblCode").innerHTML, '&lt;&gt;', '  مخالف  ')
                    document.getElementById(ThisID + "_lblCode").innerHTML = ReplaceAll(document.getElementById(ThisID + "_lblCode").innerHTML, '&lt;=', '  کوچکتر مساوی از  ')
                    document.getElementById(ThisID + "_lblCode").innerHTML = ReplaceAll(document.getElementById(ThisID + "_lblCode").innerHTML, '&gt;=', '  بزرگتر مساوی از  ')
                    document.getElementById(ThisID + "_lblCode").innerHTML = ReplaceAll(document.getElementById(ThisID + "_lblCode").innerHTML, '&gt;', '  بزرگتر از  ')
                    document.getElementById(ThisID + "_lblCode").innerHTML = ReplaceAll(document.getElementById(ThisID + "_lblCode").innerHTML, '&lt;', '  کوچکتر از  ')
                    document.getElementById(ThisID + "_lblCode").innerHTML = ReplaceAll(document.getElementById(ThisID + "_lblCode").innerHTML, '=', '   مساوی   ')

                    document.getElementById(ThisID + "_lblCode").title = rValue.split("|")[2]

                    document.getElementById(ThisID + "_lblCode").title = ReplaceAll(document.getElementById(ThisID + "_lblCode").title, '<>', '  مخالف  ')
                    document.getElementById(ThisID + "_lblCode").title = ReplaceAll(document.getElementById(ThisID + "_lblCode").title, '<=', '  کوچکتر مساوی از  ')
                    document.getElementById(ThisID + "_lblCode").title = ReplaceAll(document.getElementById(ThisID + "_lblCode").title, '>=', '  بزرگتر مساوی از  ')
                    document.getElementById(ThisID + "_lblCode").title = ReplaceAll(document.getElementById(ThisID + "_lblCode").title, '>', '  بزرگتر از  ')
                    document.getElementById(ThisID + "_lblCode").title = ReplaceAll(document.getElementById(ThisID + "_lblCode").title, '<', '  کوچکتر از  ')

                    document.getElementById(ThisID + "_txtHidden").value = rValue.split("|")[0]
                    document.getElementById(ThisID + "_txtHidden").value = ReplaceAll(document.getElementById(ThisID + "_txtHidden").value, '<>', 'LG')
                    document.getElementById(ThisID + "_txtHidden").value = ReplaceAll(document.getElementById(ThisID + "_txtHidden").value, '<=', 'L=')
                    document.getElementById(ThisID + "_txtHidden").value = ReplaceAll(document.getElementById(ThisID + "_txtHidden").value, '>=', 'G=')
                    document.getElementById(ThisID + "_txtHidden").value = ReplaceAll(document.getElementById(ThisID + "_txtHidden").value, '>', 'G')
                    document.getElementById(ThisID + "_txtHidden").value = ReplaceAll(document.getElementById(ThisID + "_txtHidden").value, '<', 'L')

                }
            }
//            alert(document.getElementById(ThisID + "_txtHidden").value)
//            alert( document.getElementById(ThisID + "_txtAcronym").value)

        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        function F_GetUserControlID(obj) {
            // در نظر می گیرد userControlID ان را به عنوان ID اصلی برسدو table تاحداکثر 20 لول بالا میرود تا به 

            try {
                var strUserControlID = "";
                var iCounter = 0;

                while (++iCounter < 20 && obj != null && obj.IsMainTable == null) {
                    obj = obj.parentElement;

                }
                if (obj != null && obj.IsMainTable != null && obj.IsMainTable == "true") {
                    strUserControlID = obj.UserControlID;

                }
                return strUserControlID;
            }
            catch (e) {
            }
        }
    </script>



        <table  border="0" id="TBMain" IsMainTable="true" runat="server"  dir="rtl" align="right" 
                cellpadding="0" cellspacing="0" style="border: 1px solid #6699FF;width:270px;height :20px " bgcolor="White">
                <tr >
                    <td   Width="250px"><div align="right" >
                    <asp:Label runat="server" ID="lblCode" ></asp:Label>
                    </div></td> 
                    <td id="tdBtn"  valign="middle" >
                        <input    id="BtnDown" runat="server" type="button" onclick="return BtnDown1_onclick()" class="CssBtnDownCombo"/>
                    </td>
                    
                </tr>
        
        </table>
        <div style="display:none;">
            
            
            <asp:TextBox ID="txtSessionID" runat="server" ></asp:TextBox>
            <asp:TextBox ID="txtOnLineUserID" runat="server" ></asp:TextBox>
            <asp:TextBox ID="txtHidden" runat="server" ></asp:TextBox>
            <asp:TextBox ID="txtAcronym" runat="server" ></asp:TextBox>
            <asp:TextBox ID="txtGetCompanyFinatialPeriodID" runat="server" ></asp:TextBox>
            <asp:TextBox ID="txtXml" runat="server"></asp:TextBox>
        </div>
       
    









    


