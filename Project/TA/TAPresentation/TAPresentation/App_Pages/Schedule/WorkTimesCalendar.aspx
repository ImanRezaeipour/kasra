<%@ Page Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="WorkTimesCalendar.aspx.cs" Inherits="TAPresentation.App_Pages.Schedule.WorkTimesCalendar"
    Title="Untitled Page" ValidateRequest="false" %>

<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../../App_Utility/Scripts/SHDate.js" type="text/javascript"></script>

    <script src="../../App_Utility/Scripts/KasraDate.js" type="text/javascript"></script>

    

    <table id="Table1" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td style="height: 10px" bgcolor="#e7eeff">
                <asp:ScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="false"
                    ScriptMode="Release">
                </asp:ScriptManager>

                <script type="text/javascript" language="javascript">
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                    function BeginRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
                        var elem = args.get_postBackElement();
                    }
                    function EndRequestHandler(sender, args) {
                        document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
                        var StrVal = $get(MasterObj + "txtSubmit").value
                        //alert(StrVal)
                        if (StrVal == "ImgRefreshPerson") {

                            document.getElementById('ImgRefreshPerson').disabled = true;

                        }
                        document.getElementById('MaskedDiv').style.display = 'none';
                        document.getElementById('ModalPopupDiv').style.display = 'none';
                        $get(MasterObj + "txtSubmit").value = "";
                        if ($get(MasterObj + "txtAlert").value != "") {
                            SetMsg($get(MasterObj + "txtAlert").value);
                            $get(MasterObj + "txtAlert").value = ""
                        }
                    }
                                                               
                </script>

                <table id="Table2" style="width: 100%; height: 16px" cellspacing="0" cellpadding="0"
                    width="100%" border="0">
                    <tr valign="middle">
                        <td>
                            <input id="btnNextMonth" title="ماه بعد" style="background-position: center center;
                                background-image: url(../../App_Utility/Images/Icons/Right.gif); cursor: pointer;
                                border-top-style: none; background-repeat: no-repeat; border-right-style: none;
                                border-left-style: none; height: 20px; background-color: transparent; border-bottom-style: none"
                                onclick="btnNextMonthOnClick()" type="button" name="btnNextMonth" runat="server" />
                            <select id="cmbMonth" style="width: 60px" onchange="cmbMonthOnChnage(this)" name="cmbMonth"
                                runat="server">
                                <option value="1" selected>فروردين</option>
                                <option value="2">ارديبهشت</option>
                                <option value="3">خرداد</option>
                                <option value="4">تير</option>
                                <option value="5">مرداد</option>
                                <option value="6">شهريور</option>
                                <option value="7">مهر</option>
                                <option value="8">آبان</option>
                                <option value="9">آذر</option>
                                <option value="10">دي</option>
                                <option value="11">بهمن</option>
                                <option value="12">اسفند</option>
                            </select><input id="btnPrevMonth" title="ماه قبل" style="background-position: center center;
                                background-image: url(../../App_Utility/Images/Icons/Left.gif); cursor: pointer;
                                border-top-style: none; background-repeat: no-repeat; border-right-style: none;
                                border-left-style: none; height: 20px; background-color: transparent; border-bottom-style: none"
                                onclick="btnPrevMonthOnClick()" type="button" name="btnPrevMonth" runat="server" />
                        </td>
                        <td>
                            <input id="btnNextYear" title="سال بعد" style="background-position: center center;
                                background-image: url('../../App_Utility/Images/Icons/UP1.gif'); cursor: pointer;
                                border-top-style: none; background-repeat: no-repeat; border-right-style: none;
                                border-left-style: none; height: 20px; background-color: transparent; border-bottom-style: none"
                                onclick="btnNextYearOnClick()" type="button" name="btnNextYear" runat="server" />
                            <select id="cmbYear" style="width: 60px" onchange="cmbYearOnChange(this)" name="cmbYear"
                                runat="server">
                                <option value="1300" selected>1300</option>
                                <option value="1301">1301</option>
                                <option value="1302">1302</option>
                                <option value="1303">1303</option>
                                <option value="1304">1304</option>
                                <option value="1305">1305</option>
                                <option value="1306">1306</option>
                                <option value="1307">1307</option>
                                <option value="1308">1308</option>
                                <option value="1309">1309</option>
                                <option value="1310">1310</option>
                                <option value="1311">1311</option>
                                <option value="1312">1312</option>
                                <option value="1313">1313</option>
                                <option value="1314">1314</option>
                                <option value="1315">1315</option>
                                <option value="1316">1316</option>
                                <option value="1317">1317</option>
                                <option value="1318">1318</option>
                                <option value="1319">1319</option>
                                <option value="1320">1320</option>
                                <option value="1321">1321</option>
                                <option value="1322">1322</option>
                                <option value="1323">1323</option>
                                <option value="1324">1324</option>
                                <option value="1325">1325</option>
                                <option value="1326">1326</option>
                                <option value="1327">1327</option>
                                <option value="1328">1328</option>
                                <option value="1329">1329</option>
                                <option value="1330">1330</option>
                                <option value="1331">1331</option>
                                <option value="1332">1332</option>
                                <option value="1333">1333</option>
                                <option value="1334">1334</option>
                                <option value="1335">1335</option>
                                <option value="1336">1336</option>
                                <option value="1337">1337</option>
                                <option value="1338">1338</option>
                                <option value="1339">1339</option>
                                <option value="1340">1340</option>
                                <option value="1341">1341</option>
                                <option value="1342">1342</option>
                                <option value="1343">1343</option>
                                <option value="1344">1344</option>
                                <option value="1345">1345</option>
                                <option value="1346">1346</option>
                                <option value="1347">1347</option>
                                <option value="1348">1348</option>
                                <option value="1349">1349</option>
                                <option value="1350">1350</option>
                                <option value="1351">1351</option>
                                <option value="1352">1352</option>
                                <option value="1353">1353</option>
                                <option value="1354">1354</option>
                                <option value="1355">1355</option>
                                <option value="1356">1356</option>
                                <option value="1357">1357</option>
                                <option value="1358">1358</option>
                                <option value="1359">1359</option>
                                <option value="1360">1360</option>
                                <option value="1361">1361</option>
                                <option value="1362">1362</option>
                                <option value="1363">1363</option>
                                <option value="1364">1364</option>
                                <option value="1365">1365</option>
                                <option value="1366">1366</option>
                                <option value="1367">1367</option>
                                <option value="1368">1368</option>
                                <option value="1369">1369</option>
                                <option value="1370">1370</option>
                                <option value="1371">1371</option>
                                <option value="1372">1372</option>
                                <option value="1373">1373</option>
                                <option value="1374">1374</option>
                                <option value="1375">1375</option>
                                <option value="1376">1376</option>
                                <option value="1377">1377</option>
                                <option value="1378">1378</option>
                                <option value="1379">1379</option>
                                <option value="1380">1380</option>
                                <option value="1381">1381</option>
                                <option value="1382">1382</option>
                                <option value="1383">1383</option>
                                <option value="1384">1384</option>
                                <option value="1385">1385</option>
                                <option value="1386">1386</option>
                                <option value="1387">1387</option>
                                <option value="1388">1388</option>
                                <option value="1389">1389</option>
                                <option value="1390">1390</option>
                                <option value="1391">1391</option>
                                <option value="1392">1392</option>
                                <option value="1393">1393</option>
                                <option value="1394">1394</option>
                                <option value="1395">1395</option>
                                <option value="1396">1396</option>
                                <option value="1397">1397</option>
                                <option value="1398">1398</option>
                                <option value="1399">1399</option>
                                <option value="1400">1400</option>
                            </select>
                            <input id="btnPrevYear" title="سال قبل" style="background-position: center center;
                                background-image: url('../../App_Utility/Images/Icons/Down1.gif'); cursor: pointer;
                                border-top-style: none; background-repeat: no-repeat; border-right-style: none;
                                border-left-style: none; height: 20px; background-color: transparent; border-bottom-style: none"
                                onclick="btnPrevYearOnClick()" type="button" name="btnPrevYear" runat="server" />
                        </td>
                        <td style="width: 20px; height: 2px" height="2">
                            <input id="opPersonName" onclick="opPersonNameOnClick()" type="radio" value="opPersonName"
                                name="Group" runat="server" checked />
                        </td>
                        <td align="left">
                            ش.پرسنلي:
                        </td>
                        <td align="right">
                            <input id="txtPersonID" onkeydown="OnKeyDownNum('integer',this.value)" onblur="txtPersonIDOnBlur(this)"
                                style="width: 80px" type="text" name="txtPersonID" runat="server" />
                        </td>
                        <td id="tdGroupLable" align="left">
                            نام و نام خانوادگي:
                        </td>
                        <td align="right" height="2">
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:DropDownList ID="cmbPersonName" runat="server" Font-Size="Smaller" onchange="cmbPersonNameOnChange(this)"
                                        Width="120px">
                                    </asp:DropDownList>
                                    <img id="ImgRefreshPerson" alt="به روزرساني نام" src="../../App_Utility/Images/Icons/Refresh1.png"
                                        onclick="onClickImgRefreshPerson()" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ImgRefreshPersonSubmit" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <input id="opShiftNobatKari" onclick="opShiftNobatKariOnClick()" type="radio" value="opShiftNobatKari"
                                name="Group" runat="server" />
                        </td>
                        <td align="left">
                            شيفت:
                        </td>
                        <td id="tdGroupLookup" align="right">
                            <asp:DropDownList runat="server" onchange="cmbScheduleOnChange(this)" Font-Size="Smaller"
                                ID="cmbSchedule" Width="90px">
                            </asp:DropDownList>
                        </td>
                        <td align="left">
                            گروه :
                        </td>
                        <td align="right">
                            <asp:DropDownList runat="server" onchange="cmbGroupOnChange(this)" Font-Size="Smaller"
                                ID="cmbGroup" Width="100px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" PageID="1311" PageName="WorkTimesCalendar.aspx" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <table id="grdHeader" cellspacing="0" cellpadding="0" width="100%" border="0" style="height: 100%">
                    <tr>
                        <td class="CssHeaderStyle" align="center" width="14.5%">
                            شنبه
                        </td>
                        <td class="CssHeaderStyle" align="center" width="14.5%">
                            يکشنبه
                        </td>
                        <td class="CssHeaderStyle" align="center" width="14.5%">
                            دوشنبه
                        </td>
                        <td class="CssHeaderStyle" align="center" width="14.5%">
                            سه شنبه
                        </td>
                        <td class="CssHeaderStyle" align="center" width="14.5%">
                            چهارشنبه
                        </td>
                        <td class="CssHeaderStyle" align="center" width="14.5%">
                            پنجشنبه
                        </td>
                        <td class="CssHeaderStyle" align="center" width="13%">
                            جمعه
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td id="MainTD">
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table id="grdDetail" style="background-repeat: no-repeat; background-color: #E3EFFF"
                            height="100%" cellspacing="0" width="100%" border="0" cellpadding="1">
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #6633cc 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="24">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="13%" height="24">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    height: 24px" onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    height: 24px" onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    height: 24px" onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; height: 24px"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="24">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo1" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo2" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo3" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo4" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo5" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo6" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; border-bottom: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="24">
                                    <asp:DropDownList ID="Lcombo7" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px"
                                        ConnectionName="GenCnn" LookupName="DetailCollectionName" DataValueField="val">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #6633cc 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="24">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    height: 24px" onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    height: 24px" onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    height: 24px" onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    height: 24px" onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    height: 24px" onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    height: 24px" onclick="cellDayOnClick(this)" align="center" width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; height: 24px"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="24">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; height: 24px"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="5.55%">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo8" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo9" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo10" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo11" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo12" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo13" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; border-bottom: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="24">
                                    <asp:DropDownList ID="Lcombo14" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px"
                                        ConnectionName="GenCnn" LookupName="DetailCollectionName" DataValueField="val">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #6633cc 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="5.55%">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; height: 24px"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="5.55%">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; height: 24px"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="5.55%">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo15" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo16" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo17" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo18" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo19" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo20" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; border-bottom: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="24">
                                    <asp:DropDownList ID="Lcombo21" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px"
                                        ConnectionName="GenCnn" LookupName="DetailCollectionName" DataValueField="val">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="25">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="25">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="25">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="25">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="25">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="25">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #6633cc 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="25">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; height: 24px"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="5.55%">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; height: 24px"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="5.55%">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo22" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo23" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo24" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo25" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo26" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo27" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; border-bottom: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="24">
                                    <asp:DropDownList ID="Lcombo28" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px"
                                        ConnectionName="GenCnn" LookupName="DetailCollectionName" DataValueField="val">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #6633cc 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="5.55%">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; height: 24px"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="5.55%">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; height: 24px"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="5.55%">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo29" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo30" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo31" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo32" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo33" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo34" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; border-bottom: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="24">
                                    <asp:DropDownList ID="Lcombo35" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px"
                                        ConnectionName="GenCnn" LookupName="DetailCollectionName" DataValueField="val">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-top: #6633cc 1px solid; border-left: #6633cc 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="5.55%">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; height: 24px"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="5.55%">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #ccccff 1px solid" onclick="cellDayOnClick(this)"
                                    align="center" width="14.5%" height="5.55%">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; height: 24px"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="5.55%">
                                </td>
                            </tr>
                            <tr>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo36" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                    <asp:DropDownList ID="Lcombo37" onmouseover="onmouseoverLcombo(this)" onmouseout="onmouseoutLcombo()"
                                        runat="server" onchange="onchangeLcombo(this)" Font-Size="7pt" Width="120px">
                                    </asp:DropDownList>
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left-width: 1px; border-left-color: #6633cc;
                                    border-bottom: #ccccff 1px solid" onclick="cellDayOnClick(this)" align="center"
                                    width="14.5%" height="24">
                                </td>
                                <td style="border-right: #6633cc 1px solid; border-left: #6633cc 1px solid; border-bottom: #ccccff 1px solid"
                                    onclick="cellDayOnClick(this)" align="center" width="13%" height="24">
                                </td>
                            </tr>
                        </table>
                        <asp:HiddenField ID="txtAlert" runat="server" />
                        <asp:HiddenField ID="txtXMLSave" runat="server" />
                        <asp:HiddenField ID="txtNobatKari" runat="server" />
                        <asp:HiddenField ID="txtXmlShiftNobatKariRel" runat="server" />
                        <asp:HiddenField ID="txtXmlShiftNobatKari" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <table id="Table4" cellspacing="0" cellpadding="1" width="500" border="0">
        <tr>
            <td id="tdHidden" style="display: none">
                    <input type="text" id="txtAcCode" name="txtAcCode" runat="server" />
                <input id="txtSelDay" style="width: 71px; height: 22px" type="text" size="6" runat="server" />
                <input id="txtSelMonth" style="width: 71px; height: 22px" type="text" size="6" runat="server" />
                <input id="txtSelYear" style="width: 71px; height: 22px" type="text" size="6" runat="server" />
                <input id="txtSDate" style="width: 71px; height: 22px" type="text" size="6" name="txtSDate"
                    runat="server" />
                <input id="txtEDate" style="width: 71px; height: 22px" type="text" size="6" name="txtEDate"
                    runat="server" />
                <input id="txtCurDate" type="text" runat="server" />
                <input id="txtSubmit" type="text" runat="server" />
                <input id="txtXmlHoliday" type="text" name="txtXmlHoliday" runat="server" />
                <input id="txtType" type="text" runat="server" />
                <input type="text" id="txtTempDate" runat="server" />
                <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                <asp:Button ID="ImgRefreshPersonSubmit" runat="server" Text="ImgRefreshPersonSubmit"
                    OnClick="ImgRefreshPersonSubmit_Click" />
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript" src="../../App_Utility/Scripts/Schedule/WorkTimesCalendar.js">
        
    </script>

</asp:Content>
