<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.OrganizationChart.Test" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="../../../App_Utility/Styles/combobox.css" type="text/css" rel="stylesheet" />
    <script language=javascript>

        function btnNewOnClick() {
            tdnew.innerHTML=tdCombo.innerHTML
//            window.ComboBox2 = new ComponentArt_ComboBox('ComboBox2');
//            ComboBox2.Data = [[['Text', '55'], ['DisplayName', 'a1 a1'], ['PersonCode', '55        ']], [['Text', '56'], ['DisplayName', 'a2 a2'], ['PersonCode', '56        ']], [['Text', '57'], ['DisplayName', 'a3 a3'], ['PersonCode', '57        ']], [['Text', '58'], ['DisplayName', 'a4 a4'], ['PersonCode', '58        ']], [['Text', '59'], ['DisplayName', 'a5 a5'], ['PersonCode', '59        ']], [['Text', '1194'], ['DisplayName', 'رنجبر مريم'], ['PersonCode', '1194      ']], [['Text', '1196'], ['DisplayName', 'رنجبر مريم'], ['PersonCode', '1196      ']], [['Text', '1197'], ['DisplayName', 'رنجبر مريم'], ['PersonCode', '1197      ']], [['Text', '1198'], ['DisplayName', 'رنجبر مريم'], ['PersonCode', '1198      ']], [['Text', '1199'], ['DisplayName', 'شيباني بهشته'], ['PersonCode', '1199      ']], [['Text', '1901'], ['DisplayName', 'مصلحي زهرا'], ['PersonCode', '1901      ']], [['Text', '1906'], ['DisplayName', 'شيباني بهشته'], ['PersonCode', '1906      ']], [['Text', '2000'], ['DisplayName', 'كاربر ارشد انفورماتيك'], ['PersonCode', '2000      ']], [['Text', '2020'], ['DisplayName', 'XXX XXX'], ['PersonCode', '2020      ']], [['Text', '3265'], ['DisplayName', 'حسيني مريم'], ['PersonCode', '3265      ']], [['Text', '5555'], ['DisplayName', 'مصلحي زهرا'], ['PersonCode', '5555      ']], [['Text', '6060'], ['DisplayName', 'راحله رستگار پناه'], ['PersonCode', '6060      ']], [['Text', '7070'], ['DisplayName', 'gg gg'], ['PersonCode', '7070      ']], [['Text', '8080'], ['DisplayName', 'yyy yyy'], ['PersonCode', '8080      ']], [['Text', '8888'], ['DisplayName', 'dfdf hjhj'], ['PersonCode', '8888      ']], [['Text', '11001'], ['DisplayName', 'رنجبر مريم'], ['PersonCode', '11001     ']], [['Text', '11987'], ['DisplayName', 'رنجبر مريم'], ['PersonCode', '11987     ']], [['Text', '11990'], ['DisplayName', 'شمس زهرا'], ['PersonCode', '11990     ']], [['Text', '19064'], ['DisplayName', 'رنجبر مريم'], ['PersonCode', '19064     ']], [['Text', '101013'], ['DisplayName', 'دياني  دردشتي عليرضا'], ['PersonCode', ' 101013   ']], [['Text', '101051'], ['DisplayName', 'اكبري ابوالفضل'], ['PersonCode', ' 101051   ']], [['Text', '101069'], ['DisplayName', 'نوري  لنجان علي'], ['PersonCode', ' 101069   ']], [['Text', '101079'], ['DisplayName', 'سليماني نوكابادي حبيب'], ['PersonCode', ' 101079   ']], [['Text', '101080'], ['DisplayName', 'نادري نوكابادي عبدالوهاب'], ['PersonCode', ' 101080   ']], [['Text', '101082'], ['DisplayName', 'عطائي مباركه يوسف'], ['PersonCode', ' 101082   ']], [['Text', '101084'], ['DisplayName', 'احمدي  ونهري پرويز'], ['PersonCode', ' 101084   ']], [['Text', '101085'], ['DisplayName', 'ملكي  ديزيچه يداله'], ['PersonCode', ' 101085   ']], [['Text', '101087'], ['DisplayName', 'جباري  ديزيچه اميرقلي'], ['PersonCode', ' 101087   ']], [['Text', '101088'], ['DisplayName', 'عطائي نوكابادي عباس'], ['PersonCode', ' 101088   ']], [['Text', '101131'], ['DisplayName', 'مولايي علي  عسگر'], ['PersonCode', ' 101131   ']], [['Text', '101133'], ['DisplayName', 'وكيلي احمدرضا'], ['PersonCode', ' 101133   ']], [['Text', '101146'], ['DisplayName', 'جعفري  ديزيچه كريم'], ['PersonCode', ' 101146   ']], [['Text', '101151'], ['DisplayName', 'احمدپوربيرگاني شهباز'], ['PersonCode', ' 101151   ']], [['Text', '101159'], ['DisplayName', 'رحماني  مزرعچه حسين'], ['PersonCode', ' 101159   ']], [['Text', '101184'], ['DisplayName', 'جليلي حسن'], ['PersonCode', ' 101184   ']], [['Text', '101185'], ['DisplayName', 'اسماعيليان اصغر'], ['PersonCode', ' 101185   ']], [['Text', '101215'], ['DisplayName', 'رفيعي نادعلي'], ['PersonCode', ' 101215   ']], [['Text', '101217'], ['DisplayName', 'كريميان نوكابادي پرويز'], ['PersonCode', ' 101217   ']], [['Text', '101219'], ['DisplayName', 'نوري اسماعيل'], ['PersonCode', ' 101219   ']], [['Text', '101222'], ['DisplayName', 'نوري لنجان نوكابادي قديرعلي'], ['PersonCode', ' 101222   ']], [['Text', '101223'], ['DisplayName', 'موسوي سيدمحمد'], ['PersonCode', ' 101223   ']], [['Text', '101225'], ['DisplayName', 'سرشومي احمد'], ['PersonCode', ' 101225   ']], [['Text', '101226'], ['DisplayName', 'كريميان اصغر'], ['PersonCode', ' 101226   ']], [['Text', '101227'], ['DisplayName', 'كريميان نوكابادي قاسم'], ['PersonCode', ' 101227   ']], [['Text', '101228'], ['DisplayName', 'سلماني صفر'], ['PersonCode', ' 101228   ']]];
//            ComboBox2.Postback = function() { __doPostBack('ComboBox2', '') };
//            ComboBox2.AdjustPositioning = 1;
//            ComboBox2.AutoComplete = 1;
//            ComboBox2.AutoFilter = 1;
//            ComboBox2.CacheSize = 200;
//            ComboBox2.CallbackPrefix = 'http://localhost:8088/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/test.aspx?Cart_ComboBox2_Callback=yes';
//            ComboBox2.ClientEvents = null;
//            ComboBox2.ClientTemplates = [['itemTemplate', '          <table border="0" cellpadding="0" cellspacing="0" width="100%"><tr class="dataRow"><td class="dataCell" style="width:200px;">## DataItem.getProperty(\'PersonID\') ##</td><td class="dataCell" style="width:100px;">## DataItem.getProperty(\'PersonCode\') ##</td><td class="dataCell">## DataItem.getProperty(\'DisplayName\') ##&nbsp;</td></tr></table>        ']];
//            ComboBox2.ControlId = 'ComboBox2';
//            ComboBox2.CollapseSlide = 2;
//            ComboBox2.CollapseDuration = 200;
//            ComboBox2.CssClass = 'comboBox';
//            ComboBox2.DropDownHeight = 0;
//            ComboBox2.DropDownOffsetX = 0;
//            ComboBox2.DropDownOffsetY = 0;
//            ComboBox2.DropDownPageSize = 10;
//            ComboBox2.DropDownResizingMode = 'Off';
//            ComboBox2.DropDownResizingStyle = 'Live';
//            ComboBox2.DropDownWidth = 500;
//            ComboBox2.DropImageUrl = 'images/drop.gif';
//            ComboBox2.DropHoverImageUrl = 'images/drop_hover.gif';
//            ComboBox2.Enabled = 1;
//            ComboBox2.EnableViewState = 1;
//            ComboBox2.ExpandDirection = 0;
//            ComboBox2.ExpandDuration = 200;
//            ComboBox2.ExpandSlide = 2;
//            ComboBox2.FilterCacheSize = 10;
//            ComboBox2.FilterField = 'PersonCode';
//            ComboBox2.FocusedCssClass = 'comboBoxHover';
//            ComboBox2.HoverCssClass = 'comboBoxHover';
//            ComboBox2.ItemClientTemplateId = 'itemTemplate';
//            ComboBox2.ItemCount = 60;
//            ComboBox2.ItemCssClass = 'comboItem';
//            ComboBox2.ItemHoverCssClass = 'comboItemHover';
//            ComboBox2.LoadingText = 'Loading...';
//            ComboBox2.KeyboardEnabled = 1;
//            ComboBox2.RunningMode = 1;
//            ComboBox2.SelectedIndex = -1;
//            ComboBox2.SelectedItemCssClass = 'comboItemHover';
//            ComboBox2.TextBoxCssClass = 'comboTextBox';
//            ComboBox2.TextBoxEnabled = 1;
//            ComboBox2.TextBoxHoverCssClass = 'comboBoxHover';
//            ComboBox2.Width = 200;
//            ComboBox2.InitKeyboard();

            //ComboBox2.Initialize();
        }
    </script>
    <style type="text/css">
        #btnNew
        {
            width: 14px;
        }
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      
    </div>
    
    <input type=button id=btnNew runat=server onclick=btnNewOnClick() />
    <table class="style1">
        <tr>
            <td id="tdCombo">
    <ComponentArt:ComboBox id="ComboBox1" runat="server" RunningMode="CallBack"
        AutoHighlight="false"
        AutoComplete="true"
        AutoFilter="true"
        DataTextField="PersonID"
        DataFields="PersonCode,DisplayName"
        CssClass="comboBox"
        HoverCssClass="comboBoxHover"
        FocusedCssClass="comboBoxHover"
        TextBoxCssClass="comboTextBox"
        TextBoxHoverCssClass="comboBoxHover"
        DropDownCssClass="comboDropDown"
        ItemClientTemplateId="itemTemplate"
        ItemCssClass="comboItem"
        ItemHoverCssClass="comboItemHover"
        SelectedItemCssClass="comboItemHover"
        DropHoverImageUrl="images/drop_hover.gif"
        DropImageUrl="images/drop.gif"
        DropDownPageSize="10"
        DropDownWidth="500"
        Width="200"
        OnDataRequested="ComboBox1_DataRequested" FilterField="PersonCode"
        >
       <ClientTemplates>
        <ComponentArt:ClientTemplate ID="itemTemplate">
          <table border="0" cellpadding="0" cellspacing="0" width="100%"><tr class="dataRow"><td class="dataCell" style="width:200px;">## DataItem.getProperty('PersonID') ##</td><td class="dataCell" style="width:100px;">## DataItem.getProperty('PersonCode') ##</td><td class="dataCell">## DataItem.getProperty('DisplayName') ##&nbsp;</td></tr></table>
        </ComponentArt:ClientTemplate>
       </ClientTemplates>
       <DropDownHeader>
         <table border="0" cellpadding="0" cellspacing="0" width="100%"><tr class="headingRow"><td class="headingCell" style="width:200px;">PersonID</td><td class="headingCell" style="width:100px;">PersonCode</td><td class="headingCell">DisplayName</td></tr></table>
       </DropDownHeader>
      </ComponentArt:ComboBox>
      
            </td>
        </tr>
    </table>
    
    
    </br>
    <table class="style1">
        <tr>
            <td id="tdnew">
                &nbsp;</td>
        </tr>
    </table>
    </br>
    
    </form>
</body>
</html>
