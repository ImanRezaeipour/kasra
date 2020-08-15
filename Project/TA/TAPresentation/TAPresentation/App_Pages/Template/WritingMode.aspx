<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WritingMode.aspx.cs" Inherits="TAPresentation.App_Pages.Template.WritingMode" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>writing-mode Attribute</TITLE>
<LINK rel="stylesheet" type="text/css" href="samplesSDKIE4.css">
<STYLE type="text/css">
    .clsHorizLR 		{ writing-mode:lr-tb }
    .clsHorizRL         { writing-mode:rl-tb }
    .clsVertTB          { writing-mode:tb-rl }
    .clsVertBT          { writing-mode:bt-rl }
</STYLE>
</HEAD>
<!--TOOLBAR_START-->
<!--TOOLBAR_EXEMPT-->
<!--TOOLBAR_END-->

<BODY>

<H1>writing-mode Attribute</H1>

<P>This example shows how to use the <B>writing-mode</B> attribute to 
display horizontal text (<SPAN>lr-tb</SPAN>) within vertical text 
(<SPAN>tb-rl</SPAN>).</P>

<P>The following <B>DIV</B> element has a <B>writing-mode</B> of tb-rl
and contains text and <B>SPAN</B> child elements. The text flow alternates
between vertical and horizontal. Note the effect of the <B>BR</B> element
after the second set of vertical text.</P>

<DIV STYLE="writing-mode:tb-rl">
First Set of Vertical Text
<SPAN CLASS="clsHorizLR">First Set of Horizontal Text</SPAN>
Second Set of Vertical Text plus a line break<BR>
<SPAN STYLE="writing-mode:lr-tb">Second Set of Horizontal Text</SPAN>
Third Set of Vertical Text
<SPAN CLASS="clsHorizLR">Third Set of Horizontal Text</SPAN>
</DIV>
<P>This example shows how to use the new <B>writing-mode</B> attribute to 
display horizontal text (<SPAN>rl-tb</SPAN>).
<DIV CLASS="clsHorizRL">
Fourth Set of Horizontal Text
</DIV>
<P>This example makes use of the new <B>writing-mode</B> attribute to 
display vertical text (<SPAN>bt-rl</SPAN>).
<DIV CLASS="clsVertBT">
Fourth Set of Vertical Text
</DIV>
</DIV>

<!-- START_PAGE_FOOTER -->
<BR><BR><BR>
<p class="viewsource">[Right-click and choose View Source from the shortcut menu.] </p>
<A class="copyright" HREF="http://www.microsoft.com/isapi/gomscom.asp?TARGET=/info/cpyright.htm">&copy; 2007 Microsoft Corporation. All rights reserved. Terms of use.</A>
<!-- END_PAGE_FOOTER -->
</DIV>
</BODY>
</HTML>
