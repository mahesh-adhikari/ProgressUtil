/*---------------------------------------------
1. Function to replace xml node/element data 
---------------------------------------------*/

function f-setXMLnodedata returns character (
  input v-xmldata as char,
  input v-nodename as char,  
  input v-nodedata as char):
  
  define variable v-startindex as int no-undo.
  define variable v-stopindex  as int no-undo.
  
  assign v-startindex = index(v-xmldata, "<" + v-nodename + ">") /*+ length("<" + v-nodename + ">")*/
         v-stopindex  = index(v-xmldata, "</" + v-nodename + ">").
  
  if v-stopindex > v-startindex then
    assign v-xmldata = replace(v-xmldata,substring(v-xmldata,v-startindex,v-stopindex - v-startindex),"<" + v-nodename + ">" + v-nodedata).
    
  return v-xmldata.
  
end function. /*f-setXMLnodedata*/

/*------------ Example use ------------*/
DEF VAR v-xmldata AS CHAR NO-UNDO.
ASSIGN v-xmldata = "<ab>xyz</ab><cd>world</cd>".

MESSAGE f-setXMLnodedata(v-xmldata,"ab","hello") /*ab = nodename*/
    VIEW-AS ALERT-BOX INFO BUTTONS OK.

/*--- Output: v-xmldata = "<ab>hello</ab><cd>world</cd>". ----*/
