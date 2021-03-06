Use Framework
Go

Create VIEW [Att].[RowedAttendance]
AS
------------  T1:قبل از تردد عادی ورود							<div  style="float:right" class="InColor">
------------  T2:قبل از تردد مدیرسیستمی ورود					<div  style="float:right" class="ManagerColor">
------------  T3:قبل از تردد کاربری ورود						<div  style="float:right" class="UserColor">
------------  T4:بعد از تردد									&nbsp;</div>
------------  T5:قبل از تردد عادی خروج							<div  style="float:right" class="OutColor">
------------  T6:قبل از تردد مدیرسیستمی خروج					<div  style="float:right" class="ManagerColor">
------------  T7:قبل از تردد کاربری خروج						<div  style="float:right" class="UserColor">
SELECT  
    personelid--,InOutColor
    , date
    , replace(RIGHT(min(RTRIM(inout)), LEN(min(RTRIM(inout))) - 20),'00:00','--:--')  AS inout
    , replace(RIGHT(min(RTRIM(InOutColor)), LEN(min(RTRIM(InOutColor))) - 20),'00:00','--:--')  AS InOutColor
    , replace(RIGHT(min(RTRIM(InOutComplete )), LEN(min(RTRIM(InOutComplete ))) - 20),'00:00','--:--')  AS InOutComplete
    
    FROM 
            (
            SELECT 
                  personelid
                  ,date
                  ,RIGHT('000000000000000' + CAST(rowNo AS varchar(20)) + '     ', 20)+InOut AS inout
                  ,RIGHT('000000000000000' + CAST(rowNo AS varchar(20)) + '     ', 20)+InOutColor AS InOutColor
                  ,RIGHT('000000000000000' + CAST(rowNo AS varchar(20)) + '     ', 20)+InOutComplete  AS InOutComplete 
            FROM 
                  (
                  SELECT --ROW_NUMBER() OVER(ORDER BY vs1,vs2,vs3) as rowNo,
                  right('00000'+replace(isnull(CAST(vs1 as varchar(10)),''),'-','0'),5)+right('00000'+replace(isnull(CAST(vs2 as varchar(10)),''),'-','0'),5)+right('00000'+replace(isnull(CAST(vs3 as varchar(10)),''),'-','0'),5) as rowNo,
                        personelid
                        ,date
                        ,isnull(case when s1=e1 then '--:--' else att.ntt(ABS(s1))+LateStatus1+In1Day end + '  ' +ISNULL(att.ntt(ABS(e1))+Status1+out1Day ,'--:--'),'') + '  ' 
                                                                     +isnull(case when s2=e2 then '--:--' else att.ntt(ABS(s2))+In2Day end + '  ' + ISNULL(att.ntt(ABS(e2))+Status2+out2Day, '--:--'),'') + '  ' 
                                               +isnull(case when s3=e3 then '--:--' else att.ntt(ABS(s3))+In3Day end + '  ' + ISNULL(att.ntt(ABS(e3))+Status3+out1Day, '--:--'),'') + '  '
                                               +isnull(case when s4=e4 then '--:--' else att.ntt(ABS(s4))+In4Day end + '  ' + ISNULL(att.ntt(ABS(e4))+Status4+out1Day, '--:--'),'') + '  '
                                               +isnull(case when s5=e5 then '--:--' else att.ntt(ABS(s5))+In5Day end + '  ' + ISNULL(att.ntt(ABS(e5))+Status5+out1Day, '--:--'),'') + '  '
                                               +isnull(case when s6=e6 then '--:--' else att.ntt(ABS(s6))+In6Day end + '  ' + ISNULL(att.ntt(ABS(e6))+Status6+out1Day, '--:--'),'') + '  '
                                               +isnull(case when s7=e7 then '--:--' else att.ntt(ABS(s7))+In7Day end + '  ' + ISNULL(att.ntt(ABS(e7))+Status7+out1Day, '--:--'),'') + '  '
                                               +isnull(case when s8=e8 then '--:--' else att.ntt(ABS(s8))+In8Day end + '  ' + ISNULL(att.ntt(ABS(e8))+Status8+out1Day, '--:--'),'') + '  '
                                               +isnull(case when s9=e9 then '--:--' else att.ntt(ABS(s9))+In9Day end + '  ' + ISNULL(att.ntt(ABS(e9))+Status9+out1Day, '--:--'),'') + '  '
                                               +isnull(case when s10=e10 then '--:--' else att.ntt(ABS(s10))+In10Day end + '  ' + ISNULL(att.ntt(ABS(e10))+Status10+out1Day, '--:--'),'')+'  ' 
                                               +isnull(case when s11=e11 then '--:--' else att.ntt(ABS(s11))+In11Day end + '  ' + ISNULL(att.ntt(ABS(e11))+Status11+out1Day, '--:--'),'')+'  ' 
                                               +isnull(case when s12=e12 then '--:--' else att.ntt(ABS(s12))+In12Day end + '  ' + ISNULL(att.ntt(ABS(e12))+Status12+out1Day, '--:--'),'')+'  ' 
                                               +isnull(case when s13=e13 then '--:--' else att.ntt(ABS(s13))+In13Day end + '  ' + ISNULL(att.ntt(ABS(e13))+Status13+out1Day, '--:--'),'')+'  ' 
                                               +isnull(case when s14=e14 then '--:--' else att.ntt(ABS(s14))+In14Day end + '  ' + ISNULL(att.ntt(ABS(e14))+Status14+out1Day, '--:--'),'')+'  ' 
                                               +isnull(case when s15=e15 then '--:--' else att.ntt(ABS(s15))+In15Day end + '  ' + ISNULL(att.ntt(ABS(e15))+Status15+out1Day, '--:--'),'')+'  ' 
                                               +isnull(case when s16=e16 then '--:--' else att.ntt(ABS(s16))+In16Day end + '  ' + ISNULL(att.ntt(ABS(e16))+Status16+out1Day, '--:--'),'')+'  ' 
                                               +isnull(case when s17=e17 then '--:--' else att.ntt(ABS(s17))+In17Day end + '  ' + ISNULL(att.ntt(ABS(e17))+Status17+out1Day, '--:--'),'')+'  ' 
                                               +isnull(case when s18=e18 then '--:--' else att.ntt(ABS(s18))+In18Day end + '  ' + ISNULL(att.ntt(ABS(e18))+Status18+out1Day, '--:--'),'')+'  ' 
                                               +isnull(case when s19=e19 then '--:--' else att.ntt(ABS(s19))+In19Day end + '  ' + ISNULL(att.ntt(ABS(e19))+Status19+out1Day, '--:--'),'')+'  ' 
                                               +isnull(case when s20=e20 then '--:--' else att.ntt(ABS(s20))+In20Day end + '  ' + ISNULL(att.ntt(ABS(e20))+Status20+out1Day, '--:--'),'')
                                               
                                               AS InOut
                                               
                        ,isnull(case when s1=e1 then '--:--' else (case when sk1>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s1)) when sk1=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s1)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s1)) end) end+'&nbsp;</div>' + '  ' +ISNULL((case when ek1>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e1)) when ek1=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e1)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e1)) end),'--:--'),'')+'&nbsp;</div>' + '  ' 
                        --+isnull(case when s2=e2 then '--:--' else att.ntt(ABS(s2)) end + '  ' + ISNULL(att.ntt(ABS(e2)), '--:--'),'') + '  ' 
                        +isnull(case when s2=e2 then '--:--' else (case when sk2>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s2)) when sk2=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s2)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s2)) end) end+(case when s2 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek2>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e2)) when ek2=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e2)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e2)) end),'--:--'),'')+(case when s2 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        --+isnull(case when s3=e3 then '--:--' else att.ntt(ABS(s3)) end + '  ' + ISNULL(att.ntt(ABS(e3)), '--:--'),'') 
                        +isnull(case when s3=e3 then '--:--' else (case when sk3>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s3)) when sk3=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s3)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s3)) end) end+(case when s3 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek3>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e3)) when ek3=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e3)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e3)) end),'--:--'),'')+(case when s3 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s4=e4 then '--:--' else (case when sk4>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s4)) when sk4=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s4)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s4)) end) end+(case when s4 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek4>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e4)) when ek4=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e4)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e4)) end),'--:--'),'')+(case when s4 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s5=e5 then '--:--' else (case when sk5>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s5)) when sk5=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s5)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s5)) end) end+(case when s5 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek5>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e5)) when ek5=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e5)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e5)) end),'--:--'),'')+(case when s5 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s6=e6 then '--:--' else (case when sk6>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s6)) when sk6=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s6)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s6)) end) end+(case when s6 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek6>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e6)) when ek6=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e6)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e6)) end),'--:--'),'')+(case when s6 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s7=e7 then '--:--' else (case when sk7>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s7)) when sk7=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s7)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s7)) end) end+(case when s7 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek7>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e7)) when ek7=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e7)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e7)) end),'--:--'),'')+(case when s7 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s8=e8 then '--:--' else (case when sk8>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s8)) when sk8=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s8)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s8)) end) end+(case when s8 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek8>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e8)) when ek8=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e8)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e8)) end),'--:--'),'')+(case when s8 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s9=e9 then '--:--' else (case when sk9>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s9)) when sk9=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s9)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s9)) end) end+(case when s9 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek9>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e9)) when ek9=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e9)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e9)) end),'--:--'),'')+(case when s9 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s10=e10 then '--:--' else (case when sk10>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s10)) when sk10=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s10)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s10)) end) end+(case when s10 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek10>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e10)) when ek10=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e10)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e10)) end),'--:--'),'')+(case when s10 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s11=e11 then '--:--' else (case when sk11>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s11)) when sk11=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s11)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s11)) end) end+(case when s11 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek11>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e11)) when ek11=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e11)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e11)) end),'--:--'),'')+(case when s11 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s12=e12 then '--:--' else (case when sk12>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s12)) when sk12=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s12)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s12)) end) end+(case when s12 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek12>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e12)) when ek12=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e12)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e12)) end),'--:--'),'')+(case when s12 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s13=e13 then '--:--' else (case when sk13>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s13)) when sk13=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s13)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s13)) end) end+(case when s13 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek13>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e13)) when ek13=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e13)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e13)) end),'--:--'),'')+(case when s13 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s14=e14 then '--:--' else (case when sk14>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s14)) when sk14=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s14)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s14)) end) end+(case when s14 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek14>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e14)) when ek14=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e14)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e14)) end),'--:--'),'')+(case when s14 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s15=e15 then '--:--' else (case when sk15>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s15)) when sk15=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s15)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s15)) end) end+(case when s15 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek15>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e15)) when ek15=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e15)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e15)) end),'--:--'),'')+(case when s15 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s16=e16 then '--:--' else (case when sk16>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s16)) when sk16=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s16)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s16)) end) end+(case when s16 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek16>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e16)) when ek16=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e16)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e16)) end),'--:--'),'')+(case when s16 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s17=e17 then '--:--' else (case when sk17>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s17)) when sk17=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s17)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s17)) end) end+(case when s17 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek17>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e17)) when ek17=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e17)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e17)) end),'--:--'),'')+(case when s17 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s18=e18 then '--:--' else (case when sk18>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s18)) when sk18=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s18)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s18)) end) end+(case when s18 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek18>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e18)) when ek18=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e18)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e18)) end),'--:--'),'')+(case when s18 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s19=e19 then '--:--' else (case when sk19>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s19)) when sk19=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s19)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s19)) end) end+(case when s19 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek19>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e19)) when ek19=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e19)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e19)) end),'--:--'),'')+(case when s19 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        +isnull(case when s20=e20 then '--:--' else (case when sk20>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s20)) when sk20=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s20)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s20)) end) end+(case when s20 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek20>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e20)) when ek20=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e20)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e20)) end),'--:--'),'')+(case when s20 is not null then '&nbsp;</div>' else '' end) + '  ' 
                        AS InOutColor            
                        ,(case when sk1 is null then '' when sk1>0 then '1,' when sk1=-9 then '3,' else '2,' end) +isnull(case when s1=e1 then '--:--' else att.ntt(ABS(s1))+LateStatus1+In1Day end+isnull('#'+sk1+'/1;','')+(case when ek1>0 then '1,' when ek1=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e1))+Status1+out1Day,'--:--'),'')+isnull('#'+ek1+'/2;','') 
                        +(case when sk2 is null then '' when sk2>0 then '1,' when sk2=-9 then '3,' else '2,' end) +isnull(case when s2=e2 then '--:--' else att.ntt(ABS(s2))+In2Day end+isnull('#'+sk2+'/1;','')+(case when ek2>0 then '1,' when ek2=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e2))+Status2+out2Day,'--:--'),'')+isnull('#'+ek2+'/2;','')
                        +(case when sk3 is null then '' when sk3>0 then '1,' when sk3=-9 then '3,' else '2,' end) +isnull(case when s3=e3 then '--:--' else att.ntt(ABS(s3))+In3Day end+isnull('#'+sk3+'/1;','')+(case when ek3>0 then '1,' when ek3=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e3))+Status3+out3Day,'--:--'),'')+isnull('#'+ek3+'/2;','')
                        +(case when sk4 is null then '' when sk4>0 then '1,' when sk4=-9 then '3,' else '2,' end) +isnull(case when s4=e4 then '--:--' else att.ntt(ABS(s4))+In4Day end+isnull('#'+sk4+'/1;','')+(case when ek4>0 then '1,' when ek4=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e4))+Status4+out4Day,'--:--'),'')+isnull('#'+ek4+'/2;','')
                        +(case when sk5 is null then '' when sk5>0 then '1,' when sk5=-9 then '3,' else '2,' end) +isnull(case when s5=e5 then '--:--' else att.ntt(ABS(s5))+In5Day end+isnull('#'+sk5+'/1;','')+(case when ek5>0 then '1,' when ek5=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e5))+Status5+out5Day,'--:--'),'')+isnull('#'+ek5+'/2;','')
                        +(case when sk6 is null then '' when sk6>0 then '1,' when sk6=-9 then '3,' else '2,' end) +isnull(case when s6=e6 then '--:--' else att.ntt(ABS(s6))+In6Day end+isnull('#'+sk6+'/1;','')+(case when ek6>0 then '1,' when ek6=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e6))+Status6+out6Day,'--:--'),'')+isnull('#'+ek6+'/2;','')
                        +(case when sk7 is null then '' when sk7>0 then '1,' when sk7=-9 then '3,' else '2,' end) +isnull(case when s7=e7 then '--:--' else att.ntt(ABS(s7))+In7Day end+isnull('#'+sk7+'/1;','')+(case when ek7>0 then '1,' when ek7=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e7))+Status7+out7Day,'--:--'),'')+isnull('#'+ek7+'/2;','')
                        +(case when sk8 is null then '' when sk8>0 then '1,' when sk8=-9 then '3,' else '2,' end) +isnull(case when s8=e8 then '--:--' else att.ntt(ABS(s8))+In8Day end+isnull('#'+sk8+'/1;','')+(case when ek8>0 then '1,' when ek8=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e8))+Status8+out8Day,'--:--'),'')+isnull('#'+ek8+'/2;','')
                        +(case when sk9 is null then '' when sk9>0 then '1,' when sk9=-9 then '3,' else '2,' end) +isnull(case when s9=e9 then '--:--' else att.ntt(ABS(s9))+In9Day end+isnull('#'+sk9+'/1;','')+(case when ek9>0 then '1,' when ek9=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e9))+Status9+out9Day,'--:--'),'')+isnull('#'+ek9+'/2;','')
                        +(case when sk10 is null then '' when sk10>0 then '1,' when sk10=-9 then '3,' else '2,' end) +isnull(case when s10=e10 then '--:--' else att.ntt(ABS(s10))+In10Day end+isnull('#'+sk10+'/1;','')+(case when ek10>0 then '1,' when ek10=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e10))+Status10+out10Day,'--:--'),'')+isnull('#'+ek10+'/2;','')
                        +(case when sk11 is null then '' when sk11>0 then '1,' when sk11=-9 then '3,' else '2,' end) +isnull(case when s11=e11 then '--:--' else att.ntt(ABS(s11))+In11Day end+isnull('#'+sk11+'/1;','')+(case when ek11>0 then '1,' when ek11=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e11))+Status11+out11Day,'--:--'),'')+isnull('#'+ek11+'/2;','')
                        +(case when sk12 is null then '' when sk12>0 then '1,' when sk12=-9 then '3,' else '2,' end) +isnull(case when s12=e12 then '--:--' else att.ntt(ABS(s12))+In12Day end+isnull('#'+sk12+'/1;','')+(case when ek12>0 then '1,' when ek12=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e12))+Status12+out12Day,'--:--'),'')+isnull('#'+ek12+'/2;','')
                        +(case when sk13 is null then '' when sk13>0 then '1,' when sk13=-9 then '3,' else '2,' end) +isnull(case when s13=e13 then '--:--' else att.ntt(ABS(s13))+In13Day end+isnull('#'+sk13+'/1;','')+(case when ek13>0 then '1,' when ek13=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e13))+Status13+out13Day,'--:--'),'')+isnull('#'+ek13+'/2;','')
                        +(case when sk14 is null then '' when sk14>0 then '1,' when sk14=-9 then '3,' else '2,' end) +isnull(case when s14=e14 then '--:--' else att.ntt(ABS(s14))+In14Day end+isnull('#'+sk14+'/1;','')+(case when ek14>0 then '1,' when ek14=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e14))+Status14+out14Day,'--:--'),'')+isnull('#'+ek14+'/2;','')
                        +(case when sk15 is null then '' when sk15>0 then '1,' when sk15=-9 then '3,' else '2,' end) +isnull(case when s15=e15 then '--:--' else att.ntt(ABS(s15))+In15Day end+isnull('#'+sk15+'/1;','')+(case when ek15>0 then '1,' when ek15=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e15))+Status15+out15Day,'--:--'),'')+isnull('#'+ek15+'/2;','')
                        +(case when sk16 is null then '' when sk16>0 then '1,' when sk16=-9 then '3,' else '2,' end) +isnull(case when s16=e16 then '--:--' else att.ntt(ABS(s16))+In16Day end+isnull('#'+sk16+'/1;','')+(case when ek16>0 then '1,' when ek16=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e16))+Status16+out16Day,'--:--'),'')+isnull('#'+ek16+'/2;','')
                        +(case when sk17 is null then '' when sk17>0 then '1,' when sk17=-9 then '3,' else '2,' end) +isnull(case when s17=e17 then '--:--' else att.ntt(ABS(s17))+In17Day end+isnull('#'+sk17+'/1;','')+(case when ek17>0 then '1,' when ek17=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e17))+Status17+out17Day,'--:--'),'')+isnull('#'+ek17+'/2;','')
                        +(case when sk18 is null then '' when sk18>0 then '1,' when sk18=-9 then '3,' else '2,' end) +isnull(case when s18=e18 then '--:--' else att.ntt(ABS(s18))+In18Day end+isnull('#'+sk18+'/1;','')+(case when ek18>0 then '1,' when ek18=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e18))+Status18+out18Day,'--:--'),'')+isnull('#'+ek18+'/2;','')
                        +(case when sk19 is null then '' when sk19>0 then '1,' when sk19=-9 then '3,' else '2,' end) +isnull(case when s19=e19 then '--:--' else att.ntt(ABS(s19))+In19Day end+isnull('#'+sk19+'/1;','')+(case when ek19>0 then '1,' when ek19=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e19))+Status19+out19Day,'--:--'),'')+isnull('#'+ek19+'/2;','')
                        +(case when sk20 is null then '' when sk20>0 then '1,' when sk20=-9 then '3,' else '2,' end) +isnull(case when s20=e20 then '--:--' else att.ntt(ABS(s20))+In20Day end+isnull('#'+sk20+'/1;','')+(case when ek20>0 then '1,' when ek20=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e20))+Status20+out20Day,'--:--'),'')+isnull('#'+ek20+'/2;','')
                        AS InOutComplete
                  FROM 
                        (
                        SELECT 
                              p1.personelid,p1.VStartTime vs1,p2.VStartTime vs2,p3.VStartTime vs3 ,p4.VStartTime vs4 ,p5.VStartTime vs5 ,p6.VStartTime vs6 ,p7.VStartTime vs7 ,p8.VStartTime vs8 ,p9.VStartTime vs9
                              ,p1.date
                              ,(p1.VStarttime + 1440) % 1440 AS s1
                              ,(p1.Vendtime   + 1440) % 1440 AS e1
                              ,(p2.VStarttime + 1440) % 1440 AS s2
                              ,(p2.Vendtime   + 1440) % 1440 AS e2
                              ,(p3.VStarttime + 1440) % 1440 AS s3
                              ,(p3.Vendtime   + 1440) % 1440 AS e3
                              ,(p4.VStarttime + 1440) % 1440 AS s4
                              ,(p4.Vendtime   + 1440) % 1440 AS e4
                              ,(p5.VStarttime + 1440) % 1440 AS s5
                              ,(p5.Vendtime   + 1440) % 1440 AS e5
                              ,(p6.VStarttime + 1440) % 1440 AS s6
                              ,(p6.Vendtime   + 1440) % 1440 AS e6
                              ,(p7.VStarttime + 1440) % 1440 AS s7
                              ,(p7.Vendtime   + 1440) % 1440 AS e7
                              ,(p8.VStarttime + 1440) % 1440 AS s8
                              ,(p8.Vendtime   + 1440) % 1440 AS e8
                              ,(p9.VStarttime + 1440) % 1440 AS s9
                              ,(p9.Vendtime   + 1440) % 1440 AS e9
                              ,(p10.VStarttime + 1440) % 1440 AS s10
                              ,(p10.Vendtime   + 1440) % 1440 AS e10
                              ,(p11.VStarttime + 1440) % 1440 AS s11
                              ,(p11.Vendtime   + 1440) % 1440 AS e11
                              ,(p12.VStarttime + 1440) % 1440 AS s12
                              ,(p12.Vendtime   + 1440) % 1440 AS e12
                              ,(p13.VStarttime + 1440) % 1440 AS s13
                              ,(p13.Vendtime   + 1440) % 1440 AS e13
                              ,(p14.VStarttime + 1440) % 1440 AS s14
                              ,(p14.Vendtime   + 1440) % 1440 AS e14
                              ,(p15.VStarttime + 1440) % 1440 AS s15
                              ,(p15.Vendtime   + 1440) % 1440 AS e15
                              ,(p16.VStarttime + 1440) % 1440 AS s16
                              ,(p16.Vendtime   + 1440) % 1440 AS e16
                              ,(p17.VStarttime + 1440) % 1440 AS s17
                              ,(p17.Vendtime   + 1440) % 1440 AS e17
                              ,(p18.VStarttime + 1440) % 1440 AS s18
                              ,(p18.Vendtime   + 1440) % 1440 AS e18
                              ,(p19.VStarttime + 1440) % 1440 AS s19
                              ,(p19.Vendtime   + 1440) % 1440 AS e19
                              ,(p20.VStarttime + 1440) % 1440 AS s20
                              ,(p20.Vendtime   + 1440) % 1440 AS e20
                              ,cast(p1.scardkhanNO as varchar(30)) as sk1
                              ,cast(p1.ecardkhanNO as varchar(30)) as ek1
                              ,cast(p2.scardkhanNO as varchar(30)) as sk2
                              ,cast(p2.ecardkhanNO as varchar(30)) as ek2
                              ,cast(p3.scardkhanNO as varchar(30)) as sk3
                              ,cast(p3.ecardkhanNO as varchar(30)) as ek3
                              ,cast(p4.scardkhanNO as varchar(30)) as sk4
                              ,cast(p4.ecardkhanNO as varchar(30)) as ek4
                              ,cast(p5.scardkhanNO as varchar(30)) as sk5
                              ,cast(p5.ecardkhanNO as varchar(30)) as ek5
                              ,cast(p6.scardkhanNO as varchar(30)) as sk6
                              ,cast(p6.ecardkhanNO as varchar(30)) as ek6
                              ,cast(p7.scardkhanNO as varchar(30)) as sk7
                              ,cast(p7.ecardkhanNO as varchar(30)) as ek7
                              ,cast(p8.scardkhanNO as varchar(30)) as sk8
                              ,cast(p8.ecardkhanNO as varchar(30)) as ek8
                              ,cast(p9.scardkhanNO as varchar(30)) as sk9
                              ,cast(p9.ecardkhanNO as varchar(30)) as ek9
                              ,cast(p10.scardkhanNO as varchar(30)) as sk10
                              ,cast(p10.ecardkhanNO as varchar(30)) as ek10
                              ,cast(p11.scardkhanNO as varchar(30)) as sk11
                              ,cast(p11.ecardkhanNO as varchar(30)) as ek11
                              ,cast(p12.scardkhanNO as varchar(30)) as sk12
                              ,cast(p12.ecardkhanNO as varchar(30)) as ek12
                              ,cast(p13.scardkhanNO as varchar(30)) as sk13
                              ,cast(p13.ecardkhanNO as varchar(30)) as ek13
                              ,cast(p14.scardkhanNO as varchar(30)) as sk14
                              ,cast(p14.ecardkhanNO as varchar(30)) as ek14
                              ,cast(p15.scardkhanNO as varchar(30)) as sk15
                              ,cast(p15.ecardkhanNO as varchar(30)) as ek15
                              ,cast(p16.scardkhanNO as varchar(30)) as sk16
                              ,cast(p16.ecardkhanNO as varchar(30)) as ek16
                              ,cast(p17.scardkhanNO as varchar(30)) as sk17
                              ,cast(p17.ecardkhanNO as varchar(30)) as ek17
                              ,cast(p18.scardkhanNO as varchar(30)) as sk18
                              ,cast(p18.ecardkhanNO as varchar(30)) as ek18
                              ,cast(p19.scardkhanNO as varchar(30)) as sk19
                              ,cast(p19.ecardkhanNO as varchar(30)) as ek19
                              ,cast(p20.scardkhanNO as varchar(30)) as sk20
                              ,cast(p20.ecardkhanNO as varchar(30)) as ek20
                              ,isnull(c.Acronym,'') as LateStatus1
                              ,isnull(c1.Acronym ,'') as Status1
                              ,isnull(c2.Acronym ,'') as Status2
                              ,isnull(c3.Acronym ,'') as Status3
                              ,isnull(c4.Acronym ,'') as Status4
                              ,isnull(c5.Acronym ,'') as Status5
                              ,isnull(c6.Acronym ,'') as Status6
                              ,isnull(c7.Acronym ,'') as Status7
                              ,isnull(c8.Acronym ,'') as Status8
                              ,isnull(c9.Acronym ,'') as Status9
                              ,isnull(c10.Acronym ,'') as Status10
                              ,isnull(c11.Acronym ,'') as Status11
                              ,isnull(c12.Acronym ,'') as Status12
                              ,isnull(c13.Acronym ,'') as Status13
                              ,isnull(c14.Acronym ,'') as Status14
                              ,isnull(c15.Acronym ,'') as Status15
                              ,isnull(c16.Acronym ,'') as Status16
                              ,isnull(c17.Acronym ,'') as Status17
                              ,isnull(c18.Acronym ,'') as Status18
                              ,isnull(c19.Acronym ,'') as Status19
                              ,isnull(c20.Acronym ,'') as Status20
				,case when p1.starttime <0 then '»' when p1.starttime>1439 then '«' else '' end In1Day,case when p1.endtime <0 then '»' when p1.endtime>1439 then '«' else '' end out1Day
				,case when p2.starttime <0 then '»' when p2.starttime>1439 then '«' else '' end In2Day,case when p2.endtime <0 then '»' when p2.endtime>1439 then '«' else '' end out2Day
				,case when p3.starttime <0 then '»' when p3.starttime>1439 then'«' else '' end In3Day,case when p3.endtime <0 then '»' when p3.endtime>1439 then '«' else '' end out3Day
				,case when p4.starttime <0 then '»' when p4.starttime>1439 then'«' else '' end In4Day,case when p4.endtime <0 then '»' when p4.endtime>1439 then '«' else '' end out4Day
				,case when p5.starttime <0 then '»' when p5.starttime>1439 then'«' else '' end In5Day,case when p5.endtime <0 then '»' when p5.endtime>1439 then '«' else '' end out5Day
				,case when p6.starttime <0 then '»' when p6.starttime>1439 then'«' else '' end In6Day,case when p6.endtime <0 then '»' when p6.endtime>1439 then '«' else '' end out6Day
				,case when p7.starttime <0 then '»' when p7.starttime>1439 then'«' else '' end In7Day,case when p7.endtime <0 then '»' when p7.endtime>1439 then '«' else '' end out7Day
				,case when p8.starttime <0 then '»' when p8.starttime>1439 then'«' else '' end In8Day,case when p8.endtime <0 then '»' when p8.endtime>1439 then '«' else '' end out8Day
				,case when p9.starttime <0 then '»' when p9.starttime>1439 then'«' else '' end In9Day,case when p9.endtime <0 then '»' when p9.endtime>1439 then '«' else '' end out9Day
				,case when p10.starttime <0 then '»' when p10.starttime>1439 then'«' else '' end In10Day,case when p10.endtime <0 then '»' when p10.endtime>1439 then '«' else '' end out10Day
				,case when p11.starttime <0 then '»' when p11.starttime>1439 then'«' else '' end In11Day,case when p11.endtime <0 then '»' when p11.endtime>1439 then '«' else '' end out11Day
				,case when p12.starttime <0 then '»' when p12.starttime>1439 then'«' else '' end In12Day,case when p12.endtime <0 then '»' when p12.endtime>1439 then '«' else '' end out12Day
				,case when p13.starttime <0 then '»' when p13.starttime>1439 then'«' else '' end In13Day,case when p13.endtime <0 then '»' when p13.endtime>1439 then '«' else '' end out13Day
				,case when p14.starttime <0 then '»' when p14.starttime>1439 then'«' else '' end In14Day,case when p14.endtime <0 then '»' when p14.endtime>1439 then '«' else '' end out14Day
				,case when p15.starttime <0 then '»' when p15.starttime>1439 then'«' else '' end In15Day,case when p15.endtime <0 then '»' when p15.endtime>1439 then '«' else '' end out15Day
				,case when p16.starttime <0 then '»' when p16.starttime>1439 then'«' else '' end In16Day,case when p16.endtime <0 then '»' when p16.endtime>1439 then '«' else '' end out16Day
				,case when p17.starttime <0 then '»' when p17.starttime>1439 then'«' else '' end In17Day,case when p17.endtime <0 then '»' when p17.endtime>1439 then '«' else '' end out17Day
				,case when p18.starttime <0 then '»' when p18.starttime>1439 then'«' else '' end In18Day,case when p18.endtime <0 then '»' when p18.endtime>1439 then '«' else '' end out18Day
				,case when p19.starttime <0 then '»' when p19.starttime>1439 then'«' else '' end In19Day,case when p19.endtime <0 then '»' when p19.endtime>1439 then '«' else '' end out19Day
				,case when p20.starttime <0 then '»' when p20.starttime>1439 then'«' else '' end In20Day,case when p20.endtime <0 then '»' when p20.endtime>1439 then '«' else '' end out20Day
                        FROM  att.PairedAttendnce AS p1 
                        LEFT OUTER JOIN att.PairedAttendnce AS p2 ON p1.personelid = p2.personelid AND p1.date = p2.date AND p1.Starttime < p2.Starttime 
                        LEFT OUTER JOIN att.PairedAttendnce AS p3 ON p2.personelid = p3.personelid AND p2.date = p3.date AND p2.Starttime < p3.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p4 ON p3.personelid = p4.personelid AND p3.date = p4.date AND p3.Starttime < p4.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p5 ON p4.personelid = p5.personelid AND p4.date = p5.date AND p4.Starttime < p5.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p6 ON p5.personelid = p6.personelid AND p5.date = p6.date AND p5.Starttime < p6.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p7 ON p6.personelid = p7.personelid AND p6.date = p7.date AND p6.Starttime < p7.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p8 ON p7.personelid = p8.personelid AND p7.date = p8.date AND p7.Starttime < p8.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p9 ON p8.personelid = p9.personelid AND p8.date = p9.date AND p8.Starttime < p9.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p10 ON p9.personelid = p10.personelid AND p9.date = p10.date AND p9.Starttime < p10.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p11 ON p10.personelid = p11.personelid AND p10.date = p11.date AND p10.Starttime < p11.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p12 ON p11.personelid = p12.personelid AND p11.date = p12.date AND p11.Starttime < p12.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p13 ON p12.personelid = p13.personelid AND p12.date = p13.date AND p12.Starttime < p13.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p14 ON p13.personelid = p14.personelid AND p13.date = p14.date AND p13.Starttime < p14.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p15 ON p14.personelid = p15.personelid AND p14.date = p15.date AND p14.Starttime < p15.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p16 ON p15.personelid = p16.personelid AND p15.date = p16.date AND p15.Starttime < p16.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p17 ON p16.personelid = p17.personelid AND p16.date = p17.date AND p16.Starttime < p17.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p18 ON p17.personelid = p18.personelid AND p17.date = p18.date AND p17.Starttime < p18.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p19 ON p18.personelid = p19.personelid AND p18.date = p19.date AND p18.Starttime < p19.Starttime
                        LEFT OUTER JOIN att.PairedAttendnce AS p20 ON p19.personelid = p20.personelid AND p19.date = p20.date AND p19.Starttime < p20.Starttime
                        Left Join att.Code c on c.CodeID=p1.LateStatus 
                        Left Join att.Code c1 on c1.CodeID=p1.Status 
                        Left Join att.Code c2 on c2.CodeID=p2.Status 
                        Left Join att.Code c3 on c3.CodeID=p3.Status 
                        Left Join att.Code c4 on c4.CodeID=p4.Status 
                        Left Join att.Code c5 on c5.CodeID=p5.Status 
                        Left Join att.Code c6 on c6.CodeID=p6.Status 
                        Left Join att.Code c7 on c7.CodeID=p7.Status 
                        Left Join att.Code c8 on c8.CodeID=p8.Status 
                        Left Join att.Code c9 on c9.CodeID=p9.Status 
                        Left Join att.Code c10 on c10.CodeID=p10.Status 
                        Left Join att.Code c11 on c11.CodeID=p11.Status 
                        Left Join att.Code c12 on c12.CodeID=p12.Status 
                        Left Join att.Code c13 on c13.CodeID=p13.Status 
                        Left Join att.Code c14 on c14.CodeID=p14.Status 
                        Left Join att.Code c15 on c15.CodeID=p15.Status 
                        Left Join att.Code c16 on c16.CodeID=p16.Status 
                        Left Join att.Code c17 on c17.CodeID=p17.Status 
                        Left Join att.Code c18 on c18.CodeID=p18.Status 
                        Left Join att.Code c19 on c19.CodeID=p19.Status 
                        Left Join att.Code c20 on c20.CodeID=p20.Status 
                        where 
                        --p1.PersonelID=790005 and
                        --p1.date='90/03/18' and 
                        --isnull(p1.Starttime,0)<>0 and isnull(p1.endtime,0)<>0            
                        not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime<p1.Starttime )        
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p1.Starttime and Starttime<p2.Starttime )        
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p2.Starttime and Starttime<p3.Starttime )        
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p3.Starttime and Starttime<p4.Starttime )        
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p4.Starttime and Starttime<p5.Starttime )        
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p5.Starttime and Starttime<p6.Starttime )        
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p6.Starttime and Starttime<p7.Starttime )        
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p7.Starttime and Starttime<p8.Starttime )        
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p8.Starttime and Starttime<p9.Starttime ) 
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p10.Starttime and Starttime<p11.Starttime )        
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p11.Starttime and Starttime<p12.Starttime )        
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p12.Starttime and Starttime<p13.Starttime )        
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p13.Starttime and Starttime<p14.Starttime )        
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p14.Starttime and Starttime<p15.Starttime )        
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p15.Starttime and Starttime<p16.Starttime )        
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p16.Starttime and Starttime<p17.Starttime )        
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p17.Starttime and Starttime<p18.Starttime )        
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p18.Starttime and Starttime<p19.Starttime )
                        and not exists(select * from att.PairedAttendnce where PersonelID=p1.PersonelID and date=p1.date and Starttime>p19.Starttime and Starttime<p20.Starttime )
                        )AS tbl1 
                  ) AS tbl2
            ) AS tbl3
