
#ifndef REORDERPRESERVESUPPERBOUND_H_INCLUDED
#define REORDERPRESERVESUPPERBOUND_H_INCLUDED

#include "MultisetUnchanged.h"
#include "UpperBound.h"




/*
/@
  assigns a[0 .. n-1] ;
  ensures MultisetUnchanged{Pre, Post}(a, n) ;
@/
void havoc_r(value_type* a, size_type n);

/@
  requires UpperBound(_a, _n, _v) ;
  assigns _a[0 .. _n-1] ;
  ensures UpperBound(_a, _n, _v) ;
@/
void ReorderPreservesUpperBound_(value_type* _a, size_type _n, value_type _v){
  //@ ghost _K: ;
  //@ assert \true;
  
  havoc_r(_a, _n) ;
  /@
    loop invariant 0 <= _i <= _n ;
    loop invariant UpperBound(_a, _i, _v) ;
    loop assigns _i ;
    loop variant _n-_i ;
  @/
  for(size_type _i = 0 ; _i < _n ; ++_i){
    //@ assert \true;
  }
}
*/

#define ReorderPreservesUpperBound_Pre(_a, _n)\
  ReorderImpliesMatch_Pre(_a, _n);

#define ReorderPreservesUpperBound(_K, _L, _a, _m, _v)	\
  /@							\
  loop invariant 0 <= _i <= _m ;			\
  loop invariant UpperBound{_L}(_a, _i, _v) ;		\
  loop assigns _i ;					\
  loop variant _m-_i ;					\
  @/							\
  for(size_type _i = 0 ; _i < _m ; ++_i){		\
    ReorderImpliesMatch(_K, _L, _a, _m, _i);		\
  }							\
  /@ assert \true; @/

#endif /* REORDERPRESERVESUPPERBOUND_H_INCLUDED */

