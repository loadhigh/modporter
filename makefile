# mod_porter makefile for windows

APACHE_DIR = C:\Apache22
APACHE_INCLUDE = $(APACHE_DIR)\include
APACHE_LIB = $(APACHE_DIR)\lib

all: mod_porter.lib

.c.obj:
  cl /Fomod_porter.obj /c mod_porter.c /nologo /O2 /MD /EHsc /W3 /DWIN32 /DAP_DECLARE_EXPORT /I$(APACHE_INCLUDE)

mod_porter.lib: mod_porter.obj
  link /nologo /dll /out:mod_porter.so /LIBPATH:$(APACHE_LIB) libapr-1.lib libaprutil-1.lib libhttpd.lib libapreq2.lib mod_apreq2.lib mod_porter.obj
  
clean:
    del *.obj *.exp *.lib *.so*