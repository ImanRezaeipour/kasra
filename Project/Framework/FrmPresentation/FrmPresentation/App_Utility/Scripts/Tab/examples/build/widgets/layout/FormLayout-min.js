Ext.layout.FormLayout=Ext.extend(Ext.layout.AnchorLayout,{labelSeparator:":",getAnchorViewSize:function(a,b){return(a.body||a.el).getStyleSize()},setContainer:function(b){Ext.layout.FormLayout.superclass.setContainer.call(this,b);if(b.labelAlign){b.addClass("x-form-label-"+b.labelAlign)}if(b.hideLabels){this.labelStyle="display:none";this.elementStyle="padding-left:0;";this.labelAdjust=0}else{this.labelSeparator=b.labelSeparator||this.labelSeparator;b.labelWidth=b.labelWidth||100;if(typeof b.labelWidth=="number"){var c=(typeof b.labelPad=="number"?b.labelPad:5);this.labelAdjust=b.labelWidth+c;this.labelStyle="width:"+b.labelWidth+"px;";this.elementStyle="padding-left:"+(b.labelWidth+c)+"px"}if(b.labelAlign=="top"){this.labelStyle="width:auto;";this.labelAdjust=0;this.elementStyle="padding-left:0;"}}if(!this.fieldTpl){var a=new Ext.Template('<div dir="rtl" class="x-form-item {5}" tabIndex="-1">','<label for="{0}" style="{2}" class="x-form-item-label">{1}{4}</label>','<div dir="rtl" class="x-form-element" id="x-form-el-{0}" style="{3}">','</div><div class="{6}"></div>',"</div>");a.disableFormats=true;a.compile();Ext.layout.FormLayout.prototype.fieldTpl=a}},getLabelStyle:function(e){var b="",c=[this.labelStyle,e];for(var d=0,a=c.length;d<a;++d){if(c[d]){b+=c[d];if(b.substr(-1,1)!=";"){b+=";"}}}return b},renderItem:function(e,a,d){if(e&&!e.rendered&&e.isFormField&&e.inputType!="hidden"){var b=[e.id,e.fieldLabel,this.getLabelStyle(e.labelStyle),this.elementStyle||"",typeof e.labelSeparator=="undefined"?this.labelSeparator:e.labelSeparator,(e.itemCls||this.container.itemCls||"")+(e.hideLabel?" x-hide-label":""),e.clearCls||"x-form-clear-left"];if(typeof a=="number"){a=d.dom.childNodes[a]||null}if(a){this.fieldTpl.insertBefore(a,b)}else{this.fieldTpl.append(d,b)}e.render("x-form-el-"+e.id)}else{Ext.layout.FormLayout.superclass.renderItem.apply(this,arguments)}},adjustWidthAnchor:function(b,a){return b-(a.isFormField?(a.hideLabel?0:this.labelAdjust):0)},isValidParent:function(b,a){return true}});Ext.Container.LAYOUTS.form=Ext.layout.FormLayout;