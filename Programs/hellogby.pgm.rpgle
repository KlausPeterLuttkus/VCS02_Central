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
//  @name    HELLOGBY.RPGLE
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


dcl-pr helloWorld varchar(100);
      inName char(10) const;
end-pr;

dcl-pr goodbyeWorld varchar(100);
      inName char(10) const;
end-pr;


dcl-proc Main;
  dcl-pi *n extpgm('HELLOGBY');
      inName char(10) const;
  end-pi;

  dcl-s lclString char(52) inz;
  dcl-s lclName char(10) inz;

  dcl-s retCode ind inz(*on);

  monitor;

      lclName = inName;
      lclString = helloWorld(lclName);
      dsply lclString;
      lclString = goodbyeWorld(lclName);
      dsply lclString;

  on-error;
     retCode = *off;
  endmon;

  return;

on-exit;

end-proc;


