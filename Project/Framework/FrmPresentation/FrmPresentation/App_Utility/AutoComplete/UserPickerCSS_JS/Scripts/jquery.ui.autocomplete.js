/*
* jQuery UI Autocomplete 1.8.4
*
* Copyright 2010, AUTHORS.txt (http://jqueryui.com/about)
* Dual licensed under the MIT or GPL Version 2 licenses.
* http://jquery.org/license
*
* http://docs.jquery.com/UI/Autocomplete
*
* Depends:
*	jquery.ui.core.js
*	jquery.ui.widget.js
*	jquery.ui.position.js
*/
//var mode = "tree";

//$(document).mousedown(function (event) {
////    //    startPosition = gesturesY;
////    //    isMouseDown = true;
////    //    timer = window.setTimeout(GetVelocity, 50);
////    //  && event.target.className != "SearchWidth ui-autocomplete-input" && event.target.className == "ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all"

////    if (event.target.className != "ui-autoChk") {

//        //if (event.target.className == "ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all" || event.target.className == "SearchWidth ui-autocomplete-input" || event.target.className == "") {
//        if(event.target.className == ""){
//            //$.ui.autocomplete.prototype.close(event);//nahveye estefade az prototype haye ui.autocomplete
//            // name classha:event.target.className != "SearchWidth ui-autocomplete-input" && event.target.className == "ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all"
//            $(".SearchWidth ui-autocomplete-input").trigger("close", event);
//            $(".ui-autocomplete").hide()
//            $.ui.menu.prototype.deactivate(event)
//            
////            alert(event.srcElement.name);

//            //        $(".ui-autocomplete").deactivate();
//        }
//        //        else if(event.target.className != "SearchWidth ui-autocomplete-input"){
//        //            $(".SearchWidth ui-autocomplete-input").trigger("close", event);
//        //            $(".ui-autocomplete").hide()
//        //            $.ui.menu.prototype.deactivate(event)
//        //        }

////    }

//});
function spliter(val) {
    return val.split(/,\s*/);
}