GROUP BY personelid, date

Go

Create Function [Att].[udfGetOnlineUserPersonelAccess]
(
	@OnlineUesrID int,
	@PersonID int=null,
	@GroupID int=null,
	@ScheduleID int=null,
	@DepartmentID int=null,
	@SessionID int=null,
	@CompanyFinatialPeriodID int=Null,	--شناسه سال مالي فعال
	@MenuItemId int=Null,
	@chkChildren int=null
)
returns @SelectedPerson table(PersonID int, DisplayName nvarchar(100), Code nchar(10))
As
Begin
	--declare @OnlineUesrID int,
	--@PersonID int,
	--@GroupID int,
	--@ScheduleID int,
	--@DepartmentID int=null,
	--@SessionID int,
	--@CompanyFinatialPeriodID int=Null	--شناسه سال مالي فعال
	--,@MenuItemId int=1306
	--,@chkChildren int=null
	
	--Select	@OnlineUesrID=1008,
	--		@SessionID=60229, 
	--		@CompanyFinatialPeriodID=4
	--		,@GroupID=null
	--		,@ScheduleID=null
	--------------------------------------
	--Declare @SelectedPerson Table(PersonID int, DisplayName nvarchar(100), Code nchar(10))
	--------------------------------------------
	Declare	
			@RoleId					int,
			@RoleTypeIntVal			int,
			@OnLineUserDepartmentID int,
			@CurDate				nvarchar(10),
			@CompanyID				int,		--شناسه شرکت 
			@Value					int=Pkg.udfGetOption(Null, Null, 131, N'HierarchyShow', Null)--نمايش سلسله مراتبي اطلاعات پرسنل زيرمجموعه						

	Select @CompanyID=CompanyID 
		From Pub.Company_FinatialPeriod PubCoFP
		Where PubCoFP.ID=@CompanyFinatialPeriodID

	Select	@CurDate=right(Gnr.MiladiToShamsi(GETDATE()),8)
			
	if(@MenuItemId=NUll or isnull(@MenuItemId,0)=0)		
		set @MenuItemId=1306
