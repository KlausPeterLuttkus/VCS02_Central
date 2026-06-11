**free

//---------------------------------------------------------------------------------------------------------------------------------------------------
//
//  @name    SRV01
//
//  @purpose
//
//
//
//  @author
//
//  @version  - Erstellungsdatum
//
//  @param
//
//  @changed
//
//
//---------------------------------------------------------------------------------------------------------------------------------------------------



ctl-opt nomain stgmdl(*snglvl);

ctl-opt alwnull(*usrctl) expropts(*alwblanknum:*usedecedit);
ctl-opt option(*nodebugio:*srcstmt:*nounref) debug(*retval:*constants);


dcl-proc helloWorld export;
  dcl-pi *n varchar(100);
      inName char(10) const;
  end-pi;

  dcl-s lclName char(10) inz;

  // dcl-s lclGreeting varucs2(100) ccsid(1200) inz;

  dcl-s retGreeting varchar(100);

  monitor;

      lclName = inName;
      retGreeting  = 'Hello World ' + %trim(lclName) + '!';
      // lclGreeting = retGreeting;

  on-error;
     retGreeting = '*ERROR';
  endmon;

  return retGreeting;

on-exit;

end-proc;

dcl-proc goodbyeWorld export;
  dcl-pi *n varchar(100);
      inName char(10) const;
  end-pi;

  dcl-s lclName char(10) inz;

  dcl-s retGreeting varchar(100);

  monitor;

      lclName = inName;
      retGreeting  = 'Goodbye World ' + %trim(lclName) + '!';

  on-error;
     retGreeting = '*ERROR';
  endmon;

  return retGreeting;

on-exit;

end-proc;
