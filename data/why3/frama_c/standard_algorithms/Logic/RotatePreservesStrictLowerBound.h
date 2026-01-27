
#ifndef ROTATEPRESERVESSTRICTLOWERBOUND_H_INCLUDED
#define ROTATEPRESERVESSTRICTLOWERBOUND_H_INCLUDED

#include "StrictLowerBound.h"
#include "EqualRanges.h"



/* Preparing macro
/@
  assigns a [ m .. n ] ;
  ensures EqualRanges{Pre,Post}(a, m, n, m+1) ;
  ensures EqualRanges{Pre,Post}(a, n, n+1, m) ;
@/
void havoc(value_type* a, size_type m, size_type n);

/@ 
  requires StrictLowerBound{Pre}(a, m, n, \at(a[n],Pre)) ;
  assigns a [ m .. n ] ;
  ensures StrictLowerBound{Post}(a, m+1, n+1, \at(a[m],Post));
@/
void x(value_type* a, size_type m, size_type n){
  havoc(a, m, n);

  if(m <= n){
    /@
      loop invariant m <= i <= n ;
      loop invariant StrictLowerBound{Pre}(a, m, \at(i, Here), \at(a[n],Pre)) ;
      loop invariant StrictLowerBound(a, m+1, i+1, a[m]);
      loop assigns i ;
      loop variant n - i ;
    @/
    for(size_type i = m ; i < n ; ++i){
      /@ assert \true; @/    
      //@ assert \true;
    }
    //@ assert \true;
  }
}
*/

#define RotatePreservesStrictLowerBound(_K, _L, _a, _m, _n)				\
  /@ assert \true; @/			\
  if(_m <= _n){										\
    /@											\
      loop invariant _m <= _i <= _n ;							\
      loop invariant StrictLowerBound{_K}(_a, _m, \at(_i, Here), \at(_a[_n],_K)) ;	\
      loop invariant StrictLowerBound{_L}(_a, _m+1, \at(_i, Here)+1, \at(a[_m], _L)); 	\
      loop assigns _i ;									\
      loop variant _n - _i ;								\
    @/											\
    for(size_type _i = _m ; _i < _n ; ++_i){						\
      /@ assert \true; @/										\
      /@ assert \true; @/										\
    }											\
  }											\
  /@ assert \true; @/

#endif /* ROTATEPRESERVESSTRICTLOWERBOUND_H_INCLUDED */