if not exists(select * from  Framework..AccessRole AR where AR.type=25 and AR.ParentRoleId=@MenuItemId)
set @MenuItemId=1306
	Select	@RoleTypeIntVal=IntVal,
			@OnLineUserDepartmentID=DP.DepartmentID  
	from vDepartmentPosition DP
	inner join vDepartmentPersonel DPS on DP.RoleID=DPS.RoleID 
	inner join dbo.DLookup DL on DP.RoleType=DL.[ID] and GrpID=11
	where PersonID=@OnlineUesrID

	If not @SessionID is null
		Select	@OnlineUesrID=(Select  Sec.udfGetOnlineUser(@SessionID))
	
	Select @RoleId=RoleId from vDepartmentPersonel where vDepartmentPersonel.PersonId=@OnlineUesrID

	If @MenuItemID=999999  --حالت پرسنل جانشين
	Begin
		Insert Into @SelectedPerson
		(PersonID)
		select PersonID 
		from vDepartmentPersonel 
			where exists
			(
				Select RoleID 
				From Hmr.DepartmentPosition DPos
						Inner Join Pub.Department D on DPos.DepartmentID=D.DepartmentID
				where exists (Select DepartmentID from dbo.DeptChildren(@OnLineUserDepartmentID) where DepartmentID=D.DepartmentID) 
					and IsNull(D.CompanyID, @CompanyID)=@CompanyID
					and DPos.Active=1 and D.Active=1 and RoleID=vDepartmentPersonel.roleid
				union all
				Select RoleID 
				From Hmr.DepartmentPosition DPos
						Inner Join Pub.Department D on DPos.DepartmentID=D.DepartmentID
				inner join dbo.DLookup DL on DPos.RoleType=DL.[ID] and GrpID=11 --and DL.IntVal>@RoleTypeIntVal
				where D.DepartmentID=@OnLineUserDepartmentID 	
					and IsNull(D.CompanyID, @CompanyID)=@CompanyID 
					and DPos.Active=1 and D.Active=1 and RoleID=vDepartmentPersonel.roleid
			 )	
	End		 
	Else
	Begin
		If exists(
				select distinct MA.MemberId ,AR.Name,MA.Type
				from dbo.MemberAccess MA join dbo.AccessRole AR on AR.RoleId=MA.Accessid
																and AR.type=25 
																and AR.ParentRoleId=@MenuItemId
				where (((MA.MemberId=@OnlineUesrID and MA.Type in('U','R')) 
						--or(MA.MemberId=@RoleId and MA.Type='R')
						or( exists (select GroupId from dbo.GroupMember GM where GM.MemberId=@OnlineUesrID and GroupId=MA.MemberId) and MA.Type='G')))
					and Name like '%AllPK%'
				)	
			Insert Into @SelectedPerson
			(PersonID)
			Select	P.ID
			From prs.Person	P
				Inner Join hmr.DepartmentPersonel DPrs on P.ID=DPrs.PersonID
			Where P.Active=1
					and P.[Type]=1
					and DPrs._flags=0
					
		Else
		Begin
			If exists(select * from Att.TableOfficePerson where UserPersonID=@OnlineUesrID )--and exists(select * from dbo.GroupMember where GroupId in (4) and MemberId=@OnlineUesrID))	
				Insert Into @SelectedPerson
				(PersonID)
				Select distinct	PersonID
				From Att.TableOfficePerson
				Where UserPersonID=@OnlineUesrID
				and not exists (select * from @SelectedPerson ss where Att.TableOfficePerson.PersonID=ss.PersonID)
				
			If (Select DL.IntVal From Hmr.DepartmentPosition DPos inner join DLookup DL on DPos.RoleType=DL.[ID] and GrpID=11
						Where RoleId=@RoleId and Active=1)
					= (Select min(DL.IntVal) From Hmr.DepartmentPosition DPos inner join DLookup DL on DPos.RoleType=DL.[ID] and GrpID=11
							Where DepartmentID=@OnLineUserDepartmentID and Active=1)	
			Begin	
				Insert Into @SelectedPerson
				(PersonID)	
				select PersonID 
				from vDepartmentPersonel DPrs
					where exists--RoleID in 
					(
						Select RoleID 
						From Hmr.DepartmentPosition DPos
								Inner Join Pub.Department D on DPos.DepartmentID=D.DepartmentID
						where exists(Select * from dbo.DeptChildren(@OnLineUserDepartmentID) where DepartmentID =D.DepartmentID ) 
							and IsNull(D.CompanyID, @CompanyID)=@CompanyID
							and DPos.Active=1 and D.Active=1 and DPos.RoleID=DPrs.RoleID
						union all
						Select RoleID 
						From Hmr.DepartmentPosition DPos
								Inner Join Pub.Department D on DPos.DepartmentID=D.DepartmentID
						inner join dbo.DLookup DL on DPos.RoleType=DL.[ID] and GrpID=11 and DL.IntVal>@RoleTypeIntVal
						where D.DepartmentID=@OnLineUserDepartmentID 	
							and IsNull(D.CompanyID, @CompanyID)=@CompanyID 
							and DPos.Active=1 and D.Active=1 and DPos.RoleID=DPrs.RoleID
					 )	
					 and not Exists(Select * From @SelectedPerson Where PersonID=DPrs.PersonID)
					 --and PersonID=@OnlineUesrID 
					
					If not Exists(Select * From @SelectedPerson Where PersonID=@OnlineUesrID)
						Insert Into @SelectedPerson
						(PersonID)	 
						Select @OnlineUesrID
				End 
				Else
				Begin	
					If @Value=0 --هر فرد بدون توجه به محل وي در چارت، فقط خودش راببيند
						Insert Into @SelectedPerson
						(PersonID)	
						select PersonID 
						from vDepartmentPersonel 
							where exists--RoleID in 
							(
								Select RoleID 
								From Hmr.DepartmentPosition DPos
										Inner Join Pub.Department D on DPos.DepartmentID=D.DepartmentID
								inner join dbo.DLookup DL on DPos.RoleType=DL.[ID] and GrpID=11 --and DL.IntVal>@RoleTypeIntVal
								where D.DepartmentID=@OnLineUserDepartmentID 	
									and IsNull(D.CompanyID, @CompanyID)=@CompanyID 
									and DPos.Active=1 and D.Active=1 and RoleID=vDepartmentPersonel.RoleID
							 )	
							 and not Exists(Select * From @SelectedPerson Where PersonID=vDepartmentPersonel.PersonID)
							 and PersonID=@OnlineUesrID 
						 
					If @Value=1 --هرکس با توجه به سمتش درچارت، افراد زيرمجموعه اش را ببيند 
					Begin
						Insert Into @SelectedPerson
						(PersonID)	
						select PersonID 
						from vDepartmentPersonel 
							where exists--RoleID in 
							(
								Select RoleID 
								From Hmr.DepartmentPosition DPos
										Inner Join Pub.Department D on DPos.DepartmentID=D.DepartmentID
								inner join dbo.DLookup DL on DPos.RoleType=DL.[ID] and GrpID=11 and DL.IntVal>@RoleTypeIntVal
								where D.DepartmentID=@OnLineUserDepartmentID 	
									and IsNull(D.CompanyID, @CompanyID)=@CompanyID 
									and DPos.Active=1 and D.Active=1 and RoleID=vDepartmentPersonel.RoleID
							 )	
							 and not Exists(Select * From @SelectedPerson Where PersonID=vDepartmentPersonel.PersonID)
							 --and PersonID=@OnlineUesrID
							  	 
						If not Exists(Select * From @SelectedPerson Where PersonID=@OnlineUesrID)
							Insert Into @SelectedPerson
							(PersonID)	 
							Select @OnlineUesrID	
					End		 
				End   
			     
				--If exists(
				--	select distinct MA.MemberId ,AR.Name,MA.Type
				--	from dbo.MemberAccess MA join dbo.AccessRole AR on AR.RoleId=MA.Accessid
				--													and AR.type=25 
				--													and AR.ParentRoleId=@MenuItemId
				--	where ((MA.MemberId=@OnlineUesrID and MA.Type='U') 
				--			or(MA.MemberId=@RoleId and MA.Type='R')
				--			or(MA.MemberId in (select GroupId from dbo.GroupMember GM where GM.MemberId=@OnlineUesrID) and MA.Type='G'))
				--		and Name like '%DirectView%'
				--	)	
					
			
				If exists(
					select distinct MA.MemberId ,AR.Name,MA.Type
					from dbo.MemberAccess MA join dbo.AccessRole AR on AR.RoleId=MA.Accessid
																	and AR.type=25 
																	and AR.ParentRoleId=@MenuItemId
					where (((MA.MemberId=@OnlineUesrID and MA.Type in('U','R')) 
							--or(MA.MemberId=@RoleId and MA.Type='R')
							or(exists (select GroupId from dbo.GroupMember GM where GM.MemberId=@OnlineUesrID and GroupID=MA.MemberId) and MA.Type='G')))
						and Name like '%WithoutSelf%'
					)	
					Delete From @SelectedPerson Where PersonID=@OnlineUesrID
		End
		
		--فيلتر واحد سازماني
		If not @DepartmentID is null and isnull(@DepartmentID,0)<>0 and Isnull(@chkChildren, 0)<>1
			Delete From @SelectedPerson 
			Where not Exists
						(
							Select *
							From 
							(
								Select DPrs.PersonID PID 
								From Hmr.DepartmentPersonel DPrs
										Inner Join Hmr.DepartmentPosition DPos on DPrs.RoleID=DPos.RoleID
								Where	DPrs._flags=0
										And DPos._Flags=0
										And DPos.DepartmentID=@DepartmentID
								)	tt	
									Where PersonID=tt.PID
						)
		--نمايش افراد در واحدهاي زيرمجموعه				
		If not @DepartmentID is null and isnull(@DepartmentID,0)<>0 and Isnull(@chkChildren, 0)=1
			Delete From @SelectedPerson 
			Where not Exists
						(
							Select *
							From 
							(
								Select DPrs.PersonID PID 
								From Hmr.DepartmentPersonel DPrs
										Inner Join Hmr.DepartmentPosition DPos on DPrs.RoleID=DPos.RoleID
								Where	DPrs._flags=0
										And DPos._Flags=0
										And DPos.DepartmentID=@DepartmentID
								Union All
								Select DPrs.PersonID PID 
								From Hmr.DepartmentPersonel DPrs
										Inner Join Hmr.DepartmentPosition DPos on DPrs.RoleID=DPos.RoleID
								Where	DPrs._flags=0
										And DPos._Flags=0
										And DPos.DepartmentID in (Select DepartmentID From deptChildren(@DepartmentID))
								)	tt	
									Where PersonID=tt.PID
						)
			

		--فيلتر شماره پرسنلي				
		If not @PersonID is null and isnull(@PersonID,0)<>0
			Delete From @SelectedPerson Where PersonID<>@PersonID
									
		--فيلتر گروه
		If not @GroupID is null and isnull(@GroupID,0)<>0
			Delete From @SelectedPerson 
			Where not Exists
						(		
							Select	*
							From Att.GroupPerson GP
							Where 	@CurDate between SDate And EDate
									and GroupID=@GroupID
									and PersonID=GP.PersonelID
						)	
			
		--فيلتر شيفت		
		If not @ScheduleID is null and isnull(@ScheduleID,0)<>0
			Delete From @SelectedPerson 
			Where not Exists
						(	
							Select	*
							From Att.GroupPerson GP
									Inner Join Att.ScheduleGroup SG on GP.GroupID=SG.GroupID
									Inner Join Att.Schedule S on S.ScheduleID=SG.ScheduleID
							Where 	@CurDate between SDate And EDate
									and S.ScheduleID=@ScheduleID
									and PersonID=GP.PersonelID
						)
	End								
		
	Delete from @SelectedPerson
	where ISNULL(PersonID,0)=0
			
	Update		@SelectedPerson
	Set	DisplayName=P.DisplayName,
		Code=P.Code
	From Prs.Person P
	Where P.ID=PersonID	
	
	--Select * From @SelectedPerson	
			
	return
