Ext.onReady(function(){
Ext.QuickTips.init();
    
    var menu2 = new Ext.menu.Menu({
        id: 'mainMenu',

        items: [
                         {
                             text: 'ویرایش مشخصات پرسنل'
                         }, {
                             text: 'ویرایش مشخصات پرسنل'
                         }, {
                             text: 'ویرایش مشخصات پرسنل'
                         }, {
                             text: 'ویرایش مشخصات پرسنل',
                             on: 'click'
                         }
                    ]

    });
    
   
    var menu = new Ext.menu.Menu({
        id: 'mainMenu',
        items: [
            {
                text: 'گروه کاری',
                iconCls: 'calendar' 
            },
            {
                text: 'واحد سازمانی',
                menu:menu2 ,
                iconCls: 'calendar'    
            }
        ]
   });

   
  
    var tb = new Ext.Toolbar();
    tb.render('toolbar1');

    tb.add({
            text:'گروه کاری',
            iconCls: 'bmenu',  // <-- icon
            menu: menu  // assign menu by instance
        },
        {
            text: 'گروه کاری',
            iconCls: 'bmenu',  // <-- icon
            menu: menu  // assign menu by instance
        }
    );

        var item = menu2.add({
              text: 'Dynamically added Item'
            
            , tooltip: { text: 'This is a an example QuickTip for a toolbar item' }
        });

        item.on('click', onItemClick);
   
        
    function onItemClick(item){
        alert(1)
    }

   

});