(function ($, undefined) {
    
    $(document).mousedown(function (event) {
        if(event.target.className == ""){
            var _clientID=$(".ForID").val();
            var multi=$("#"+_clientID.replace("txtPCode","txtMultiSelect")).val();
            var name=$("#"+_clientID.replace("txtPCode","txtName")).val();
            var val=$("#"+_clientID).val();
            if(multi!="yes"){
                if (name=="" && val!=null){
                    $("#"+_clientID).val("");
                }
                else{
                    $("#"+_clientID).val($("#"+_clientID.replace("txtPCode","txtCode")).val());
                }
            }

            $(".SearchWidth ui-autocomplete-input").trigger("close", event);
            $(".ui-autocomplete").hide()
            $.ui.menu.prototype.deactivate(event)
        }
    });

    var pageindex = 0;
    var lastScrollTop = 0;
    var selecteds = ""//$("#ctl00_ContentPlaceHolder1_AutoComplete1_txtPCode").val();
    var selectedNames="";
    var multiSelected="";
    var objVal = "";
    $.widget("ui.autocomplete", {
        options: {
            appendTo: "body",
            delay: 300,
            minLength: 1,
            position: {
                my: "left top",
                at: "left bottom",
                collision: "none"
            },
            source: null
        },
        _create: function () {
            var self = this, selfId=this.element[0].id,
			doc = this.element[0].ownerDocument;
            var txtCode=selfId.replace("txtPCode","txtCode");
            var txtName=selfId.replace("txtPCode","txtName");
            var txtCode1=selfId.replace("txtPCode","txtCode1");
            var txtMultiSelect=selfId.replace("txtPCode","txtMultiSelect");
            this.element
			.addClass("ui-autocomplete-input")
			.attr("autocomplete", "off")
            // TODO verify these actually work as intended
			.attr({
			    role: "textbox",
			    "aria-autocomplete": "list",
			    "aria-haspopup": "true"
			})
			.bind("keydown.autocomplete", function (event) {
			    if (self.options.disabled) {
			        return;
			    }
			    //			    if (self.element.val() == "") {
			    //			        selecteds = "";
			    //			    }
			    //			    if (selecteds != "") {
			    //			        var itemarray = selecteds.split(",");
			    //			        //var termarray = self.element.val().split(",");
			    //			        for (var count = 0; count < itemarray.length - 1; count++) {
			    //			            var yes = false;
			    //			            for (var i = 0; i < termarray.length - 1; i++) {
			    //			                if (itemarray[count] == termarray[i])
			    //			                    yes = true;
			    //			            }
			    //			            if (!yes) {
			    //			                selecteds = selecteds.replace(itemarray[count] + ",", "");
			    //			            }
			    //			        }

			    //			    }
			    var keyCode = $.ui.keyCode;
			    switch (event.keyCode) {
			        case keyCode.PAGE_UP:
			            self._move("previousPage", event);
			            break;
			        case keyCode.PAGE_DOWN:
			            self._move("nextPage", event);
			            break;
			        case keyCode.UP:
			            self._move("previous", event);
			            // prevent moving cursor to beginning of text field in some browsers
			            event.preventDefault();
			            break;
			        case keyCode.DOWN:
			            self._move("next", event);
			            // prevent moving cursor to end of text field in some browsers
			            event.preventDefault();
			            break;
			        case keyCode.ENTER:
			        case keyCode.NUMPAD_ENTER:
			            // when menu is open or has focus
			            if (self.menu.element.is(":visible")) {
			                event.preventDefault();
			            }
                        //else bayad idye btnfilter ra bedast avarde va on ra seda bezanim!OnClickBtnFilter();
			            //passthrough - ENTER and TAB both select the current element
			        case keyCode.TAB:
			            if (!self.menu.active) {
			                return;
			            }
			            self.menu.select(event);
			            break;
			        case keyCode.ESCAPE:
			            self.element.val(self.term);
			            self.close(event);
			            break;
			        //                    case keyCode.DELETE:  
			        //                    case keyCode.BACKSPACE:  
			        //                        alert("back")  
			        //                        if(selecteds!="")  
			        //                        {  
			        //                            var itemarray=selecteds.split(",");  
			        //                            var termarray=self.element.val().split(",");  
			        //                            for (var count=0;count<itemarray.length-1;count++){  
			        //                                var yes=false;  
			        //                                for(var i=0;i<termarray.length-1;i++){  
			        //                                    if(itemarray[count]==termarray[i])  
			        //                                        yes=true;  
			        //                                }  
			        //                                if(!yes){  
			        //                                    selecteds=selecteds.replace(itemarray[count]+",","");  
			        //                                }  
			        //                           }       
			        //                              
			        //                        }  
			        //                        break;  
			        default:
			            // keypress is triggered before the input value is changed
			            clearTimeout(self.searching);
			            self.searching = setTimeout(function () {
			                // only search if the value has changed
			                
                            if((self.term=="" || self.element.val()=="")&& $("#"+txtMultiSelect).val("")!="yes"){
                                $("#"+txtName).val("");
                                $("#"+txtCode).val("");
                                $("#"+txtCode1).val("");
                            }
                            if (self.term != self.element.val()) {
			                    self.selectedItem = null;

			                    self.search(null, event);
			                }
			            }, self.options.delay);
			            break;
			    }
			})
			.bind("focus.autocomplete", function () {
			    if (self.options.disabled) {
			        return;
			    }

			    self.selectedItem = null;
			    self.previous = self.element.val();
			})
            .bind("click.autocomplete", function (event) {
                multiSelected = $("#"+txtMultiSelect).val();
                self._search("");
            })
//            .bind("change.autocomplete", function (event) {
//                alert("change")
//                if($("#"+selfId).val()=="")
//                {
//                    $("#"+txtName).val("");
//                    $("#"+txtPCode).val("");
//                }
////                self._search("");
//            })
			.bind("blur.autocomplete", function (event) {
			    if (self.options.disabled) {
			        return;
			    }

			    clearTimeout(self.searching);
			    // clicks on the menu (or a button to trigger a search) will cause a blur event
			    self.closing = setTimeout(function () {
			        self.close(event);
			        self._change(event);
			    }, 150);
			});
            this._initSource();
            this.response = function () {
                return self._response.apply(self, arguments);
            };
            this.menu = $("<ul></ul>")
            //			this.menu = $("<div style='display:table-row'></div>")
            .addClass("ui-autocomplete")
			.appendTo($(this.options.appendTo || "body", doc)[0])
            // prevent the close-on-blur in case of a "slow" click on the menu (long mousedown)
			.mousedown(function (event) {

			    // clicking on the scrollbar causes focus to shift to the body
			    // but we can't detect a mouseup or a click immediately afterward
			    // so we have to track the next mousedown and close the menu if
			    // the user clicks somewhere outside of the autocomplete
			    var menuElement = self.menu.element[0];

			    if (event.target === menuElement) {

			        setTimeout(function () {
			            $(document).one('mousedown', function (event) {
			                if (event.target !== self.element[0] &&
								event.target !== menuElement &&
								!$.ui.contains(menuElement, event.target)) {
			                    self.close();
			                }
			            });
			        }, 1);
			    }

			    // use another timeout to make sure the blur-event-handler on the input was already triggered
			    setTimeout(function () {
			        clearTimeout(self.closing);
			    }, 13);
			})
            //for infinit scrolling
            //            .scroll(function (event) {
            //                alert("scroll.autocomplete")
            //                this.scrolling = false;
            //			    this.scrollPrev = this.onscroll ? this.onscroll : null;
            //                self._scroll(event);
            //            })
			.menu({
			    focus: function (event, ui) {
			        var item = ui.item.data("item.autocomplete");
			        if (false !== self._trigger("focus", null, { item: item })) {
			            // use value to match what will end up in the input, if it was a key event
			            if (/^key/.test(event.originalEvent.type)) {
			                self.element.val(item.value);
			            }
			        }
			    },
			    //                scroll: function (event,ui){
			    //                },
			    selected: function (event, ui) {
			        var item = ui.item.data("item.autocomplete"),
						previous = self.previous;

			        // only trigger when focus was lost (click on menu)
			        if (self.element[0] !== doc.activeElement) {
			            self.element.focus();
			            self.previous = previous;
			        }

			        if (false !== self._trigger("select", event, { item: item })) {
			            self.element.val(item.value);

			        }
                    
			        self.close(event);
			        self.selectedItem = item;
			        selecteds = $("#"+txtCode).val();
                    selectedNames= $("#"+txtName).val();
			    },
			    blur: function (event, ui) {
			        //			        // don't set the value of the text field if it's already correct
			        //			        // this prevents moving the cursor unnecessarily
			        //			        //			        if (self.menu.element.is(":visible") &&
			        //			        //						(self.element.val() !== self.term)) {
			        //			        //			            self.element.val(self.term);
			        //			        //			        }
			        //			        if (self.menu.element.is(":visible") && selecteds != "") {
			        //			            //						(self.element.val() !== self.term)) {
			        //			            self.element.val(selecteds);
			        //			        }
			        //			        //			        else if (self.menu.element.is(":visible") && selecteds == "" && (self.element.val() !== self.term)) {
			        //			        //			            self.element.val(self.term);
			        //			        //                        
			        //			        //			        }

			    },
			    checked: function (event, ui) {
			        var item = ui.item;
			        var isChecked = ui.isChecked;
			        if (isChecked == true) {
			            if (false !== self._trigger("select", event, { item: item })) {
			                self.element.val(item.value);
			            }
			            //			            selecteds = selecteds + item.value + ",";
			            //			            //self.close(event);
			            //			            self.selectedItem = item;
			            selecteds = $("#"+txtCode).val();
                        selectedNames = $("#"+txtName).val();
			        }
			        else {
			            if (selecteds.indexOf(item.value) != -1) {
			                var length = item.value.length;
			                var index = selecteds.indexOf(item.value);
			                var uncheckedItem = selecteds.substr(index, length + 1);
			                selecteds = selecteds.replace(uncheckedItem, "");
			                $("#"+txtCode).val(selecteds);
                            
                            var Nlength = item.label.length;
                            var Nindex = selectedNames.indexOf(item.label);
			                var NuncheckedItem = selectedNames.substr(Nindex, Nlength + 1);
                            selectedNames=selectedNames.replace(NuncheckedItem,"");
			                $("#"+txtName).val(selectedNames);

                            self.element.val("");
			            }
			        }
			    }
			})
			.zIndex(this.element.zIndex() + 1)
            // workaround for jQuery bug #5781 http://dev.jquery.com/ticket/5781
			.css({ top: 0, left: 0 })
			.hide()
			.data("menu");
            if ($.fn.bgiframe) {
                this.menu.element.bgiframe();
            };
        },

        destroy: function () {
            this.element
			.removeClass("ui-autocomplete-input")
			.removeAttr("autocomplete")
			.removeAttr("role")
			.removeAttr("aria-autocomplete")
			.removeAttr("aria-haspopup");
            this.menu.element.remove();
            $.Widget.prototype.destroy.call(this);
        },

        _setOption: function (key, value) {
            $.Widget.prototype._setOption.apply(this, arguments);
            if (key === "source") {
                this._initSource();
            }
            if (key === "appendTo") {
                this.menu.element.appendTo($(value || "body", this.element[0].ownerDocument)[0])
            }
        },

        _initSource: function () {
            var array,
			url;
            if ($.isArray(this.options.source)) {
                array = this.options.source;
                this.source = function (request, response) {
                    response($.ui.autocomplete.filter(array, request.term));
                };
            } else if (typeof this.options.source === "string") {
                url = this.options.source;
                this.source = function (request, response) {
                    $.getJSON(url, request, response);
                };
            } else {
                this.source = this.options.source;
            }
        },

        search: function (value, event) {
            value = value != null ? value : this.element.val();
            objVal = value

            if (value.length < this.options.minLength) {
                return this.close(event);
            }

            clearTimeout(this.closing);
            if (this._trigger("search") === false) {
                return;
            }

            return this._search(value);
        },

        _search: function (value) {
            this.term = this.element
			.addClass("ui-autocomplete-loading")
            // always save the actual value, not the one passed as an argument
			.val();
            lastScrollTop = this.element.scrollTop();
            this.source({ term: value, pagesize: "14", pageindex: pageindex + 1 }, this.response);
        },

        _response: function (content) {
            //            if(mode=="tree"){
            //            }else
               
            mode = "combo";
            if (content.length) {
                if (mode != "tree") {
                    content = this._normalize(content);
                }
                this._suggest(content);
                this._trigger("open");
            } else {
                var s = objVal;
                var t = spliter(s).pop();
                var valuestr = (this.element.val()).replace(t, "");
                this.element.val(valuestr);
                //alert(f)
                this.close();
            }
            this.element.removeClass("ui-autocomplete-loading");
        },

        close: function (event) {
            clearTimeout(this.closing);
            if (this.menu.element.is(":visible")){// && this.menu.element[0].className!="ui-autoChk") {

            //when write something in txtPCode but not select anything and click outside of menu
            //txtpcode should clear (this is for single selecting)
                var selfID=this.element[0].id;
                var multi=$("#"+selfID.replace("txtPCode","txtMultiSelect")).val();
                var name=$("#"+selfID.replace("txtPCode","txtName")).val();
                var val=$("#"+selfID).val();
                if(multi!="yes"){
                    if (name=="" && val!=null){
                        $("#"+selfID).val("");
                    }
                    else{
                        $("#"+selfID).val($("#"+selfID.replace("txtPCode","txtCode")).val());
                    }
                }

                this._trigger("close", event);
                this.menu.element.hide();
                this.menu.deactivate();
            }
        },

        _change: function (event) {
            if (this.previous !== this.element.val()) {
                this._trigger("change", event, { item: this.selectedItem });
            }
        },

        _normalize: function (items) {
            // assume all items have the right format when the first item is complete
            if (items.length && items[0].label && items[0].value) {
                return items;
            }
            return $.map(items, function (item) {
                if (typeof item === "string") {
                    return {
                        label: item,
                        value: item
                    };
                }
                return $.extend({
                    label: item.label || item.value,
                    value: item.value || item.label
                }, item);
            });
        },

        _suggest: function (items) {

            var ul = this.menu.element
				.empty()
				.zIndex(this.element.zIndex() + 1),
			menuWidth,
			textWidth;
            this._renderMenu(ul, items);

            // TODO refresh should check if the active item is still in the dom, removing the need for a manual deactivate
            this.menu.deactivate();
            this.menu.refresh();
            this.menu.element.show().position($.extend({
                of: this.element
            }, this.options.position));

            menuWidth = ul.width("").outerWidth();
            textWidth = this.element.outerWidth();
            ul.outerWidth(Math.max(menuWidth, textWidth));
        },

        _renderMenu: function (ul, items) {
            var self = this;
            var mode = "combo";
            if (mode != "tree") {
                $.each(items, function (index, item) {
                    var ischecked = false;
                    if (selecteds != "") {
                        var checkedArray = selecteds.split(",");
                        for (var i = 0; i < checkedArray.length - 1; i++) {
                            if (checkedArray[i] == item.value)
                                ischecked = true;
                        }
                    }

                    self._renderItem(ul, item, ischecked);
                });
            }

            else if (mode == "tree") {
                alert("tree")

                //                var str = "<root><item name='a'><item name='d'><item name='dd'></item><item name='e'></item><item name='f'></item></item><item name='g'></item><item name='h'></item></item><item name='b'></item><item name='c'></item></root>"
                //var str = "<root><item id='1' name='a'><item id='4' name='d'><item id='7' name='dd' /><item id='8' name='e' /><item id='9' name='f'/></item><item id='5' name='g' /><item id='6' name='h' /></item><item id='2' name='b' /><item id='3' name='c' /></root>"
                var str = items;
                //var str="<root><item id='1' name='a'><item id='4' name='d'><item id='7' name='dd'></item><item id='8' name='e'></item><item id='9' name='f'></item></item><item id='5' name='g'></item><item id='6' name='h'></item></item><item id='2' name='b'></item><item id='3' name='c'></item></root>"
                //                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                //                oXmlDoc.async = "false";
                //                oXmlDoc.loadXML(str)
                //                var XmlNode = oXmlDoc.documentElement.selectNodes("/root/item");
                //  var xml = $.parseXML(str);
                // var XmlNode = xml.documentElement.selectNodes("/root/item"));
                //'/TshPresentation/App_Utility/ComboBox4/UserPickerCSS_JS/Scripts/images/minus.png'

                self._renderTree(XmlNode, ul);

            }
        },

        _renderItem: function (ul, item, ischecked) {
            var self = this;

            if (multiSelected=="yes"){
                var res = $("<li></li>")
		        .data("item.autocomplete", item)
		        .append($("<a></a>").text(item.label))
                .append($(document.createElement("input"))
                    .attr({ id: item.value, name: item.value, type: 'checkbox', className: 'ui-autoChk' })
                    .click(function (event) {
                        var itemval = $("#" + item.value).attr("id");
                        if ($("#" + item.value).attr('checked') == true) {
                            self.menu.check(event, item);
                        }
                        else if ($("#" + item.value).attr('checked') == false) {
                            self.menu.uncheck(event, item);
                        }
                    })
                )
		        .appendTo(ul);
                $("#" + item.value).attr('checked', ischecked);
            }
            else{
                var res = $("<li></li>")
		        .data("item.autocomplete", item)
		        .append($("<a></a>").text(item.label))
		        .appendTo(ul);
                
            }
            return res;

        },
        _renderTree: function (nodes, ul) {
            var self = this;
            var result = $(self._makeTree(nodes).html()).appendTo(ul);
            $(ul).checkboxTree({
                collapseImage: '/TshPresentation/App_Utility/ComboBox4/UserPickerCSS_JS/Scripts/images/minus.png',
                expandImage: '/TshPresentation/App_Utility/ComboBox4/UserPickerCSS_JS/Scripts/images/plus.png'
            });
            return result;
        },
        _makeTree: function makeTree(nodes) {
            var $result = $('<ul>');

            $.each(nodes, function (_, node) {
                var $li = $('<li>').text(node.getAttribute('name')).append($(document.createElement("input")).attr({ id: node.getAttribute('id'), type: 'checkbox' })).appendTo($result),
                    $children = $(node).children('item');

                if ($children.length > 0) {
                    makeTree($children).appendTo($li);
                }
            });

            return $result;
        },

        _move: function (direction, event) {
            if (!this.menu.element.is(":visible")) {
                this.search(null, event);
                return;
            }
            if (this.menu.first() && /^previous/.test(direction) ||
				this.menu.last() && /^next/.test(direction)) {
                this.element.val(this.term);
                this.menu.deactivate();
                return;
            }
            this.menu[direction](event);
        },

        //        _scroll: function (event) {

        //            if ($(window).scrollTop() == ($(document).height() - $(window).height())) {
        //                Load(Skip, Take);
        //                Skip = Skip + 14;
        //            }
        //            if(true){
        //                this.search(null, event);
        //            }
        //            alert("this.element.scrollHeight:" + this.element[0].scrollHeight)
        //            alert("this.element.scrollTop:" + this.element.scrollTop())
        //            //            alert("this.element.outerHeight:" + this.element.outerHeight())
        //            if (this.element.children(".ui-menu-item:last").offset.top() = this.element.outerHeight()) {
        //                alert("this")
        //            }
        //            if (this.element[0].scrollHeight - lastScrollTop > this.element.outerHeight()) {
        //                alert("now scroll")
        //            }
        //            var offset = this.element.offset().top,
        //                base= this.menu.active.offset().top,
        //				scroll = this.element.attr("scrollTop"),
        //				elementHeight = this.element.height();

        //            if (offset >= elementHeight) {
        //				alert("now")
        //			}
        //            if( this.element[0].scrollPrev ) {
        //                alert("ok")
        //				this.element[0].scrollPrev();
        //			}
        //if( this.scrolling ) return;
        //var totalPixels = $( this ).attr( 'scrollHeight' ) - $( this ).attr( 'clientHeight' );
        //			if( Math.round( $( this.element[0] ).attr( 'scrollTop' ) / ( $( this.element[0] ).attr( 'scrollHeight' ) - $( this.element[0] ).attr( 'clientHeight' ) ) * 100 ) > 0 ) {
        //				alert($( this ))
        //				this.scrolling = true;
        //					
        //				this.search(null, event);
        //			}
        //        },
        widget: function () {
            return this.menu.element;
        }
    });

    $.extend($.ui.autocomplete, {
        escapeRegex: function (value) {
            return value.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&");
        },
        filter: function (array, term) {
            var matcher = new RegExp($.ui.autocomplete.escapeRegex(term), "i");
            return $.grep(array, function (value) {
                return matcher.test(value.label || value.value || value);
            });
        }
    });

} (jQuery));

