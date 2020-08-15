/*
 * Ext JS Library 2.2.1
 * Copyright(c) 2006-2009, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

Ext.onReady(function() {

    var tabs = new Ext.TabPanel({
        renderTo: 'tabs',
        resizeTabs: true, // turn on tab resizing
        minTabWidth: 115,
        tabWidth: 135,
        enableTabScroll: true,
        width: 600,
        height: 250,
        defaults: { autoScroll: true },
        plugins: new Ext.ux.TabCloseMenu(),
        items: [{
            title: 'Normal Tab',
            html: "My content was added during construction."
        }, {
            title: 'Tab 1',
            html: "My content was added during construction."
        }, {
            title: 'Tab 2',
            //autoLoad: { url: 'ajax2.htm', params: 'foo=bar&wtf=1' }
            html: "My content was added during construction."
        }, {
            title: 'Event Tab',
            listeners: { activate: MyFunc },
            html: "I am tab 4's content. I also have an event listener attached."//,
            //disabled:true
        }, {
        title: 'Tab 3',
            html: "My content was added during construction.",
            html: "Can't see me cause I'm disabled"
        }
        , {
        title: 'Tab 4',
            html: "My content was added during construction.",
            html: "Can't see me cause I'm disabled"
        }
        , {
        title: 'Tab 5',
            html: "Can't see me cause I'm disabled"
        }
        , {
        title: 'Tab 6',
            html: "Can't see me cause I'm disabled"
        }
        ]
    });
    
});

function MyFunc(tab) {
    alert(tab.title + ' was activated.');
}