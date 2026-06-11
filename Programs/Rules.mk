# Standalone Program
HELLOWORLD.PGM: helloworld.pgm.rpgle

# Standalone Programm mit Bildschirmdialog
HELLODSPF.PGM: hellodspf.pgm.rpgle hellodspf.dspf

# Modul erstellen für HELLOMOS.PGM
HELLOMOD.MODULE: hellomod.pgm.rpgle
# Programm HELLOMOD.PGM binden mit Modul HELLOMOD.MODULE
HELLOMOD.PGM: HELLOMOD.MODULE

# Programm mit Verweiß auf *SRVPGM SRV01
HELLOGBY.PGM: hellogby.pgm.rpgle