/*
* jQuery UI Menu (not officially released)
* 
* This widget isn't yet finished and the API is subject to change. We plan to finish
* it for the next release. You're welcome to give it a try anyway and give us feedback,
* as long as you're okay with migrating your code later on. We can help with that, too.
*
* Copyright 2010, AUTHORS.txt (http://jqueryui.com/about)
* Dual licensed under the MIT or GPL Version 2 licenses.
* http://jquery.org/license
*
* http://docs.jquery.com/UI/Menu
*
* Depends:
*	jquery.ui.core.js
*  jquery.ui.widget.js
*/
(function ($) {

    $.widget("ui.menu", {
        _create: function () {
            var self = this;
            this.element
			.addClass("ui-menu ui-widget ui-widget-content ui-corner-all")
			.attr({
			    role: "listbox",
			    "aria-activedescendant": "ui-active-menuitem"
			})
			.click(function (event) {
			    if (!$(event.target).closest(".ui-menu-item a").length) {
			        return;
			    }
			    // temporary
			    event.preventDefault();
			    self.select(event);
			});
            this.refresh();
        },

        refresh: function () {
            var self = this;

            // don't refresh list items that are already adapted
            var items = this.element.children("li:not(.ui-menu-item):has(a)")
			.addClass("ui-menu-item")
			.attr("role", "menuitem");

            items.children("a")
			.addClass("ui-corner-all")
			.attr("tabindex", -1)
            // mouseenter doesn't work with event delegation
			.mouseenter(function (event) {
			    self.activate(event, $(this).parent());
			})
			.mouseleave(function () {
			    self.deactivate();
			});
        },

        activate: function (event, item) {
            this.deactivate();
            if (this.hasScroll()) {
                var offset = item.offset().top - this.element.offset().top,
				scroll = this.element.attr("scrollTop"),
				elementHeight = this.element.height();
                //                alert("item.offset().top:"+item.offset().top)
                //                alert("this.element.offset().top:"+this.element.offset().top)
                //                alert("scroll:"+scroll)
                //                alert("elementHeight:"+elementHeight)
                if (offset < 0) {
                    this.element.attr("scrollTop", scroll + offset);
                } else if (offset > elementHeight) {
                    this.element.attr("scrollTop", scroll + offset - elementHeight + item.height());
                }
            }
            this.active = item.eq(0)
			.children("a")
				.addClass("ui-state-hover")
				.attr("id", "ui-active-menuitem")
			.end();
            this._trigger("focus", event, { item: item });
        },

        deactivate: function () {
            if (!this.active) { return; }

            this.active.children("a")
			.removeClass("ui-state-hover")
			.removeAttr("id");
            this._trigger("blur");
            this.active = null;
        },

        next: function (event) {
            this.move("next", ".ui-menu-item:first", event);
        },

        previous: function (event) {
            this.move("prev", ".ui-menu-item:last", event);
        },

        first: function () {
            return this.active && !this.active.prevAll(".ui-menu-item").length;
        },

        last: function () {
            return this.active && !this.active.nextAll(".ui-menu-item").length;
        },

        move: function (direction, edge, event) {
            if (!this.active) {
                this.activate(event, this.element.children(edge));
                return;
            }
            var next = this.active[direction + "All"](".ui-menu-item").eq(0);
            if (next.length) {
                this.activate(event, next);
            } else {
                this.activate(event, this.element.children(edge));
            }
        },

        // TODO merge with previousPage
        nextPage: function (event) {
            if (this.hasScroll()) {
                // TODO merge with no-scroll-else
                if (!this.active || this.last()) {
                    this.activate(event, this.element.children(":first"));
                    return;
                }
                var base = this.active.offset().top,
				height = this.element.height(),
				result = this.element.children("li").filter(function () {
				    var close = $(this).offset().top - base - height + $(this).height();
				    // TODO improve approximation
				    return close < 10 && close > -10;
				});

                // TODO try to catch this earlier when scrollTop indicates the last page anyway
                if (!result.length) {
                    result = this.element.children(":last");
                }
                this.activate(event, result);
            } else {
                this.activate(event, this.element.children(!this.active || this.last() ? ":first" : ":last"));
            }
        },

        // TODO merge with nextPage
        previousPage: function (event) {
            if (this.hasScroll()) {
                // TODO merge with no-scroll-else
                if (!this.active || this.first()) {
                    this.activate(event, this.element.children(":last"));
                    return;
                }

                var base = this.active.offset().top,
				height = this.element.height();
                result = this.element.children("li").filter(function () {
                    var close = $(this).offset().top - base + height - $(this).height();
                    // TODO improve approximation
                    return close < 10 && close > -10;
                });

                // TODO try to catch this earlier when scrollTop indicates the last page anyway
                if (!result.length) {
                    result = this.element.children(":first");
                }
                this.activate(event, result);
            } else {
                this.activate(event, this.element.children(!this.active || this.first() ? ":last" : ":first"));
            }
        },

        hasScroll: function () {
            return this.element.height() < this.element.attr("scrollHeight");
        },

        select: function (event) {
            this._trigger("selected", event, { item: this.active });
            //$("#"+this.item.value).attr('checked',true);
            //this._trigger("checked", event, { item: this.active, isChecked: true });
        },

        check: function (event, ui) {
            this._trigger("checked", event, { item: ui, isChecked: true });
        },
        uncheck: function (event, ui) {
            this._trigger("checked", event, { item: ui, isChecked: false });
        }
    });

} (jQuery));