End							

Go

Create Function [Att].[FRowedAttendance](@Spid int,@epid int,@sdate varchar(10),@edate varchar(10))
returns @tbl table(personelid int,date varchar(10),inout varchar(max),inoutcolor varchar(max),inoutcomplete varchar(max))
AS
begin
	-- Dehghan 920631
------------  T1:قبل از تردد عادی ورود							<div  style="float:right" class="InColor">
------------  T2:قبل از تردد مدیرسیستمی ورود					<div  style="float:right" class="ManagerColor">
------------  T3:قبل از تردد کاربری ورود						<div  style="float:right" class="UserColor">
------------  T4:بعد از تردد									&nbsp;</div>
------------  T5:قبل از تردد عادی خروج							<div  style="float:right" class="OutColor">
------------  T6:قبل از تردد مدیرسیستمی خروج					<div  style="float:right" class="ManagerColor">
------------  T7:قبل از تردد کاربری خروج						<div  style="float:right" class="UserColor">
;with pds as (select personelid,date from att.persondatestructure 
	Where personelid between @spid and @epid 
		and [Date] between @sdate and @edate
	group by  personelid,date)
insert @tbl
select personelid,date,inout,inoutcolor,case when inoutComplete='' then null else inoutComplete end inoutComplete from(
	select personelid,date
	,isnull(left([1],charindex('$',[1],1)-1),'')+'  '+isnull(left([2],charindex('$',[2],1)-1),'')+'  '+isnull(left([3],charindex('$',[3],1)-1),'')+'  '+isnull(left([4],charindex('$',[4],1)-1),'')+'  '+isnull(left([5],charindex('$',[5],1)-1),'')+'  '+isnull(left([6],charindex('$',[6],1)-1),'')+'  '+isnull(left([7],charindex('$',[7],1)-1),'')+isnull(left([8],charindex('$',[8],1)-1),'')+'  '+isnull(left([9],charindex('$',[9],1)-1),'') inout
	,isnull(SUBSTRING([1],charindex('$',[1],1)+1,charindex('^',[1],1)-charindex('$',[1],1)-1),'')+'  '+isnull(SUBSTRING([2],charindex('$',[2],1)+1,charindex('^',[2],1)-charindex('$',[2],1)-1),'')+'  '+isnull(SUBSTRING([3],charindex('$',[3],1)+1,charindex('^',[3],1)-charindex('$',[3],1)-1),'')+'  '+isnull(SUBSTRING([4],charindex('$',[4],1)+1,charindex('^',[4],1)-charindex('$',[4],1)-1),'')+'  '+isnull(SUBSTRING([5],charindex('$',[5],1)+1,charindex('^',[5],1)-charindex('$',[5],1)-1),'')+'  '+isnull(SUBSTRING([6],charindex('$',[6],1)+1,charindex('^',[6],1)-charindex('$',[6],1)-1),'')+'  '+isnull(SUBSTRING([7],charindex('$',[7],1)+1,charindex('^',[7],1)-charindex('$',[7],1)-1),'')+isnull(SUBSTRING([8],charindex('$',[8],1)+1,charindex('^',[8],1)-charindex('$',[8],1)-1),'')+'  '+isnull(SUBSTRING([9],charindex('$',[9],1)+1,charindex('^',[9],1)-charindex('$',[9],1)-1),'') inoutColor
	,isnull(right([1],len([1])-charindex('^',[1],1)),'')+'  '+isnull(right([2],len([2])-charindex('^',[2],1)),'')+'  '+isnull(right([3],len([3])-charindex('^',[3],1)),'')+'  '+isnull(right([4],len([4])-charindex('^',[4],1)),'')+'  '+isnull(right([5],len([5])-charindex('^',[5],1)),'')+'  '+isnull(right([6],len([6])-charindex('^',[6],1)),'')+'  '+isnull(right([7],len([7])-charindex('^',[7],1)),'')+isnull(right([8],len([8])-charindex('^',[8],1)),'')+'  '+isnull(right([9],len([9])-charindex('^',[9],1)),'') inoutComplete
	from
	(
	select ROW_NUMBER() over( partition by pds.personelid,pds.date order by pds.personelid,pds.DATE,pa.vstarttime) as r,pds.personelid,pds.date,isnull(case when pa.VStartTime=pa.VEndTime then '--:--' else gnr.ntt((pa.VStartTime+1440*100)%1440) end+'  '+isnull(gnr.ntt((pa.VEndTime+1440*100)%1440),'--:--'),'') 
	+'$'+case when scardkhanno>0 then '<div  style="float:right" class="InColor">'+att.ntt((vstarttime+1440*100)%1440) when scardkhanno=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt((vstarttime+1440*100)%1440) else '<div  style="float:right" class="UserColor">'+att.ntt((vstarttime+1440*100)%1440) end+'&nbsp;</div>' + '  ' +ISNULL((case when ecardkhanno>0 then '<div  style="float:right" class="OutColor">'+isnull(att.ntt((endtime+1440*100)%1440),'') when ecardkhanno=-9 then '<div  style="float:right" class="ManagerColor">'+isnull(att.ntt((vendtime+1440*100)%1440),'') else '<div  style="float:right" class="UserColor">'+isnull(att.ntt((vendtime+1440*100)%1440),'') end),'')+'&nbsp;</div>' + '  '  
	+'^'+(case when scardkhanno is null then '' when scardkhanno>0 then '1,' when scardkhanno=-9 then '3,' else '2,' end) +isnull(case when vstarttime=VEndTime then '--:--' else att.ntt((vstarttime+1440*100)%1440)+isnull(c.Acronym,'')+case when vstarttime <0 then '»' when vstarttime>1439 then '«' else '' end end+isnull('#'+cast(scardkhanno as varchar(10))+'/1;','')+isnull((case when ecardkhanno>0 then '1,' when ecardkhanno=-9 then '3,' else '2,' end)+case when VEndTime IS null then '--:--' else att.ntt((VEndTime+1440*100)%1440) end,'')+ISNULL(c1.Acronym,'')+case when vendtime <0 then '»' when vendtime>1439 then '«' else '' end,'')+isnull('#'+cast(ecardkhanno as varchar(20))+'/2;','') InOut
	from pds left join 
	att.PairedAttendnce pa on pds.personelid=pa.personelid and pds.Date=pa.Date
    Left Join att.Code c on c.CodeID=LateStatus 
    Left Join att.Code c1 on c1.CodeID=Status 
	) as p
	pivot ( max(InOut) for r in([1],[2],[3],[4],[5],[6],[7],[8],[9]) ) t
	)TBL
	
