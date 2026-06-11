**free

//---<CREATE_OBJECTS>--------------------------------------------------------------------------------------------------------------------------------
//
//    @create{
//             CRTBNDRPG PGM(&O/&N)
//                       SRCFILE(&L/&F)
//                       SRCMBR(&N)
//                       DFTACTGRP(*NO)
//                       ACTGRP(*NEW)
//                       OPTION(*EVENTF)
//                       DBGVIEW(*SOURCE)
//                       USRPRF(*USER)
//            }
//
//---</CREATE_OBJECTS>-------------------------------------------------------------------------------------------------------------------------------


//---------------------------------------------------------------------------------------------------------------------------------------------------
//
//  @name    HelloWorld.RPGLE
//
//  @purpose
//
//
//
//  @author  KPL
//
//  @version 1.0.0 - Erstellungsdatum Heute
//
//  @param
//
//  @changed
//
//
//---------------------------------------------------------------------------------------------------------------------------------------------------



ctl-opt main(Main) stgmdl(*snglvl);

/if defined(*crtbndrpg)
   ctl-opt actgrp(*new);
/endif

ctl-opt alwnull(*usrctl) expropts(*alwblanknum:*usedecedit);
ctl-opt option(*nodebugio:*srcstmt:*nounref) debug(*retval:*constants);

dcl-f Screen workstn extdesc('HELLODSPF')  extfile('HELLODSPF')  usropn;

dcl-proc Main;
  dcl-pi *n extpgm('HELLODSPF');
      inName char(10) const;
  end-pi;

  dcl-s lclString char(52) inz;
  
  dcl-s retCode ind inz(*on);

  monitor;

      open Screen;

      scrNAME  = ' Hello World ' + %trim(inName) + '!';

      dow *in03 = *off;
        exfmt FMT10;
      enddo;

  on-error;
     retCode = *off;
  endmon;

  return;

on-exit;
  close Screen;
end-proc;


