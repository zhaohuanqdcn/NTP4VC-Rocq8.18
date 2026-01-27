
#ifndef EQUALRANGESPRESERVESSORTED_H_INCLUDED
#define EQUALRANGESPRESERVESSORTED_H_INCLUDED

#include "Sorted.h"
#include "EqualRanges.h"



/*
/@
  assigns a[m .. n], a[m+p .. n+p] ;
  ensures EqualRanges{Pre,Post}(a, m, n, m+p) ;
@/
void havoc(value_type* a, size_type m, size_type n, size_type p);
*/

/* // Preparing MACRO

/@
  requires Sorted{Pre}(_a, _m, _n) ;
  requires _m <= _n ;
  assigns _a[_m .. _n], _a[_m+_p .. _n+_p] ;
@/
void x(value_type* _a, size_type _m, size_type _n, size_type _p){
  havoc(_a, _m, _n, _p);
  
  /@
    loop invariant _m <= _i <= _n ;
    loop invariant Sorted{Pre}(_a, _m, \at(_i, Here)) ;
    loop invariant Sorted{Here}(_a, _m + _p, _i + _p);
    loop assigns _i;
    loop variant _n - _i ;
  @/
  for(size_type _i = _m ; _i < _n ; ++_i){
    /@ assert \true; @/    
    //@ assert \true;
  }
}
*/


#define EqualRangesPreservesSorted(_K,_L,_a,_m,_n,_p)			\
  /@ assert \true; @/					\
  /@ assert \true; @/			\
  /@									\
    loop invariant _m <= _i <= _n ;					\
    loop invariant Sorted{_K}(_a, _m, \at(_i, Here)) ;			\
    loop invariant Sorted{_L}(_a, _m + _p, \at(_i, Here) + _p);		\
    loop assigns _i;							\
    loop variant _n - _i ;						\
  @/									\
  for(size_type _i = _m ; _i < _n ; ++_i){				\
    /@ assert \true; @/									\
    /@ assert \true; @/									\
  }			   						\
  /@ assert \true; @/

/*

/@
  requires m <= n ;
  requires Sorted(a, m, n) ;
@/
void test_EqualRangesPreservesSorted(value_type* a, size_type m, size_type n, size_type p){
  havoc(a, m, n, p);
  //@ assert \true;
}

*/

#endif /* EQUALRANGESPRESERVESSORTED_H_INCLUDED */

