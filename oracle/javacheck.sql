-- Author:		Ahbaid Gaffoor
-- File:		javacheck.sql
-- Date:		$Date$
-- Revision:		$Revision$
-- Use:			Use this java class and wrapper package to query the installed JVM

spool javacheck

set termout off
dorp package javacheck;
drop java source "SYS"."JavaCheck";
set termout on

create or replace and compile java source 
named "SYS"."JavaCheck"
resolver ((*SYS)(*PUBLIC)) as

public class JavaCheck {

   public static String version() {
      return java.lang.System.getProperty("java.version");
   }

   public static String vendor() {
      return java.lang.System.getProperty("java.vendor");
   }

   public static String vendor_url() {
      return java.lang.System.getProperty("java.vendor.url");
   }

   public static String compiler() {
      return java.lang.System.getProperty("java.compiler");
   }

   public static String XML_version() {
      return oracle.xml.parser.v2.XMLParser.getReleaseVersion();
   }

}
/
show errors


create or replace package JavaCheck as

   function Version return varchar2 is
   language java name 'JavaCheck.version() returns java.lang.String';

   function Vendor return varchar2 is
   language java name 'JavaCheck.vendor() returns java.lang.String';

   function Vendor_URL return varchar2 is
   language java name 'JavaCheck.vendor_url() returns java.lang.String';

   function Compiler return varchar2 is
   language java name 'JavaCheck.compiler() returns java.lang.String';

   function XML_version return varchar2 is
   language java name 'JavaCheck.XML_version() returns java.lang.String';

   procedure info;

end;
/
show errors

create or replace package body JavaCheck as

   procedure print(s varchar2) is
   begin
      dbms_output.put_line(s);
   end;

   procedure CR is
   begin
      print(chr(10));
   end;

   procedure info is 
   begin
       CR;
       print('JavaCheck Version 1.0 - Ahbaid Gaffoor, OCPdba.Net');
       print('=========================================================================================');
       print('Vendor: '||vendor);
       print('URL: '||vendor_url);
       print('Version: '||version);
       print('Compiler: '||compiler);
       print('XML Version: '||XML_version);
       CR;
   end;

end;
/
show errors

