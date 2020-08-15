
        var oXmlDoc;
        var xmlNode;
        var xmlNodeCode;
        var LastSelectedRow = null;
        $(document).ready(function () {
            $("#cmbFCode").html($("#" + MasterObj + "cmbCode").html());
            $("#cmbSCode").html($("#" + MasterObj + "cmbCode").html());
            $("#BtnSave").click(function () {
                if (CheckNotEmpty()) {
                    var Str = CreateXml();
                    //OpenModelPopup();
                    $.ajax({
                        type: "POST",
                        url: "RequestConfig.aspx/SaveData?SubmitMode=Ajax",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        data: "{ID:" + $("#DivCode").attr("RequestID") + ",Code:" + $("#" + MasterObj + "cmbCode").val() + ",Title:'" + $("#txtTitle").val() + "',PageType:" + ($("#rdDaily").attr("checked") == true ? "1" : "0") + ",Codes:'" + Str + "', MenuItemID:" + $("#" + MasterObj + "txtPageID").val() + ",SessionID:" + $("#" + MasterObj + "txtSessionID").val() + ", CompanyID:" + $("#" + MasterObj + "txtCompanyID").val() + "}",
                        success: function (Data) {

                            if (Data.d.split("###")[0] == "1") {
                                $("#" + MasterObj + "txtData").val(Data.d.split("###")[1]);
                                CreateGrid();
                                SetMsg("ذخيره با موفقيت انجام شد ");
                            }
                            else alert("با خطا مواجه شد")
                           // CloseModelPopup();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("ذخيره با خطا مواجه شد" + jqXHR.responseText);
                           // CloseModelPopup();
                        }

                    });
                }
            });
            $("#BtnDelete").click(function () {
                if (LastSelectedRow != null) {
                    if (confirm("با حذف مورد مربوطه صفحه مربوطه و تمام دسترسيهاي آن نيز حذف مي شود . آيا مايل به ادامه هستيد؟ ")) {
                       // OpenModelPopup();
                        $.ajax({
                            type: "POST",
                            url: "RequestConfig.aspx/DeleteData?SubmitMode=Ajax",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            data: "{ID:" + $("#DivCode").attr("RequestID") + ",MenuItemID:" + $("#" + MasterObj + "txtPageID").val() + ",SessionID:" + $("#" + MasterObj + "txtSessionID").val() + ",CompanyID:" + $("#" + MasterObj + "txtCompanyID").val() + "}",
                            success: function (Data) {
                                if (Data.d.split("###")[0] == "1") {
                                    $("#" + MasterObj + "txtData").val(Data.d.split("###")[1]);
                                    CreateGrid();
                                    SetMsg("حذف با موفقيت انجام شد ");
                                }
                                else alert("با خطا مواجه شد")
                                //CloseModelPopup();
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert("حذف با خطا مواجه شد" + jqXHR.responseText);
                               // CloseModelPopup();
                            }
                        });
                    }
                }
            });

            $("#BtnCreate").click(function () {
                $("#DivCode").attr("RequestID", "0");
                $("#" + MasterObj + "cmbCode").val("");
                $("#rdDaily").attr("checked", false);
                $("#rdTimely").attr("checked", false);
                $("#txtTitle").text("");
                $(".CssSelectedRow").removeClass("CssSelectedRow");
                LastSelectedRow = null;
                $("#cmbFCode").val("");
                $("#txtFCodeName").val("");
                $("#CmbFFormat").val("M");

                $("#cmbSCode").val("");
                $("#txtSCodeName").val("");
                $("#CmbSFormat").val("M");
            });

            CreateGrid();
            $(document).delegate("tr[RowRequest='trTblConfig']", "click", function (e) {
                $(".CssSelectedRow").removeClass("CssSelectedRow");
                $(this).addClass("CssSelectedRow");
                LastSelectedRow = this;
                ShowCodeInfo(this);

            });

        });
        function ShowCodeInfo(rowObj) {
            $("#DivCode").attr("RequestID", $(rowObj).attr("RequestID"));
            xmlNode = oXmlDoc.selectSingleNode("/NewDataSet/Config[ID=" + $(rowObj).attr("RequestID") + "]");
            xmlNodeCode = oXmlDoc.selectNodes("/NewDataSet/Code[RequestID=" + $(rowObj).attr("RequestID") + "]");
            $("#" + MasterObj + "cmbCode").val($(xmlNode).find("Code").text());
            $("#rdDaily").attr("checked", $(xmlNode).find("PageType").text() == 1 ? true : false);
            $("#rdTimely").attr("checked", $(xmlNode).find("PageType").text() == 1 ? false : true);
            $("#txtTitle").text($(xmlNode).find("Title").text());

            if ($(xmlNodeCode).length > 0) {
                $("#cmbFCode").val($($(xmlNodeCode)[0]).find("Code").text());
                $("#txtFCodeName").val($($(xmlNodeCode)[0]).find("Name").text());
                $("#CmbFFormat").val($($(xmlNodeCode)[0]).find("Format").text());
            }
            if ($(xmlNodeCode).length > 1) {
                $("#cmbSCode").val($($(xmlNodeCode)[1]).find("Code").text());
                $("#txtSCodeName").val($($(xmlNodeCode)[1]).find("Name").text());
                $("#CmbSFormat").val($($(xmlNodeCode)[1]).find("Format").text());
            }
        }
        function CreateGrid() {
            if (window.ActiveXObject) {
                oXmlDoc = new ActiveXObject("Microsoft.XMLDOM")
                oXmlDoc.async = "false";
                oXmlDoc.loadXML($("#" + MasterObj + "txtData").val())
            }
            else {
                var parser = new DOMParser(); oXmlDoc = parser.parseFromString($("#" + MasterObj + "txtData").val(), 'text/xml');
            }
            $("tr[RowRequest='trTblConfig']").remove();

            $(".CssSelectedRow").removeClass("CssSelectedRow");
            LastSelectedRow = null;

            xmlNode = oXmlDoc.selectNodes('/NewDataSet/Config');
            xmlNodeCode = oXmlDoc.selectNodes('/NewDataSet/Code');
            var ID = 0;
            var Codes = "";
            $(xmlNode).each(function () {
                ID = $(this).find("ID").text();
                Codes = "";
                $(xmlNodeCode).filter(function () { return $(this).find("RequestID").text() == ID }).each(function () {
                    Codes += "  " + $(this).find("Code").text();
                });
                $("#TblConfig").append("<tr RowRequest='trTblConfig' class='CssItemStyle' RequestID=" + ID + "><td>" + $(this).find("Code").text() + "</td><td>" + $(this).find("Title").text() + "</td><td>" + ($(this).find("PageType").text() == 1 ? "روزانه" : "ساعتی") + "</td><td>" + Codes + "</td></tr>");

            });
            $("#BtnCreate").click();

        }
        function CheckNotEmpty() {
            if ($("#" + MasterObj + "cmbCode").val() == "") {
                alert("کد درخواست را انتخاب کنيد");
                $("#" + MasterObj + "cmbCode").select();
                return false;
            }
            if ($("#rdDaily").attr("checked") == false && $("#rdTimely").attr("checked") == false) {
                alert("نوع درخواست را انتخاب کنيد");
                return false;
            }
            if ($("#txtTitle").text() == "") {
                alert("عنوان درخواست را وارد کنيد");
                $("#txtTitle").select();
                return false;
            }
            if ($("#cmbFCode").val() != "" && $("#txtFCodeName").val() == "") {
                alert("نام نمايشي را وارد کنيد");
                $("#txtFCodeName").select();
                return false;
            }
            if ($("#cmbSCode").val() != "" && $("#txtSCodeName").val() == "") {
                alert("نام نمايشي را وارد کنيد");
                $("#txtSCodeName").select();
                return false;
            }
            return true;
        }
        function CreateXml() {
            var Str = "<Root>";
            if ($("#cmbFCode").val() != "") {
                Str += "<Tb><Code>" + $("#cmbFCode").val() + "</Code><Format>" + $("#CmbFFormat").val() + "</Format><Name>" + $("#txtFCodeName").val() + "</Name></Tb>";
            }
            if ($("#cmbSCode").val() != "") {
                Str += "<Tb><Code>" + $("#cmbSCode").val() + "</Code><Format>" + $("#CmbSFormat").val() + "</Format><Name>" + $("#txtSCodeName").val() + "</Name></Tb>";
            }
            Str += "</Root>";
            return Str;
        }
    