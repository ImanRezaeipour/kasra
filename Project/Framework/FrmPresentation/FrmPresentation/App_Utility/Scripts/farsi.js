﻿var lang = 1;	// 1: Farsi, 0: English

//0x0633, 0x0633, 0x0633, 0x0633, 0x0633, 0x0633, 0x0633, 0x0633,
var farsikey = [
   0x0020, 0x0021,     34,     35,     36, 0x066A, 0x060C, 0x06AF,
   0x0029, 0x0028, 0x00D7, 0x002B, 0x0648, 0x002D, 0x002E, 0x002F,
   0x06F0, 0x06F1, 0x06F2, 0x06F3, 0x06F4, 0x06F5, 0x06F6, 0x06F7,
   0x06F8, 0x06F9, 0x003A, 0x0643, 0x003E, 0x003D, 0x003C, 0x061F,
       64, 0x0624, 0x200C, 0x0698, 0x064A, 0x064D, 0x0625, 0x0623,
   0x0622, 0x0651, 0x0629, 0x060C, 0x061B, 0x0621, 0x004E, 0x005D,
   0x005B, 0x0652, 0x064B, 0x0626, 0x064F, 0x064E, 0x0056, 0x064C,
   0x0058, 0x0650, 0x0643, 0x062C, 0x0698, 0x0686, 0x003A, 0x0640,
   0x067E, 0x0634, 0x0630, 0x0632,   1610, 0x062B, 0x0628, 0x0644,
   0x0627, 0x0647, 0x062A, 0x0646, 0x0645, 0x0626, 0x062F, 0x062E,
   0x062D, 0x0636, 0x0642, 0x0633, 0x0641, 0x0639, 0x0631, 0x0635,
   0x0637, 0x063A, 0x0638, 0x007D, 0x007C, 0x007B, 0x007E
];

// on Alt+Shift, switch language
function FKeyDown() {
    //alert(lang)
   if (window.event.shiftKey && window.event.altKey) { 
      if (lang == 0) {
         lang = 1;
         window.defaultStatus = "Farsi Mode";
      }
      else {
         lang = 0;
         window.defaultStatus = "English Mode";
      }
      return false;
   }
   return true;
}

// change the Farsi
function FKeyPress()
{
   var key = window.event.keyCode;
   // Avoid processing if control or higher than ASCII (i.e., in Arabic Windows)
   if (key < 0x0020 || key >= 0x00FF)
      return;
   if (lang == 1) { //If Farsi
      if (key == 0x0020 && window.event.shiftKey) // Shift-space -> ZWNJ
         window.event.keyCode = 0x200C;
      else
         window.event.keyCode = farsikey[key - 0x0020];
   }
   return true;
}