return
End
go

Create VIEW [Att].[TOLRowedAttendance]
AS
------------  T1:قبل از تردد عادی ورود							<div  style="float:right" class="InColor">
------------  T2:قبل از تردد مدیرسیستمی ورود					<div  style="float:right" class="ManagerColor">
------------  T3:قبل از تردد کاربری ورود						<div  style="float:right" class="UserColor">
------------  T4:بعد از تردد									&nbsp;</div>
------------  T5:قبل از تردد عادی خروج							<div  style="float:right" class="OutColor">
------------  T6:قبل از تردد مدیرسیستمی خروج					<div  style="float:right" class="ManagerColor">
------------  T7:قبل از تردد کاربری خروج						<div  style="float:right" class="UserColor">
SELECT  
    personelid--,InOutColor
    , date
    , replace(RIGHT(min(RTRIM(inout)), LEN(min(RTRIM(inout))) - 20),'00:00','--:--')  AS inout
    , replace(RIGHT(min(RTRIM(InOutColor)), LEN(min(RTRIM(InOutColor))) - 20),'00:00','--:--')  AS InOutColor
    , replace(RIGHT(min(RTRIM(InOutComplete )), LEN(min(RTRIM(InOutComplete ))) - 20),'00:00','--:--')  AS InOutComplete
    
    FROM 
		(
		SELECT 
			personelid
			,date
			,RIGHT('000000000000000' + CAST(rowNo AS varchar(20)) + '     ', 20)+InOut AS inout
			,RIGHT('000000000000000' + CAST(rowNo AS varchar(20)) + '     ', 20)+InOutColor AS InOutColor
			,RIGHT('000000000000000' + CAST(rowNo AS varchar(20)) + '     ', 20)+InOutComplete  AS InOutComplete 
		FROM 
			(
			SELECT --ROW_NUMBER() OVER(ORDER BY vs1,vs2,vs3) as rowNo,
			right('00000'+replace(isnull(CAST(vs1 as varchar(10)),''),'-','0'),5)+right('00000'+replace(isnull(CAST(vs2 as varchar(10)),''),'-','0'),5)+right('00000'+replace(isnull(CAST(vs3 as varchar(10)),''),'-','0'),5) as rowNo,
				personelid
				,date
				,isnull(case when s1=e1 then '--:--' else att.ntt(ABS(s1))+In1Day end + '  ' +ISNULL(att.ntt(ABS(e1))+out1Day,'--:--'),'') + '  ' 
                                                                     +isnull(case when s2=e2 then '--:--' else att.ntt(ABS(s2))+In2Day end + '  ' + ISNULL(att.ntt(ABS(e2))+Out1Day, '--:--'),'') + '  ' 
                                               +isnull(case when s3=e3 then '--:--' else att.ntt(ABS(s3))+In3Day end + '  ' + ISNULL(att.ntt(ABS(e3))+Out3Day, '--:--'),'') AS InOut
                                               
				,isnull(case when s1=e1 then '--:--' else (case when sk1>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s1)) when sk1=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s1)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s1)) end) end+'&nbsp;</div>' + '  ' +ISNULL((case when ek1>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e1)) when ek1=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e1)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e1)) end),'--:--'),'')+'&nbsp;</div>' + '  ' 
				--+isnull(case when s2=e2 then '--:--' else att.ntt(ABS(s2)) end + '  ' + ISNULL(att.ntt(ABS(e2)), '--:--'),'') + '  ' 
				+isnull(case when s2=e2 then '--:--' else (case when sk2>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s2)) when sk2=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s2)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s2)) end) end+(case when s2 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek2>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e2)) when ek2=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e2)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e2)) end),'--:--'),'')+(case when s2 is not null then '&nbsp;</div>' else '' end) + '  ' 
				--+isnull(case when s3=e3 then '--:--' else att.ntt(ABS(s3)) end + '  ' + ISNULL(att.ntt(ABS(e3)), '--:--'),'') 
				+isnull(case when s3=e3 then '--:--' else (case when sk3>0 then '<div  style="float:right" class="InColor">'+att.ntt(ABS(s3)) when sk3=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(s3)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(s3)) end) end+(case when s3 is not null then '&nbsp;</div>' else '' end) + '  ' +ISNULL((case when ek3>0 then '<div  style="float:right" class="OutColor">'+att.ntt(ABS(e3)) when ek3=-9 then '<div  style="float:right" class="ManagerColor">'+att.ntt(ABS(e3)) else '<div  style="float:right" class="UserColor">'+att.ntt(ABS(e3)) end),'--:--'),'')+(case when s3 is not null then '&nbsp;</div>' else '' end) + '  ' 
				AS InOutColor	       
                ,(case when sk1 is null then '' when sk1>0 then '1,' when sk1=-9 then '3,' else '2,' end) +isnull(case when s1=e1 then '--:--' else att.ntt(ABS(s1))+LateStatus1+In1Day end+isnull('#'+sk1+'/1;','')+(case when ek1>0 then '1,' when ek1=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e1))+Status1+out1Day,'--:--'),'')+isnull('#'+ek1+'/2;','') 
                +(case when sk2 is null then '' when sk2>0 then '1,' when sk2=-9 then '3,' else '2,' end) +isnull(case when s2=e2 then '--:--' else att.ntt(ABS(s2))+In2Day end+isnull('#'+sk2+'/1;','')+(case when ek2>0 then '1,' when ek2=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e2))+Status2+out2Day,'--:--'),'')+isnull('#'+ek2+'/2;','')
                +(case when sk3 is null then '' when sk3>0 then '1,' when sk3=-9 then '3,' else '2,' end) +isnull(case when s3=e3 then '--:--' else att.ntt(ABS(s3))+In3Day end+isnull('#'+sk3+'/1;','')+(case when ek3>0 then '1,' when ek3=-9 then '3,' else '2,' end) +ISNULL(att.ntt(ABS(e3))+Status3+out3Day,'--:--'),'')+isnull('#'+ek3+'/2;','')
				AS InOutComplete
			FROM 
				(
				SELECT 
					p1.personelid,p1.StartTime vs1,p2.StartTime vs2,p3.StartTime vs3 
					,p1.date
					,(p1.StartTime + 1440) % 1440 AS s1, (p1.EndTime   + 1440) % 1440 AS e1,(p2.StartTime + 1440) % 1440 AS s2
					,(p2.EndTime   + 1440) % 1440 AS e2, (p3.StartTime + 1440) % 1440 AS s3,(p3.EndTime   + 1440) % 1440 AS e3
					,cast(p1.scardkhanNO as varchar(30)) as sk1
					,cast(p1.ecardkhanNO as varchar(30)) as ek1
					,cast(p2.scardkhanNO as varchar(30)) as sk2
					,cast(p2.ecardkhanNO as varchar(30)) as ek2
					,cast(p3.scardkhanNO as varchar(30)) as sk3
					,cast(p3.ecardkhanNO as varchar(30)) as ek3
		          ,isnull(c.Acronym,'') as LateStatus1
                  ,isnull(c1.Acronym ,'') as Status1
                  ,isnull(c2.Acronym ,'') as Status2
                  ,isnull(c3.Acronym ,'') as Status3
				,case when p1.starttime <0 then '»' when p1.starttime>1439 then '«' else '' end In1Day
				,case when p1.endtime <0 then '»' when p1.endtime>1439 then '«' else '' end out1Day
				,case when p2.starttime <0 then '»' when p2.starttime>1439 then '«' else '' end In2Day
				,case when p2.endtime <0 then '»' when p2.endtime>1439 then '«' else '' end out2Day
				,case when p3.starttime <0 then '»' when p3.starttime>1439 then'«' else '' end In3Day
				,case when p3.endtime <0 then '»' when p3.endtime>1439 then '«' else '' end out3Day

				FROM  att.PairedAttendnce AS p1 
				LEFT OUTER JOIN att.PairedAttendnce AS p2 ON p1.personelid = p2.personelid AND p1.date = p2.date AND p1.StartTime < p2.StartTime 
				LEFT OUTER JOIN att.PairedAttendnce AS p3 ON p3.personelid = p2.personelid AND p3.date = p2.date AND p2.StartTime < p3.StartTime
                Left Join att.Code c on c.CodeID=p1.LateStatus 
                Left Join att.Code c1 on c1.CodeID=p1.Status 
                Left Join att.Code c2 on c2.CodeID=p2.Status 
                Left Join att.Code c3 on c3.CodeID=p3.Status 
				where isnull(p1.StartTime,0)+isnull(p1.EndTime,0)<>0 
				)AS tbl1
			) AS tbl2
		) AS tbl3
GROUP BY personelid, date

Go



Create Function [Att].[udfCheckOverLapCredits]
	(
		@PersonID int,
		@StartDate nvarchar(10),
		@EndDate nvarchar(10),
		@StartTime int,
		@EndTime int,
		@Code varchar(5),
		@CreditID int
	)
