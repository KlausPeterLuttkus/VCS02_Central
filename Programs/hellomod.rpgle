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



ctl-opt main(Main) stgmdl(*snglvl) bnddir('BND02');

/if defined(*crtbndrpg)
   ctl-opt actgrp(*new);
/endif

ctl-opt alwnull(*usrctl) expropts(*alwblanknum:*usedecedit);
ctl-opt option(*nodebugio:*srcstmt:*nounref) debug(*retval:*constants);


dcl-proc Main;
  dcl-pi *n extpgm('HELLOMOD');
      inName char(10) const;
  end-pi;

  dcl-s lclString char(52) inz;
  dcl-s lclName char(10) inz;

  dcl-s retCode ind inz(*on);

  monitor;

      lclName = inName;
      lclString  = ' Hello World ' + %trim(lclName) + '!';
      dsply lclString;

  on-error;
     retCode = *off;
  endmon;

  return;

on-exit;

end-proc;


