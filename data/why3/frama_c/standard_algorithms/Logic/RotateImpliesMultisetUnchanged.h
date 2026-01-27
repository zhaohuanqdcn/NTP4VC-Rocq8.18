
#ifndef ROTATEIMPLIESMULTISETUNCHANGED_H_INCLUDED
#define ROTATEIMPLIESMULTISETUNCHANGED_H_INCLUDED

#include "EqualRanges.h"
#include "MultisetUnchanged.h"
#include "EqualRangesPreservesCount.h"




// Preparing macro
/*
/@
  assigns a [ m .. n ] ;
  ensures EqualRanges{Pre,Post}(a, m, n, m+1) ;
  ensures EqualRanges{Pre,Post}(a, n, n+1, m) ;
@/
void havoc(value_type* a, size_type m, size_type n);

/@ 
  requires m <= n < SIZE_TYPE_MAX ;
  assigns a [ m .. n ] ;
  ensures MultisetUnchanged{Pre,Post}(a, m, n+1);
@/
void x(value_type* a, size_type m, size_type n){
  havoc(a, m, n);
  //@ assert \true;
  //@ assert \true;
  
  //@ assert \true;
}
*/

#define RotateImpliesMultisetUnchanged(_K,_L,_a,_m,_n)			\
  /@ assert \true; @/				\
  EqualRangesPreservesCount(_K, _L, _a, _m, _n, 1) ;			\
  /@ assert \true; @/	\
  CountSectionUnion(_a, _m, _m+1, _n+1) ; 

#endif /* ROTATEIMPLIESMULTISETUNCHANGED_H_INCLUDED */