Returns bit
As
Begin	
	--Declare @PersonID int,
	--		@StartDate nvarchar(10),
	--		@EndDate nvarchar(10),
	--		@StartTime int,
	--		@EndTime int,
	--		@Code varchar(5),
	--		@CreditID int
			
	--Select @PersonID =1284,
	--		@StartDate ='1389/05/09',
	--		@EndDate ='1389/05/09',
	--		@StartTime =450,
	--		@EndTime =869,
	--		@Code	=11011,
	--		@CreditID =18331
			
	Declare @Validate bit=1	
	If @CreditID Is null
		Set @CreditID=0
		
	--مجوزهاي ساعتي مازاد حضور	
	If @Validate=1
			And Exists(Select * From Att.CodeGroupCode 
					Where CodeID=@Code And 
					GroupCodeID =(Select CodeGroupID From Att.GroupCode Where CodeGroupAcronym='MazadeKar'))		
	Begin			
		If Exists(			
			Select	*
			From Att.Credit C
			Where (@StartDate between StartDate And EndDate
					OR @EndDate between StartDate And EndDate
					OR StartDate between @StartDate And @EndDate
					OR EndDate between @StartDate And @EndDate
				)
				And PersonelID=@PersonID
				And CreditID<>@CreditID
				And @StartTime<>0 And @EndTime<>0
				And (@StartTime between StartTime And EndTime-1
					OR @EndTime between StartTime+1 And EndTime
					OR StartTime between @StartTime And @EndTime-1
					OR EndTime between @StartTime+1 And @EndTime)
					and C.StatusID not in (204, 205)
				)
			Set @Validate = 0	
	End		
	
	--مجوزهاي کسر حضور روزانه		
	If @Validate=1 
		And Exists(Select * From Att.CodeGroupCode 
					Where CodeID=@Code And 
					GroupCodeID =(Select CodeGroupID From Att.GroupCode Where CodeGroupAcronym='Kasrkar'))
		And (@StartTime=0 And @EndTime=0)	
	Begin	
		If Exists(			
			Select	*
			From Att.Credit C
			Where (@StartDate between StartDate And EndDate
					OR @EndDate between StartDate And EndDate
					OR StartDate between @StartDate And @EndDate
					OR EndDate between @StartDate And @EndDate
				)
				And PersonelID=@PersonID
				And CreditID<>@CreditID
				And Exists(Select * From Att.CodeGroupCode 
					Where CodeID=C.Code And 
					GroupCodeID =(Select CodeGroupID From Att.GroupCode Where CodeGroupAcronym='Kasrkar'))
					and C.StatusID not in (204, 205)
				)
				
			Set @Validate = 0	
	End
		
	--مجوزهاي کسرحضور ساعتي	
	If @Validate=1 
		And Exists(Select * From Att.CodeGroupCode 
					Where CodeID=@Code And 
					GroupCodeID =(Select CodeGroupID From Att.GroupCode Where CodeGroupAcronym='Kasrkar'))				
	Begin
			If Exists(			
			Select	*
			From Att.Credit C
			Where (@StartDate between StartDate And EndDate
					OR @EndDate between StartDate And EndDate
					OR StartDate between @StartDate And @EndDate
					OR EndDate between @StartDate And @EndDate
				)
				And PersonelID=@PersonID
				And CreditID<>@CreditID
				and @StartTime<>0 And @EndTime<>0
				and (@StartTime between StartTime And EndTime-1
					OR @EndTime between StartTime+1 And EndTime
					OR StartTime between @StartTime And @EndTime-1
					OR EndTime between @StartTime+1 And @EndTime
					OR StartTime=0 And EndTime=0)
				And Exists(Select * From Att.CodeGroupCode 
					Where CodeID=C.Code And 
					GroupCodeID =(Select CodeGroupID From Att.GroupCode Where CodeGroupAcronym='Kasrkar'))
					and C.StatusID not in (204, 205)
				)
				
				Set @Validate = 0 
	End
		
	--مجوزهايي مثل کارت تردد	
	If @Validate=1 
		And Exists(Select * From Att.CodeGroupCode 
				Where CodeID=@Code And 
				GroupCodeID =(Select CodeGroupID From Att.GroupCode Where CodeGroupAcronym='UniqueTimeCode'))	
	Begin						 	
			If Exists(Select	*
						From Att.Credit C
						Where @StartDate=StartDate
							And PersonelID=@PersonID
							And Code=@Code
							And StartTime=@StartTime
							And CreditID<>@CreditID)	
							
				Set @Validate = 0 	
	End	
	
	--مجوزهايي مثل مداومتکاري		
	If @Validate=1 
		And Exists(Select * From Att.CodeGroupCode 
				Where CodeID=@Code And 
				GroupCodeID =(Select CodeGroupID From Att.GroupCode Where CodeGroupAcronym='UniqueDateCode')) 
	Begin			
		If Exists(Select	*
						From Att.Credit C
						Where @StartDate=StartDate
							And PersonelID=@PersonID
							And Code=@Code
							And CreditID<>@CreditID)	
							
				Set @Validate = 0 	
	End				

	--Select @Validate
	Return @Validate
End						

Go

Create Function [Prs].[udfGetOnlineUserPersonelAccess]
(
	@OnlineUesrID				int,
	@PersonID					int=null,
	@GroupID					int=null,
	@ScheduleID					int=null,
	@DepartmentID				int=null,
	@SessionID					int=null,
	@CompanyID					int=Null,	--شناسه شرکت 
	@MenuItemId					int=Null,
	@chkChildren				int=null,	--نمايش پرسنل زيرمجموعه؛ 1ونال يعني زيرمحموعه-0 يعني فقط واحدمورد نظر 
	@SDate						char(10),
	@EDate						char(10),
	@FromWPID					int =null,
	@ToWPID						int =null,
	@XmlParam					xml=null
)
returns @SelectedPerson table(PersonID int primary key, DisplayName nvarchar(100), Code nvarchar(30))
As
Begin
	--declare @OnlineUesrID int,
	--@PersonID int=0,
	--@GroupID int,
	--@ScheduleID int,
	--@DepartmentID int=2401,
	--@SessionID int,
	--@CompanyID int=Null	--شناسه سال مالي فعال
	--,@MenuItemId int=1306
	--,@chkChildren int=0,
	--@SDate						char(10)='1390/07/01',--'1390/06/01',
	--@EDate						char(10)='1390/07/30',--'1390/06/31',
	--@FromWPID					int =null,--18,
	--@ToWPID						int =null,--19
	--@XmlParam					xml=null--'<Param><CategoryGroupID></CategoryGroupID><WithoutSelf>1</WithoutSelf></Param>'
	
	--Select @OnlineUesrID=1025,@PersonID=null,@GroupID=null,@ScheduleID=null,@DepartmentID=0,
	--@SessionID=22924,@CompanyID=3,@MenuItemId=1306/*34168*/,@chkChildren=1 ,
	--@SDate='1390/11/17',@EDate='1390/11/17',@FromWPID=null,@ToWPID=null,
	--@XmlParam=null --'<Param><NotExitDate>1</NotExitDate></Param>'
	----@XmlParam='<Param><CategoryGroupID>0</CategoryGroupID><WithoutSelf>0</WithoutSelf><ShowManager>0</ShowManager></Param>'
	----------------------------------------
	--Declare @SelectedPerson Table(PersonID int, DisplayName nvarchar(100), Code nchar(10))
	------------------------------------------------
	Declare	
			@RoleId					int,
			@RoleTypeIntVal			int,
			@OnLineUserDepartmentID int,
			@CurDate				nvarchar(10),
			@EPK					int=1,		--دسترسي همه پرسنل يا پرسنل زيرمجموعه
			@MinRoleType			int,		--نوع کوچکترين سمت واحد
			@CntMinRoleType			int,		--تعداد کوچکترين سمت
			--@NewWFOValue			int=Pkg.udfGetOption(Null, Null, 111, N'NewWFO', Null),--کارتابل جديد فعال شده
			@Ismanager				tinyint=0,		--آيا فرد ارشد واحد است
			@LikeManager			int=0,			--آيا جزءگروه شبه هد است	
			@ShowManagerValue		int,			--نمايش مديران واحدهاي مستقيم
			@CategoryGroupID		int,			--دسته بندي گروهها
			@WithoutSelf			int	,			--نمايش همه بدون خود
			@NotExitDate			int,			--مقدار 1 برای در نظر نگرفتن تاریخ پایان کار 
			@AllPersView			smallint=Pkg.udfGetOption(Null, Null, 111, N'AllPersView', Null),	--نمايش کليه پرسنل جهت تفويض اختيار و پرسنل جانشين
			@FullTableOffice		smallint=Pkg.udfGetOption(Null, Null, 111, N'TableOfficeWithoutCompany', Null)	--دسترسي نمايش دفتر تابل بدون مالتي کمپاني
			
	If not @XmlParam is null
		Select	@CategoryGroupID=@XmlParam.value('(/Param/CategoryGroupID)[1]', 'int')	,
				@WithoutSelf=@XmlParam.value('(/Param/WithoutSelf)[1]', 'int'),
				@ShowManagerValue=@XmlParam.value('(/Param/ShowManager)[1]', 'int'),
				@NotExitDate=@XmlParam.value('(/Param/NotExitDate)[1]', 'int')
				
	if(@MenuItemId=NUll or isnull(@MenuItemId,0)=0)		
		set @MenuItemId=1306
	if (not exists(select * from  AccessRole AR 
				where AR.type=25 and AR.ParentRoleId=@MenuItemId)
				and @MenuItemId not in (999999, 888888))
	set @MenuItemId=1306
	
	----در صورتی که دسترسی ماهانه را نداشته باشد دسترسی همه پرسنل را بگیرد
	if @MenuItemId=1306 and not exists(	select distinct MA.MemberId ,AR.Name,MA.Type
				from dbo.MemberAccess MA join dbo.AccessRole AR on AR.RoleId=MA.Accessid
																--and AR.type=25 
																and AR.RoleId=@MenuItemId
				where (((MA.MemberId=@OnlineUesrID and MA.Type in('U','R')) 
						or( exists (select GroupId from dbo.GroupMember GM where GM.MemberId=@OnlineUesrID and GroupId=MA.MemberId) and MA.Type='G'))))
		Set @EPK=0			
	--دسترسي همه پرسنل يا پرسنل زيرمجموعه		
	If exists(
				select distinct MA.MemberId ,AR.Name,MA.Type
				from dbo.MemberAccess MA join dbo.AccessRole AR on AR.RoleId=MA.Accessid
																and AR.type=25 
																and AR.ParentRoleId=@MenuItemId
				where (((MA.MemberId=@OnlineUesrID and MA.Type in('U','R')) 
						--or(MA.MemberId=@RoleId and MA.Type='R')
						or( exists (select GroupId from dbo.GroupMember GM where GM.MemberId=@OnlineUesrID and GroupId=MA.MemberId) and MA.Type='G')))
					and Name like '%AllPK%'
				)
		Set	@EPK=0
	--=============================دسترسی کاربر مدیر تایم شیت==================================
	If Exists((Select * From dbo.GroupMember GM 
			inner join dbo.GroupTitle GT on GM.GroupId=GT.GroupID 
			Where GM.MemberId=@OnlineUesrID And GT.Acronym='TShAdmin') )
		Set @EPK=0	
	--===============================================================
	--دسترسي نمايش فقط کاربر فعال
	Else If exists(
				select distinct MA.MemberId ,AR.Name,MA.Type
				from dbo.MemberAccess MA join dbo.AccessRole AR on AR.RoleId=MA.Accessid
																and AR.type=25 
																and AR.ParentRoleId=@MenuItemId
				where (((MA.MemberId=@OnlineUesrID and MA.Type in('U','R')) 
						--or(MA.MemberId=@RoleId and MA.Type='R')
						or( exists (select GroupId from dbo.GroupMember GM where GM.MemberId=@OnlineUesrID and GroupId=MA.MemberId) and MA.Type='G')))
					and Name like '%ActPK%'
				)
		Set	@EPK=2		
		
		
	Select	@CurDate=right(Gnr.MiladiToShamsi(GETDATE()),8)
	--print 'aaaaaaaaaaaaaaaaaaa' + @EPK
	--تاريخ شروع و خاتمه مقدار نداشته باشد و براساس شناسه دوره فيلتر شود
	If Isnull(@SDate, '')=''   --@SDate is null
	Begin
		--براساس يک دوره
		If (not @FromWPID is null
			and @ToWPID is null)
			Select	@SDate=SDate,
					@EDate=EDate
			From Att.WorkPeriod
			Where WorkPeriodID=@FromWPID
		
		--براساس ازتاريخ 	
		If not @FromWPID is null
			and not @ToWPID is null	
		Begin
			Select	@SDate=SDate
			From Att.WorkPeriod
			Where WorkPeriodID=@FromWPID
			
			Select	@EDate=EDate
			From Att.WorkPeriod
			Where WorkPeriodID=@ToWPID
		End	
		
		--براساس تاريخ جاري
		If @FromWPID is null
		Begin
			Select	@SDate=SDate,
					@EDate=EDate
			From Att.WorkPeriod
			Where @CurDate between SDate and EDate
		End		
	End
	
	Select	@SDate=RIGHT(Ltrim(Rtrim(@SDate)), 8),
			@EDate=RIGHT(Ltrim(Rtrim(@EDate)), 8)		
