 Ext.onReady(function(){     
  Ext.QuickTips.init();
  
  var menu1109 = new Ext.menu.Menu({ id: 'mainMenu', items: [    ] });
  
  var item1120 = menu1109.add({ text: 'ff', iconCls: 'Css1120', 
  url: 'http://192.168.1.254/FrmPresentation/App_Pages/Login/Welcom.aspx'  }); 
  item1120.on('click', onItemClick); 
  
  var menu11001 = new Ext.menu.Menu({ id: 'mainMenu', items: [    ] });
  var item1105 = menu11001.add({ text: 'ویرایش مشخصات پرسنل', iconCls: 'Css1105',
  url: 'http://192.168.1.254/FrmPresentation/App_Pages/BaseInfo/Person/ModifyPerson.aspx'  });
  item1105.on('click', onItemClick); 
  
  var item1109 = menu11001.add({ text: 'تعریف مدیر سیستم', iconCls: 'bmenu',  menu: menu1109  });
  var item1101 = menu11001.add({ text: 'تعريف گروه کاري', iconCls: 'Css1101',
  url: 'http://192.168.1.254/FrmPresentation/App_Pages/BaseInfo/Group/DefineGroup.aspx'  });
  item1101.on('click', onItemClick); var menu11002 = new Ext.menu.Menu({ id: 'mainMenu', items: [    ] });
  var item1107 = menu11002.add({ text: 'تعریف واحد سازمانی', iconCls: 'Css1107',
  url: 'http://192.168.1.254/FrmPresentation/App_Pages/BaseInfo/OrganizationChart/OrganChart.aspx'  });
  item1107.on('click', onItemClick); var menu13001 = new Ext.menu.Menu({ id: 'mainMenu', items: [    ] });
  
  var item1302 = menu13001.add({ text: 'گزارش کارکرد روزانه', iconCls: 'Css1302',  url: ''  }); 
  item1302.on('click', onItemClick); var item1422 = menu13001.add({ text: 'گزارش کارکرد ماهانه',
  iconCls: 'Css1422',  url: 'http://192.168.1.254/TAPresentation/App_Pages/Reports/MainMonthlyReport.aspx'  }); 
  
  item1422.on('click', onItemClick);  var tb = new Ext.Toolbar();  
  
  tb.render('toolbar3'); tb.add( { text:'منویی وجود ندارد', iconCls: 'bmenu'  }  ); 
  var tb = new Ext.Toolbar();  tb.render('toolbar2'); tb.add( { text:'گزارشات', iconCls: 'bmenu',  menu: menu13001 }
  );  var tb = new Ext.Toolbar();  tb.render('toolbar1'); tb.add( { text:'گروه کاری', iconCls: 'bmenu',
  menu: menu11001 } ,{ text:'واحد سازمانی', iconCls: 'bmenu',  menu: menu11002 }  );  
 
 var tb = new Ext.Toolbar();  
 tb.render('toolbar2'); 
 tb.add( { text:'گزارشات', iconCls: 'bmenu',  menu: menu13001 }  ); 
  var tb = new Ext.Toolbar();  tb.render('toolbar3'); tb.add(  ); 
  });



  function onItemClick(item) {
      alert(1)
  } 
    

   

