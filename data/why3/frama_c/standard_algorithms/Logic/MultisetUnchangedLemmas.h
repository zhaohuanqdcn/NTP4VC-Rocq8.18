
#ifndef MULTISETUNCHANGEDLEMMAS_H_INCLUDED
#define MULTISETUNCHANGEDLEMMAS_H_INCLUDED

#include "MultisetUnchanged.h"
#include "CountLemmas.h"
#include "Unchanged.h"






// Preparing Macro
/*
/@ 
  assigns a[i .. n];
  ensures MultisetUnchanged{Pre,Post}(a, i, k);
  ensures MultisetUnchanged{Pre,Post}(a, k, n);
@/
void havoc(value_type* a, size_type i, size_type k, size_type n);

/@
  requires _i <= _k <= _n ;
  assigns _a[_i .. _n] ;
  ensures MultisetUnchanged{Pre, Post}(_a, _i, _n); 
@/
void x(value_type* _a, size_type _i, size_type _k, size_type _n){
  CountSectionUnion(_a,_i,_k,_n);
  havoc(_a,_i,_k,_n);
  CountSectionUnion(_a,_i,_k,_n);
}
*/

//usage place   CountSectionUnion(_a,_i,_k,_n); at _K
//and then at _L use the macro:
#define MultisetUnchangedUnion(_K,_L,_a,_i,_k,_n)	\
  CountSectionUnion(_a,_i,_k,_n);			\
  /@ assert \true; @/



#endif /* MULTISETUNCHANGEDLEMMAS_H_INCLUDED */

