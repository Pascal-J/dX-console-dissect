pD_z_ =:  1!:2&2
lrA_z_ =: 1 : '5!:5 < ''u'''
eval_z_ =: 1 : ' a: 1 :  m'
lr_z_ =: 3 : '5!:5 < ''y'''
pDr_z_ =: pD@:('    ' , ":)"1@:":
coclass 'dX'
lrX =: 1 : ('''('', u lrA , '') '' , lr y';':';'''('', (lr x) , '') ('' , u lrA , '') '' , lr y')
evaly =: 3 : 'y eval lrA'  NB. removes 1 level of parens from lrT boxes
lvProcsRestT =: (1 : '( 0 {:: {: m) eval }: m') 



AmbiD =: 1 : 'u [ ''    '' pD@, u lrX'
strbracket =: (0&{@:[ , ] , 1&{@:[)
ismodstring =: 1 : 'if. 0 = 4!:0 <''u'' do. try. q =.  m eval catch. 0 return. end. 1 2 e.~ 4!:0 <''q''else. 0 end. ' 
ncS=:3 :'z=.y 1 :y label_. 4!:0 <''z'' ' :: _2: NB. nameclass of string 
ncA =: 1 : 'if. 3 ~: 4!:0 < ''u'' do. if. m ismodstring do. m ; ncS m else. 0 ;~ ''('', m lrA ,'')'' end. else. 3;~ ''('', u lrA ,'')'' end.'
daF =: 1 : ('a =. (''2 : '', (quote m) , '' u'') label_. 1 : (''u  1 :'' , quote a)') 
daFx =: (0 : ) 1 : ('a =. (''2 : ('', (lr m) , '') u'') label_. 1 : (''u  1 :'' , quote a)') NB. explicit. call with 0 left arg 


forkorder=:($:@(2&}.) , {. , <)`(2&}. , {. , <)@.(3 = #)^:(1 ~: #) 
trainorder=: forkorder`($:@(1&}.) , <)@.(0 = 2 | #)

lrT =: 0 daFx 
if. 0 -.@-: 1{:: a =. v ncA do. n =. ,: a end. 
if. '9:' -: u lrA do. n else. 
(u ncA , n) lrT  end. 
) 


aatrain =: 0 daFx  NB. perfectly solves the composability of double adverbs 
if. 0 -.@-: 1{:: a =. v ncA do. n =. ,: a end. 
if.  1 = 1 {:: (;: inv {."1 a =.(u ncA , n)) ncA do.  a aatrain else. 
(;: inv {."1 a) eval end. 
)

evaleach =: 1 : 0
for_i. m do. pDr^:(i_index < <:#m) (i eval) :: ((i eval)@:]) y end.
:
for_i. m do. pDr^:(i_index < <:#m) x (i eval) :: ((i eval)@:]) y end.
)

evaleach =: 1 : ('(3 : (''for_i. ('', m lrA , '') do. pDr^:(i_index < <:#('',m lrA,'')) (i eval) :: ((i eval)@:]) y end.'')) : (4 : (''for_i.('', m lrA, '')do. pDr^:(i_index < <:#('',m lrA,'')) x (i eval) :: ((i eval)@:]) y end.''))')



strandT =: ([: ,&' AmbiD'@:('()'&strbracket)@:evaly@:; L:1  [: >@{.L:1 [: (#~ (<1) ~: (0-:1&{::)L:1)  trainorder@:(<"_1)) 'lrT lvProcsRestT evaleach' aatrain

dX =: lrA  1  : '(''9: '', m , '' strandT'') eval'

NB. require 'format/printf'
NB. lockedE =: 2 : 0
NB. a =. '%j =: %j' sprintf n;m
NB. (3!:6 ] a) 1!:2 fl =. < jpath '~temp\filet.ijl'
NB. 0!:0 fl
NB. 1!:55 fl
NB. )
NB.
NB. 'dX_dX_' lockedE 'dX_z_'
NB.
dX_z_ =: dX_dX_