--===============================================================
	If not @SessionID is null	--به دست آوردن onlineuser
		Select	@OnlineUesrID=(Select  Sec.udfGetOnlineUser(@SessionID))
		
	Select	@RoleTypeIntVal=IntVal,
			@OnLineUserDepartmentID=DP.DepartmentID  
	from vDepartmentPosition DP
	inner join vDepartmentPersonel DPS on DP.RoleID=DPS.RoleID 
	inner join dbo.DLookup DL on DP.RoleType=DL.[ID] and GrpID=11
	where PersonID=@OnlineUesrID
	--===============================================================
	--بررسي آيا فرد ارشد واحدخودهست يا خير	
	--If @NewWFOValue=1	--کارتابل جديد
		Select	@Ismanager=Isnull(head, 0)
		From Gnr.DeptLevel
		Where Personid=@OnlineUesrID
				and OwnDept=1
	
	--===============================================================
	If @Ismanager=0
		and Exists(Select * From Att.GroupPerson GP
						inner Join Att.[Group] G on GP.GroupID=G.GroupID
					Where G.Acronym='LikeMgr'	
						and GP.PersonelID=@OnlineUesrID
						and (StartDate between @SDate and @EDate
						Or EndDate between @SDate and @EDate
						Or @SDate between StartDate and EndDate
						Or @EDate between StartDate and EDate))
		Set @LikeManager=1
		
		
		
--===============================================================
	If @MenuItemID=999999  --حالت پرسنل جانشين
	Begin
		If @AllPersView=0
		Begin
			Insert Into @SelectedPerson
			(PersonID)
			select PersonID 
			from vDepartmentPersonel 
				where exists
				(
					Select RoleID 
					From Hmr.DepartmentPosition DPos
							Inner Join Pub.Department D on DPos.DepartmentID=D.DepartmentID
					where exists (Select DepartmentID from dbo.DeptChildren(@OnLineUserDepartmentID) where DepartmentID=D.DepartmentID) 
						--and IsNull(D.CompanyID, @CompanyID)=@CompanyID
						and DPos.Active=1 and D.Active=1 and RoleID=vDepartmentPersonel.roleid
						-- Hmr.EmployProperty
						and 
						 (not exists(Select * from Hmr.EmployProperty e where e.PersonnelID=vDepartmentPersonel.PersonID )
							or Exists(Select * from Hmr.EmployProperty e2 where e2.PersonnelID=vDepartmentPersonel.PersonID
								and exists(Select * from Hmr.EmployProperty e where e.PersonnelID=e2.PersonnelID 
								and (@sdate between right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) and right(isnull(e.ExitDate,'99/01/01'),8) )
									 union All
									 Select * from Hmr.EmployProperty e where e.PersonnelID=e2.PersonnelID
									 and (@edate between right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) and right(isnull(e.ExitDate,'99/01/01'),8))
									 union All
									 Select * from Hmr.EmployProperty e where e.PersonnelID=e2.PersonnelID
										and (right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) between @sdate and @EDate))
						))
					union all
					Select RoleID 
					From Hmr.DepartmentPosition DPos
							Inner Join Pub.Department D on DPos.DepartmentID=D.DepartmentID
					inner join dbo.DLookup DL on DPos.RoleType=DL.[ID] and GrpID=11 and DL.IntVal>=@RoleTypeIntVal
					where D.DepartmentID=@OnLineUserDepartmentID 	
						--and IsNull(D.CompanyID, @CompanyID)=@CompanyID 
						and DPos.Active=1 and D.Active=1 and RoleID=vDepartmentPersonel.roleid
						-- Hmr.EmployProperty
						and 
						 (not exists(Select * from Hmr.EmployProperty e where e.PersonnelID=vDepartmentPersonel.PersonID )
							or Exists(Select * from Hmr.EmployProperty e2 where e2.PersonnelID=vDepartmentPersonel.PersonID
								and exists(Select * from Hmr.EmployProperty e where e.PersonnelID=e2.PersonnelID 
								and (@sdate between right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) and right(isnull(e.ExitDate,'99/01/01'),8) )
									 union All
									 Select * from Hmr.EmployProperty e where e.PersonnelID=e2.PersonnelID
									 and (@edate between right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) and right(isnull(e.ExitDate,'99/01/01'),8))
									 union All
									 Select * from Hmr.EmployProperty e where e.PersonnelID=e2.PersonnelID
										and (right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) between @sdate and @EDate))
						))
				 )
		End	
		Else If @AllPersView=1
		Begin
			If @CompanyID=1
				Insert Into @SelectedPerson
				(PersonID)
				Select	P.ID
				From prs.Person	P
				Where P.[Type]=1 
					and P.Active=1
					-- Hmr.EmployProperty
						and 
						 (not exists(Select * from Hmr.EmployProperty e where e.PersonnelID=p.Id )
							or Exists(Select * from Hmr.EmployProperty e2 where e2.PersonnelID=p.Id 
								and exists(Select * from Hmr.EmployProperty e where e.PersonnelID=e2.PersonnelID 
								and (@sdate between right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) and right(isnull(e.ExitDate,'99/01/01'),8) )
									 union All
									 Select * from Hmr.EmployProperty e where e.PersonnelID=e2.PersonnelID
									 and (@edate between right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) and right(isnull(e.ExitDate,'99/01/01'),8))
									 union All
									 Select * from Hmr.EmployProperty e where e.PersonnelID=e2.PersonnelID
										and (right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) between @sdate and @EDate))
						))
			Else
				Insert Into @SelectedPerson
				(PersonID)
				Select	P.ID
				From prs.Person	P
				Where P.[Type]=1 
						and P.Active=1
						and P.CompanyID=@CompanyID
							-- Hmr.EmployProperty
						and 
						 (not exists(Select * from Hmr.EmployProperty e where e.PersonnelID=p.Id )
							or Exists(Select * from Hmr.EmployProperty e2 where e2.PersonnelID=p.Id 
								and exists(Select * from Hmr.EmployProperty e where e.PersonnelID=e2.PersonnelID 
								and (@sdate between right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) and right(isnull(e.ExitDate,'99/01/01'),8) )
									 union All
									 Select * from Hmr.EmployProperty e where e.PersonnelID=e2.PersonnelID
									 and (@edate between right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) and right(isnull(e.ExitDate,'99/01/01'),8))
									 union All
									 Select * from Hmr.EmployProperty e where e.PersonnelID=e2.PersonnelID
										and (right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) between @sdate and @EDate))
						))
				
		End	
		--Delete From @SelectedPerson Where PersonID=@OnlineUesrID	
	End
	Else If @MenuItemID=888888  --حالت نمايش کليه پرسنل بدون بررسي سمت
	Begin
		If @CompanyID=1
			Insert Into @SelectedPerson
			(PersonID)
			Select	P.ID
			From prs.Person	P
			Where P.[Type]=1 
				and P.Active=1
		Else
			Insert Into @SelectedPerson
			(PersonID)
			Select	P.ID
			From prs.Person	P
			Where P.[Type]=1 
					and P.Active=1
					and P.CompanyID=@CompanyID
	End
	--از ص ويرايش مشخصات پرسنل بايد بتواند همه حتي کساني که غيرفعال هم هستند را ببيند
	Else If @MenuItemId=1105 
	Begin
		If @EPK=0
		begin
			If @CompanyID=1
				Insert Into @SelectedPerson
				(PersonID)
				Select	P.ID
				From prs.Person	P
				Where P.[Type]=1 
			Else
				Insert Into @SelectedPerson
				(PersonID)
				Select	P.ID
				From prs.Person	P
				Where P.[Type]=1 
						and (Isnull(P.CompanyID, @CompanyID)=@CompanyID)	
		End
		Else If @EPK=1
		Begin
			Insert Into @SelectedPerson
				(PersonID)	
				select PersonID 
				From	Gnr.DeptLevel DL
				Where Dept=@OnLineUserDepartmentID
					and not Exists(Select * From @SelectedPerson Where PersonID=DL.PersonID)
				Union
				Select	ID
				From Prs.Person	 P
				Where	P.[Type]=1
						and P.Active=0
		End
		Else If @EPK=2
			Insert Into @SelectedPerson
			(PersonID)
			Select @OnlineUesrID
	End		 
	Else --If @MenuItemId<>1105 and @MenuItemId<>9999 and @MenuItemId<>888888 
	Begin
		If @EPK=0
		begin	
			If @CompanyID=1						
				Insert Into @SelectedPerson
				(PersonID)
				Select	P.ID
				From prs.Person	P
					Inner Join hmr.DepartmentPersonel DPrs on P.ID=DPrs.PersonID
				Where P.Active=1
						and P.[Type]=1
						and DPrs.Active=1
			Else
				Insert Into @SelectedPerson
				(PersonID)
				Select	P.ID
				From prs.Person	P
					Inner Join hmr.DepartmentPersonel DPrs on P.ID=DPrs.PersonID
				Where P.Active=1
						and P.[Type]=1
						and DPrs.Active=1
						and ((P.CompanyID is null and P.CreatorCompanyID=@CompanyID)
						or (P.CompanyID=@CompanyID))
		End	
		Else If @EPK=1
		Begin	
			If exists(select * from Att.TableOfficePerson where UserPersonID=@OnlineUesrID )--and exists(select * from dbo.GroupMember where GroupId in (4) and MemberId=@OnlineUesrID))	
				--آيا دسترسي مالتي کمپاني براي دفتر تابل چک شود يا خير
				If @FullTableOffice=1
					Insert Into @SelectedPerson
					(PersonID)
					Select distinct	PersonID
					From Att.TableOfficePerson Tof
					Where UserPersonID=@OnlineUesrID
					and not exists (select * from @SelectedPerson ss where Tof.PersonID=ss.PersonID)
				Else	
					Insert Into @SelectedPerson
					(PersonID)
					Select distinct	PersonID
					From Att.TableOfficePerson Tof
					Where UserPersonID=@OnlineUesrID
					and not exists (select * from @SelectedPerson ss where Tof.PersonID=ss.PersonID)
					and Exists(Select * From Prs.Person P Where Tof.PersonID=P.ID and P.CompanyID=@CompanyID)
				
			If @Ismanager=1	--کاربر ارشد واحد است	
			Begin	
				Insert Into @SelectedPerson
				(PersonID)	
				select PersonID 
				From	Gnr.DeptLevel DL
				Where Dept=@OnLineUserDepartmentID
					and not Exists(Select * From @SelectedPerson Where PersonID=DL.PersonID)
					--and Exists(Select * From Prs.Person P Where P.ID=DL.Personid and P.CompanyID=@CompanyID)					
					
					If not Exists(Select * From @SelectedPerson Where PersonID=@OnlineUesrID)
						Insert Into @SelectedPerson
						(PersonID)	 
						Select @OnlineUesrID				
			End
			If @LikeManager=1	--کاربر جزء گروه شبه هد است
			Begin
				Insert Into @SelectedPerson
				(PersonID)	
				select PersonID 
				From	Gnr.DeptLevel DL
				Where Dept=@OnLineUserDepartmentID
					and not Exists(Select * From @SelectedPerson Where PersonID=DL.PersonID)
					and not Exists(Select * From Gnr.DeptLevel DL2 Where DL.Personid=DL2.Personid
									and Dept=@OnLineUserDepartmentID and head=1 and OwnDept=1)
					
					If not Exists(Select * From @SelectedPerson Where PersonID=@OnlineUesrID)
						Insert Into @SelectedPerson
						(PersonID)	 
						Select @OnlineUesrID
			End
			If @Ismanager=0 and @LikeManager=0	and @OnlineUesrID is not null--دسترسي مشاهده فقط خودش
				If not Exists(Select * From @SelectedPerson Where PersonID=@OnlineUesrID)
					Insert Into @SelectedPerson
					(PersonID)	 
					Select @OnlineUesrID	
		End
		Else If @EPK=2
		Begin
			Insert Into @SelectedPerson
			(PersonID)	
			select @OnlineUesrID 
		End
		
		--دسترسي نمايش افراد بدون onlineuser
		If @WithoutSelf=1
		Begin
			Delete From @SelectedPerson
			Where PersonID in (Select PersonID From Gnr.DeptLevel
								Where Dept=@DepartmentID and OwnDept=1 and head=1)
		End	

		--عدم نمايش افراديکه تاريخ خاتمه کار دارند، بجز ص ويرايش مشخصات پرسنل
		If @MenuItemId<>1105 and isnull(@NotExitDate,0)<>1
			Delete From @SelectedPerson
			where exists(Select * from Hmr.EmployProperty e where e.PersonnelID=PersonID)
			and not exists(Select * from Hmr.EmployProperty e where e.PersonnelID=PersonID 
			and (@sdate between right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) and right(isnull(e.ExitDate,'99/01/01'),8) )
				 union All
				 Select * from Hmr.EmployProperty e where e.PersonnelID=PersonID 
				 and (@edate between right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) and right(isnull(e.ExitDate,'99/01/01'),8))
				 union All
				 Select * from Hmr.EmployProperty e where e.PersonnelID=PersonID 
					and (right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) between @sdate and @EDate)) 

				--and (@sdate between right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) and right(isnull(e.ExitDate,'99/01/01'),8) or @edate between right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) and right(isnull(e.ExitDate,'99/01/01'),8))
				--	or right(isnull(isnull(e.WorkingDate,e.EmployDate),'01/01/01'),8) between @sdate and @EDate)  		

		--فيلتر شماره پرسنلي				
		If isnull(@PersonID,0)<>0
			Delete From @SelectedPerson Where PersonID<>@PersonID

		--فيلتر واحد سازماني
		If isnull(@DepartmentID,0)<>0 and @chkChildren=0
		Begin
			If Isnull(@ShowManagerValue, 0)=0
				Delete From @SelectedPerson 
				Where not Exists
							(
								Select *
								From (
									Select DL.Personid PID
									From Gnr.DeptLevel DL
									Where Dept=@DepartmentID
											and OwnDept=1
									)DL Where PersonID=DL.PID
							)			
		
			If Isnull(@ShowManagerValue, 0)=1 --and @NewWFOValue=1
					Delete From @SelectedPerson 
					Where not Exists
								(
									Select * From
									(
										Select DL.PersonID PID
										From Gnr.DeptLevel DL
										Where DL.Dept=@DepartmentID and OwnDept=1
										Union All
										Select DL.PersonID PID
										From Gnr.DeptLevel DL
										Where DL.Dept=@DepartmentID and OwnParent=1
											and Exists(Select * From Gnr.DeptLevel DL2
														Where DL.PersonID=DL2.PersonID and ownDept=1 and Head=1)
									)DL where PersonID=DL.PID					
								)	
			end					
		----نمايش افراد در واحدهاي زيرمجموعه				
		If isnull(@DepartmentID,0)<>0 and Isnull(@chkChildren, 1)=1
		Begin
			Delete From @SelectedPerson 
			Where not Exists
						(
							Select * 
							From (
								Select DL.Personid PID
								From Gnr.DeptLevel DL
								Where Dept=@DepartmentID
							) DL	Where PersonID=DL.PID
						)
		End
		
		--نمايش افراد واحد مستقيم
		If Isnull(@DepartmentID, 0)=0 and Isnull(@chkChildren, 1)=0 
			and @MenuItemId<>1306 and Isnull(@PersonID, 0)=0 and @EPK<>0
			Delete From @SelectedPerson 
				Where not Exists
							(
								Select *
								From ( Select DL.Personid PID
									From Gnr.DeptLevel DL
									Where Dept=@DepartmentID
										and OwnDept=1
									)DL Where PersonID=DL.PID
							)			
		
		--جهت نمايش مديران واحدهاي مستقيم
		If Isnull(@DepartmentID, 0)=0  and Isnull(@ShowManagerValue, 0)=1
		Begin
			--Select @DepartmentID=dept
			--from Gnr.DeptLevel 
			--where Personid=@OnlineUesrID and OwnDept=1
			
			--If @NewWFOValue=1
				Delete From @SelectedPerson 
				Where not Exists
							(
								Select *
								From 
								(
									Select PersonID PID
									From Gnr.DeptLevel DL
									Where Dept=@DepartmentID
										and OwnDept=1
									Union All
									Select PersonID PID
									From Gnr.DeptLevel DL
									Where Dept=@DepartmentID
										and OwnParent=1
										and head=1
									)	tt	
										Where PersonID=tt.PID
							)	
								
					
		--فيلتر دسته بندي گروه
		If not @CategoryGroupID is null and isnull(@CategoryGroupID,0)<>0
			Delete From @SelectedPerson 
			Where not Exists
						(		
							Select	*
							From Att.GroupPerson GP
								inner Join Att.[Group] G on GP.GroupID=G.GroupID
								Inner Join Prs.Person P on GP.PersonelID=P.ID
							Where 	G.CategoryID=@CategoryGroupID
									and P.CompanyID=@CompanyID
									and ((@SDate between SDate And EDate)
									Or (@EDate between SDate And EDate)
									Or (SDate between @SDate And @EDate)
									Or (EDate between @SDate And @EDate))
									and PersonID=GP.PersonelID
						)	
				end					
		--فيلتر گروه
		If not @GroupID is null and isnull(@GroupID,0)<>0
			Delete From @SelectedPerson 
			Where not Exists
						(		
							Select	*
							From Att.GroupPerson GP
								Inner Join Prs.Person P on GP.PersonelID=P.ID
							Where 	GroupID=@GroupID
									and P.CompanyID=@CompanyID
									and((@SDate between SDate And EDate)
									Or (@EDate between SDate And EDate)
									Or (SDate between @SDate And @EDate)
									Or (EDate between @SDate And @EDate))
									and PersonID=GP.PersonelID
						)	
			
		--فيلتر شيفت		
		If not @ScheduleID is null and isnull(@ScheduleID,0)<>0
			Delete From @SelectedPerson 
			Where not Exists
						(	
							Select	*
							From Att.GroupPerson GP
									Inner Join Att.ScheduleGroup SG on GP.GroupID=SG.GroupID
									Inner Join Att.Schedule S on S.ScheduleID=SG.ScheduleID
									Inner Join Prs.Person P on GP.PersonelID=P.ID
							Where 	 S.ScheduleID=@ScheduleID
									and P.CompanyID=@CompanyID
									and((@SDate between SDate And EDate)
									Or (@EDate between SDate And EDate)
									Or (SDate between @SDate And @EDate)
									Or (EDate between @SDate And @EDate))
									and PersonID=GP.PersonelID
						)
	End								
			
	Delete From @SelectedPerson 
	Where isnull(PersonID,0)=0
	
	Update		@SelectedPerson
	Set	DisplayName=P.DisplayName,
		Code=P.Code
	From Prs.Person P
	Where P.ID=PersonID	
	
	--Select * From @SelectedPerson	
	--where PersonID=608529
			
	return
