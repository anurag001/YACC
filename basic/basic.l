%{
#include "y.tab.h"
%}
%% 
"Morning" {return MOR;}
"Night" {return NIG;}
[\n] {return NL;}
. {;} 
%%
