 Y =: 1 : 'if. 3 = 4!:0 < ''u'' do. u@:] else. m {:: ] end.'
 X =: 1 : 'if. 3 = 4!:0 < ''u'' do. u@:[ else. m {:: [ end.'


agenda =: '@.' c2da
an =: 1 : '<@:((,''0'') ,&< ]) m'  NB. atomic rep of noun as an adverb (right arg)
tie =: '`'c2da

train =: 2 : 0
if. '9:' -: u lrA do. ((}: n) @.(i.<: # n)) (n @._1) eval else.
 if. 0 = L. v  do. train (u`(n an)) else. train (u`n) end. end.
)

9: +/ % # train '(@.0 lrA cut v2a)   '  NB. needs better gerund to lr conversion
9: +/ % # train '(@.0 lrA cut v2a (>@[ , '' @: '' , >@])/ v2a )   '  NB. adds to above insert @:
9: +/ % # train '(@.0 lrA cut v2a (>@[ , '' @: '' , >@])/ v2a eval)   '  NB. converts to verb
1 9:  +: + (a=. train '@.0 lrA cut v2a (>@[ , '' @: '' , >@])/ v2a  eval')  3  NB. additional adverbs can be applied, partial conjunction saved, as obvious can resulting dyadic paramters.

NB. builds boxes of lr reps for each verb phrase