End							

Go

Create Function [Tsh].[udfGetProjectTaskManager](@OnLineUserID int, @ProjectID	int=null)
returns @Tb Table(ID int, Code nvarchar(8), Name nvarchar(500), 
	[Type] char(1), [Level] int, ParentID int, ProjectTaskCode nvarchar(50),ProjTaskID int)
as
Begin
	--Declare @OnLineUserID int=123456789,--30182,
	--		@ProjectID	int=45
	--Declare @Tb Table(ID int, Code nvarchar(8), Name nvarchar(200)
	--	, [Type] char(1), [Level] int, ParentID int, ProjectTaskCode nvarchar(50))
	
	Declare @TbTemp Table(ID int, Code nvarchar(8), Name nvarchar(200)
		, [Type] char(1), [Level] int, ParentID int, ProjectTaskCode nvarchar(50),ProjTaskID int)
		
	Declare @Admin bit=case When Exists(Select *
								From dbo.GroupMember GM
									inner join dbo.GroupTitle GT  on GM.GroupId=GT.GroupID
								Where GT.Acronym='TSHAdmin'	
									and GM.MemberId=@OnLineUserID) then 1
							else 0 end			
							
	--حالتي که کاربر،مديرسيستم نيست	
	If @Admin=0
	Begin	
		--به دست آوردن پروژه هاي مستقيم و سپس زيرمجموعه
		;with Project as
		(Select P.ID, P.Code, P.Name, 1 [Level], P.ParentID, ProjectCode ProjectTaskCode --0 ParentID
			From tsh.Project P
			where ManagerID=ISNULL(@OnLineUserID, ManagerID)
				--and P.ID=ISNULL(@ProjectID, P.ID)	
		union All
			Select P1.ID, P1.Code, P1.Name, [Level]+1, P1.ParentID, p1.ProjectCode ProjectTaskCode
			from Project P2 join tsh.Project P1  on P2.ID=P1.ParentID
		)
		--به دست آوردن تسک هاي مستقيم و سپس زيرمجموعه
		--در سطح 1 هر تسک، نود پدر شناسه پروژه مربوطه است، ودر ساير سطوح نود پدر شناسه تسک پدر
		,Task as
		(Select	T.ID, T.Code, T.[Desc] Name, 'T' Type, 1 [Level], PT.ID PTID, ProjectID ParentID, T.TaskCode ProjectTaskCode --Pt.ParentID --ProjectID ParentID
		From Project P
			inner join tsh.ProjectTask PT on P.ID=Pt.ProjectID 
			inner join tsh.Task T on PT.TaskID=T.ID
		Where PT.ParentID=0	
		union All
		Select	T.ID, T.Code, T.[Desc], 'T' Type, T2.[Level]+1 [Level], PT.ID PTID, 
			(Select TaskID From tsh.ProjectTask PT2 Where PT2.ID=PT.ParentID) ParentID,
			T.TaskCode ProjectTaskCode
		From tsh.ProjectTask PT 
			inner join tsh.Task T on PT.TaskID=T.ID
			inner join Task T2 on PT.ParentID=T2.PTID
			Where PT.ParentID<>0
		)	
		
		--براي اولين تسک شناسه پروژه مربوطه به عنوان نود پدر
		Insert @Tb
		(ID, Code, Name, Type, [Level], ParentID, ProjectTaskCode,ProjTaskID)
		Select ID, Code, Name, 'P' Type, [Level], ParentID, ProjectTaskCode,0
		From Project
		Union All
		Select ID, Code, Name, 'T' Type, [Level], ParentID, ProjectTaskCode,PTID
		From Task
	End
	
	--حالتي که کاربر مديرسيستم تايم شيت است
	If @Admin=1
	Begin
		--به دست آوردن پروژه هاي مستقيم و سپس زيرمجموعه
		;with Project as
		(Select P.ID, P.Code, P.Name, 1 [Level], P.ParentID, ProjectCode ProjectTaskCode --0 ParentID
			From tsh.Project P
			where ParentID Is Null
		union All
			Select P1.ID, P1.Code, P1.Name, [Level]+1, P1.ParentID, p1.ProjectCode ProjectTaskCode
			from Project P2 join tsh.Project P1  on P2.ID=P1.ParentID
		)
		--به دست آوردن تسک هاي مستقيم و سپس زيرمجموعه
		,Task as
		(Select	T.ID, T.Code, T.[Desc] Name, 'T' Type, 1 [Level], PT.ID PTID, ProjectID ParentID, T.TaskCode ProjectTaskCode --Pt.ParentID --ProjectID ParentID
		From Project P
			inner join tsh.ProjectTask PT on P.ID=Pt.ProjectID
			inner join tsh.Task T on PT.TaskID=T.ID
		Where PT.ParentID=0	
		union All
		Select	T.ID, T.Code, T.[Desc], 'T' Type, T2.[Level]+1 [Level], PT.ID PTID, 
			(Select TaskID From tsh.ProjectTask PT2 Where PT2.ID=PT.ParentID) ParentID,
			T.TaskCode ProjectTaskCode
		From Project P
			inner join tsh.ProjectTask PT on P.ID=Pt.ProjectID
			inner join tsh.Task T on PT.TaskID=T.ID
			inner join Task T2 on PT.ParentID=T2.PTID
			Where PT.ParentID<>0
		)	
		
		--براي اولين تسک شناسه پروژه مربوطه به عنوان نود پدر
		Insert @Tb
		(ID, Code, Name, Type, [Level], ParentID, ProjectTaskCode,ProjTaskID)
		Select ID, Code, Name, 'P' Type, [Level], ParentID, ProjectTaskCode,0
		From Project
		Union All
		Select ID, Code, Name, 'T' Type, [Level], ParentID, ProjectTaskCode,PTID
		From Task	
	End
		
	----در صورتيکه فيلتر روي پروژه خاصي شود، بايد از نود مورد نظر به بعد نمايش داده شود
	If not @ProjectID is null
	Begin
		Insert @TbTemp
		(ID, Code, Name, Type, [Level], ParentID, ProjectTaskCode,ProjTaskID)
		Select	ID, Code, Name, Type, [Level], ParentID, ProjectTaskCode,ProjTaskID
		From @Tb
		
		Delete From @Tb
		
		;with Project2 as
			(Select ID PID, Code PCode, Name PName, 'P' PType, [Level] PLevel, ParentID PParentID, ProjectTaskCode,ProjTaskID
				From @TbTemp
				Where ID=@ProjectID and Type='P'
			Union All
			Select 	T.ID, T.Code, T.Name, 'P' Type, T.[Level], T.ParentID, T.ProjectTaskCode,T.ProjTaskID
			From @TbTemp T
				inner Join Project2 P2 on T.ParentID=P2.PID
				Where Type='P')
		,Task2 as	
			(Select	T.ID TID, T.Code TCode, T.Name TName, 'T' TType, T.[Level] Tlevel, T.ParentID TParentID, T.ProjectTaskCode,T.ProjTaskID --ProjectID ParentID
			From Project2 P2
				inner join @TbTemp T on P2.PID=T.ParentID and T.[Type]='T' and T.[Level]=1
			union All
			Select	T.ID, T.Code, T.Name, 'T' Type, T.[Level], T.ParentID, T.ProjectTaskCode,T.ProjTaskID
			From Task2 T2
				inner join @TbTemp T on T2.TID=T.ParentID
			Where Type='T'	
			)		
			
		Insert @Tb
		(ID, Code, Name, Type, [Level], ParentID, ProjectTaskCode,ProjTaskID)
		Select *
		From Project2 P2
		Union All
		Select *
		From Task2 T2		
	End		
	
	--select * from @Tb
	return
End

