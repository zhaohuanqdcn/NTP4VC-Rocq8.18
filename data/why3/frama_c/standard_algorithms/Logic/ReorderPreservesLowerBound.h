
#ifndef REORDERPRESERVESLOWERBOUND_H_INCLUDED
#define REORDERPRESERVESLOWERBOUND_H_INCLUDED

#include "MultisetUnchanged.h"
#include "LowerBound.h"
#include "ReorderImpliesMatch.h"



/*
/@
  assigns a[0 .. n-1] ;
  ensures MultisetUnchanged{Pre, Post}(a, n) ;
@/
void havoc_l(value_type* a, size_type n);

/@
  requires LowerBound(_a, _n, _v) ;
  assigns _a[0 .. _n-1] ;
  ensures LowerBound(_a, _n, _v) ;
@/
void ReorderPreservesLowerBound_(value_type* _a, size_type _n, value_type _v){
  //@ ghost _K: ;
  //@ assert \true;
  
  havoc_l(_a, _n) ;
  /@
    loop invariant 0 <= _i <= _n ;
    loop invariant LowerBound(_a, _i, _v) ;
    loop assigns _i ;
    loop variant _n-_i ;
  @/
  for(size_type _i = 0 ; _i < _n ; ++_i){
    //@ assert \true;
  }
}
*/

#define ReorderPreservesLowerBound_Pre(_a, _n)\
  ReorderImpliesMatch_Pre(_a, _n);

#define ReorderPreservesLowerBound(_K, _L, _a, _m, _n, _v)	\
  /@							\
  loop invariant 0 <= _i <= _m ;			\
  loop invariant LowerBound{_L}(_a, _i, _v) ;		\
  loop assigns _i ;					\
  loop variant _n-_i ;					\
  @/							\
  for(size_type _i = 0 ; _i < _m ; ++_i){		\
    ReorderImpliesMatch(_K, _L, _a, _n, _i);		\
  }							\
  /@ assert \true; @/


#endif /* REORDERPRESERVESLOWERBOUND_H_INCLUDED */

