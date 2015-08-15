# dX-console-dissect

The only required file is dX.ijs.  It has no dependencies.  Other included files are there just for general thematic relations to multiadverbs.

This is a console utility that is in the spirit of Henry Rich's dissect graphical function display.  It is designed for tacit code, though explicit functions can be part of trains.  It works better on forks than on hooks, and the examined function must be at least 2 verb phrases long.  The only failures (I think) are for adverbs that return multiline explicit expressions.

load 'dX.ijs'  
then dX is an adverb that will explain a tacit train, but return the original result of that verb application.

some examples

dX can be nested in multiple calls: (a bit of extra display cut out)

   ((i.@# + +:)dX - # + +/ % #) dX 1 2 3
   
        (#) 1 2 3
    3
        (+/) 1 2 3
    6
        (+/ % #) 1 2 3
    2
        (#) 1 2 3
    3
        (# + +/ % #) 1 2 3
    5
        (3 : 'for_i. (<;._1 ''|(+:) AmbiD|(i.@#) AmbiD|(i.@# + +:) AmbiD'') do. pDr^:(i_index < <:#(<;._1 ''|(+:) AmbiD|(i.@#) AmbiD|(i.@# + +:) AmbiD'')) (i eval) :: ((i eval)@:]) y end.' :(4 : 'for_i.(<;._1 ''|(+:) AmbiD|(i.@#) AmbiD|(i.@# + +:) AmbiD'')...
        (+:) 1 2 3
    2 4 6
        (i.@#) 1 2 3
    0 1 2
        (i.@# + +:) 1 2 3
    2 5 8
_3 0 3

The ugly display line in the middle is a side effect of embedding dX inside a dX call.  Each line is a "tine" of the tacit train in order that each tine is executed in the verb.

You can also just apply dX to a part of a verb that interests you

    (([: +: [ +/ %)dX~ #) 1 2 3
        (3) (%) 1 2 3
    3 1.5 1
        (3) ([) 1 2 3
    3
        (3) ([ +/ %) 1 2 3
    6 4.5 4
        (3) ([:) 1 2 3
            (3) ([:) 1 2 3
        (3) ([: +: [ +/ %) 1 2 3
12 9 8

placing dX ahead of other adverbs means getting the whole train (must be at least 2 long) as its argument.  Placed after ~ above results in a single verb-phrase-argument to dX (error)

consider,

     combT =: ([: ; ([ ; [: i.@>: -~) ((1 {:: [) ,.&.> [: ,&.>/\. >:&.>@:])^:(0 {:: [) (<i.1 0),~ (< i.0 0) $~ -~)

to tunnel inside this verb, apply f. to it.  combT lists the ways x items can be selected from y.

    2 combT f. dX 4
        (2) (-~) 4
    2
        (2) ((<i.0 0) $~ -~) 4
    ┌┬┐
    └┴┘
        (2) ((<i.1 0) ,~ (<i.0 0) $~ -~) 4
    ┌┬┬┐
    ││││
    └┴┴┘
        (2) ([ ; [: i.@>: -~) 4
    ┌─┬─────┐
    │2│0 1 2│
    └─┴─────┘
        (2) (([ ; [: i.@>: -~) ((1 {:: [) ,.&.> [: ,&.>/\. >:&.>@:])^:(0 {:: [) (<i.1 0) ,~ (<i.0 0) $~ -~) 4
    ┌───┬───┬───┐
    │0 1│1 2│2 3│
    │0 2│1 3│   │
    │0 3│   │   │
    └───┴───┴───┘
        (2) ([:) 4
            (2) ([:) 4
        (2) ([: ; ([ ; [: i.@>: -~) ((1 {:: [) ,.&.> [: ,&.>/\. >:&.>@:])^:(0 {:: [) (<i.1 0) ,~ (<i.0 0) $~ -~) 4
    0 1
    0 2
    0 3
    1 2
    1 3
    2 3

This display skips over an interesting long line in the middle, but in J's console, you can go up to that line add dX to an interesting part, and hit enter twice:

    (2) (([ ; [: i.@>: -~) ((1 {:: [) ,.&.> [: ,&.>/\. >:&.>@:])dX^:(0 {:: [) (<i.1 0) ,~ (<i.0 0) $~ -~) 4
        (2;0 1 2) (>:&.>@:]) (i.0 0);(i.0 0);i.1 0
    ┌┬┬┐
    ││││
    └┴┴┘
        (2;0 1 2) ([:) (i.0 0);(i.0 0);i.1 0
            (2;0 1 2) ([:) (i.0 0);(i.0 0);i.1 0
        (2;0 1 2) ([: ,&.>/\. >:&.>@:]) (i.0 0);(i.0 0);i.1 0
    ┌┬┬┐
    ││││
    └┴┴┘
        (2;0 1 2) (1 {:: [) (i.0 0);(i.0 0);i.1 0
    0 1 2
        (2;0 1 2) ((1 {:: [) ,.&.> [: ,&.>/\. >:&.>@:]) (i.0 0);(i.0 0);i.1 0
        (2;0 1 2) (>:&.>@:]) (,.0);(,.1);,.2
    ┌─┬─┬─┐
    │1│2│3│
    └─┴─┴─┘
        (2;0 1 2) ([:) (,.0);(,.1);,.2
            (2;0 1 2) ([:) (,.0);(,.1);,.2
        (2;0 1 2) ([: ,&.>/\. >:&.>@:]) (,.0);(,.1);,.2
    ┌─┬─┬─┐
    │1│2│3│
    │2│3│ │
    │3│ │ │
    └─┴─┴─┘
        (2;0 1 2) (1 {:: [) (,.0);(,.1);,.2
    0 1 2
        (2;0 1 2) ((1 {:: [) ,.&.> [: ,&.>/\. >:&.>@:]) (,.0);(,.1);,.2
    ┌───┬───┬───┐
    │0 1│1 2│2 3│
    │0 2│1 3│   │
    │0 3│   │   │
    └───┴───┴───┘
    
here is a function that all I remember has something to do with repeated combinations/permutations

    
      cmbcombT =: ({~ [: /:"1 [: ; [: ([:,/  [,"1"1 _1 ]{"1"_ 1 [-.~"1 i.@(+&({:@$)))L:0/ [: |.@:(] <@combT f."0 +/\)  [: |. #/.~) 
    
      cmbcombT f.dX 2 2 3 
         ([: /:"1 [: ; [: ([: ,/ [ ,"1"1 _1 ] {"1"_ 1 [ -.~"1 i.@(+&({:@$)))L:0/ [: |.@:(] <@([: ; ([ ; [: i.@>: -~) ((1 {:: [) ,.&.> [: ,&.>/\. >:&.>@:])^:(0 {:: [) (<i.1 0) ,~ (<i.0 0) $~ -~)"0 +/\) [: |. #/.~) 2 2 3
    0 1 2
    0 2 1
    2 0 1
        ({~ ([: /:"1 [: ; [: ([: ,/ [ ,"1"1 _1 ] {"1"_ 1 [ -.~"1 i.@(+&({:@$)))L:0/ [: |.@:(] <@([: ; ([ ; [: i.@>: -~) ((1 {:: [) ,.&.> [: ,&.>/\. >:&.>@:])^:(0 {:: [) (<i.1 0) ,~ (<i.0 0) $~ -~)"0 +/\) [: |. #/.~)) 2 2 3
    2 2 3
    2 3 2
    3 2 2

The short result tells us that this is a hook, and also tells us that it could be called dyadically:

     'abc' cmbcombT  2 2 3
    abc
    acb
    cab

But we didn't get an explanation of the meat of the verb yet.  We can just grab one of (first) the previous display lines and insert dX into it.  Why not see what happens when parameters are changed to 2 2 3 3

       ([: /:"1 [: ; [: ([: ,/ [ ,"1"1 _1 ] {"1"_ 1 [ -.~"1 i.@(+&({:@$)))L:0/ [: |.@:(] <@([: ; ([ ; [: i.@>: -~) ((1 {:: [) ,.&.> [: ,&.>/\. >:&.>@:])^:(0 {:: [) (<i.1 0) ,~ (<i.0 0) $~ -~)"0 +/\) [: |. #/.~)dX 2 2 3 3
        (#/.~) 2 2 3 3
    2 2
        ([:) 2 2 3 3
            ([:) 2 2 3 3
        ([: |. #/.~) 2 2 3 3
    2 2
        ([:) 2 2 3 3
            ([:) 2 2 3 3
        ([: |.@:(] <@([: ; ([ ; [: i.@>: -~) ((1 {:: [) ,.&.> [: ,&.>/\. >:&.>@:])^:(0 {:: [) (<i.1 0) ,~ (<i.0 0) $~ -~)"0 +/\) [: |. #/.~) 2 2 3 3
    ┌───┬───┐
    │0 1│0 1│
    │0 2│   │
    │0 3│   │
    │1 2│   │
    │1 3│   │
    │2 3│   │
    └───┴───┘
        ([:) 2 2 3 3
            ([:) 2 2 3 3
        ([: ([: ,/ [ ,"1"1 _1 ] {"1"_ 1 [ -.~"1 i.@(+&({:@$)))L:0/ [: |.@:(] <@([: ; ([ ; [: i.@>: -~) ((1 {:: [) ,.&.> [: ,&.>/\. >:&.>@:])^:(0 {:: [) (<i.1 0) ,~ (<i.0 0) $~ -~)"0 +/\) [: |. #/.~) 2 2 3 3
    ┌───────┐
    │0 1 2 3│
    │0 2 1 3│
    │0 3 1 2│
    │1 2 0 3│
    │1 3 0 2│
    │2 3 0 1│
    └───────┘
        ([:) 2 2 3 3
            ([:) 2 2 3 3
        ([: ; [: ([: ,/ [ ,"1"1 _1 ] {"1"_ 1 [ -.~"1 i.@(+&({:@$)))L:0/ [: |.@:(] <@([: ; ([ ; [: i.@>: -~) ((1 {:: [) ,.&.> [: ,&.>/\. >:&.>@:])^:(0 {:: [) (<i.1 0) ,~ (<i.0 0) $~ -~)"0 +/\) [: |. #/.~) 2 2 3 3
    0 1 2 3
    0 2 1 3
    0 3 1 2
    1 2 0 3
    1 3 0 2
    2 3 0 1
        ([:) 2 2 3 3
            ([:) 2 2 3 3
        ([: /:"1 [: ; [: ([: ,/ [ ,"1"1 _1 ] {"1"_ 1 [ -.~"1 i.@(+&({:@$)))L:0/ [: |.@:(] <@([: ; ([ ; [: i.@>: -~) ((1 {:: [) ,.&.> [: ,&.>/\. >:&.>@:])^:(0 {:: [) (<i.1 0) ,~ (<i.0 0) $~ -~)"0 +/\) [: |. #/.~) 2 2 3 3
    0 1 2 3
    0 2 1 3
    0 2 3 1
    2 0 1 3
    2 0 3 1
    2 3 0 1