convert =: (i.@#@cut ((' ' joinstring cut@:]) , '|' ,~"1  [ { '' joinstring"1 |. @ (((<'  ') ,. ]) {~"1 =@i.@#)@cut@:]) ]) NB. arg: '] (# @ [ %~ [: +/ *: @ -) +/%#'
lrX =: 1 : ('''('', u lrA , '') '' , lr y';':';'''('', (lr x) , '') ('' , u lrA , '') '' , lr y')

lrT =: 0 daFx
if. 0 -.@-: 1{:: a =. v ncA do. n =. ,: a end.
if. '9:' -: u lrA do. n else. 
(u ncA , n) lrT  end.
)
evaly =: 3 : 'y eval lrA'  NB. removes 1 level of parens from lrT boxes

NB.tieB =: 'if. 0 -.@-: 1{:: a =. v ncA do. n =. ,: a end. if. 0 -.@-: 1{:: b =. u ncA do. m =. b  end. m,n' daF
NB. tieB =: 'if. (0 -.@-: 1{:: a =. v ncA) *. ((1 ~: L.) *. 2 ~: #@$) :: 1: m do. n =. ,: a end.  u ncA,n' daF NB. can put nouns as long as not last element. or code it with ncA
tieB =: 'if. (0 -.@-: 1{:: a =. v ncA)  do. n =. ,: a end.  u ncA,n' daF NB. can put nouns as long as not last element. or code it with ncA
lrB =: 1 : ',: u ncA'
NB. +: '/' (,: 2 ncA)  tieB tieB
NB. +: '/' (2)  3 lrB tieB tieB tieB 
NB. 9: +/ % # lrT ([: ;: inv  evaly each)@:( {."1) v2a eval 

aatrain =: 0 daFx  NB. perfectly solves the composability of double adverbs
if. 0 -.@-: 1{:: a =. v ncA do. n =. ,: a end.
if.  1 = 1 {:: (;: inv {."1 a =.(u ncA , n)) ncA do.  a aatrain else.
 (;: inv {."1 a) eval end. 
)
forkorder=:($:@(2&}.) , {. , <)`(2&}. , {. , <)@.(3 = #)^:(1 ~: #)
trainorder=: forkorder`($:@(1&}.) , <)@.(0 = 2 | #)

displayandrun =: 1 : 0
pD '>>> ' , u lrX y
u y
:
pD '>>> ' , x u lrX y
x u y
)
reduce =: 1 : '<"_1@[ ([: u (&.>)/(>@:) ,) <@:]'
Ambi =: (1 : 'u : (u reduce)')
pDr =: pD@:('    ' , ":)"1@:":
AmbiD =: 1 : 'u [ ''    '' pDr@, u lrX'
evaleach =: 1 : 0
for_i. m do. pDr^:(i_index < <:#m) (i eval) :: ((i eval)@:]) y end.
:
for_i. m do. pDr^:(i_index < <:#m) x (i eval) :: ((i eval)@:]) y end.
)

actrain =: 0 daFx  NB. allows conjunction trains too.  May be flakier
if. 0 -.@-: 1{:: a =. v ncA do. n =. ,: a end.
if.  1 2 *./@:e.~ 1 {::"1 a =.(u ncA , n)  do.  a aatrain2 else.
 if.  1 = 1 {:: NC =. (;: inv {."1 a) ncA do.  (,: 1 ;~ '()' strbracket 0 {:: NC) aatrain2 else.
   (;: inv {."1 a) eval end.  end.
)
lrT2lrA =: ( {."1) (([: ;: inv  evaly each)@:) v2a
lrS =: 'lrT {."1 v2a' aatrain
strandTrain =: 'lrT ([: ;: inv  evaly each)@:( {."1) v2a eval' aatrain
strandTrain =: 'lrT lrT2lrA eval' aatrain
strandT =: ([: ,&' AmbiD'@:('()'&strbracket)@:evaly@:; L:1   [: >@{.L:1 [: (#~ (<1) ~: (0-:1&{::)L:1)  trainorder@:(<"_1)) 'lrT lvProcsRestT evaleach' aatrain
altMs =: 'lrT  (''[: }: [:''&,)@:(,&''/ {:,~]'')@:(''`''&joinstring)@:(([: ''(] ,~''&, ,&''@:[)'' )each) @:( {."1) v2a eval' aatrain  
lrS=: 'lrT {."1 v2a' aatrain
lvProcsRestT =: (1 : '( 0 {:: {: m) eval }: m') 
lvProcsRest =: (1 : '(> {: m) eval }: m') 
lvProcsStrand =: 'lrS lvProcsRest eval' aatrain
altMs =:  ('apply every~ (',  ') $~#',~ lr ) lvProcsStrand
NB.  9: -:each +:each *:each altMs 3 4 ;2 4 ;5 6; 7
NB.  + '/' '\' aatrain
NB. 9: +/ % # ('lrT ([: ;: inv  evaly each)@:( {."1) v2a eval' aatrain)
NB. 9: +/ (% # strandTrain)
NB. 9: +/ % # ( strandTrain) '"1' aatrain
NB.  - (+ * 'tie tie' aatrain)

NB. *: +: '@' aatrain2 + '/' '@'  aatrain2
NB.   + + aatrain
NB. - '@' + aatrain
NB. * +:    '(@+)' '@'  aatrain2
NB. - +   ' daS ''tie''' aatrain

NB. Triple (or longer) adverb where p_3 (and earlier) is arg to p_2 (which is a modifier) p_1 is a verb that can process the variable assigned to result of previous train.
NB. double adverb where u is lrB of at least 2 items, v is verb that will process variable assigned from eval of lrB
NB. except for last arg of u, modifiers will be quoted assuming they are linear arguments of the last modifier.
NB. v is verb that needs a quoted variable name as argument
pmod =: 0 daFx
 a=. ( (;: inv  (":leaf@{.@{: ,~ [: ({.)`(quote each@: {.)@.(1 2 e.~  1&{::)"1 }:)  m) eval)
v 'a'
)

pmod2 =: 0 daFx  NB. same except v is adverb such as ~ or ~ with train
a=. ( (;: inv  (":leaf@{.@{: ,~ [: ({.)`(quote each@: {.)@.(1 2 e.~  1&{::)"1 }:)  m) eval)
'a' v eval
)

NB. applies modifier or verb v to u, and returns lr of result.  Apply eval to get function
lrAA =:  'u v tieB (5!:5@:<) pmod' daF
NB. 5 +: - ('@' 'c2da' lrAA eval) 2
lrAAv =: 4 : ' (x y lrAA)'
c2d =: lrAA a2d
NB. 3 +:@:] c2d 'amdt' i.5