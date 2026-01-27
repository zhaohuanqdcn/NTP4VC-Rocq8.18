
#ifndef PARTIALSUMLEMMAS_H_INCLUDED
#define PARTIALSUMLEMMAS_H_INCLUDED

#include "PartialSum.h"




/*@
  requires 1 <= n ;
  requires PartialSum(a, n, b) ;
  requires b[n] == Accumulate(a, n+1) ;
  assigns \nothing ;
  ensures PartialSum(a, n+1, b) ;
*/
void PartialSumStep(value_type *a, value_type *b, size_type n){}



/* Preparing macro 
/@
  assigns a[0 .. n-1], b[0 .. n-1] ;
  ensures Unchanged{Pre, Post}(a, n) ;
  ensures Unchanged{Pre, Post}(b, n) ;
@/
void havoc(value_type *a, value_type *b, size_type n);

/@
  requires 1 <= n && PartialSum(a, n, b) ;
  assigns a[0 .. n-1], b[0 .. n-1] ;
  ensures PartialSum(a, n, b) ;
@/
void x(value_type *a, value_type *b, size_type n){
  havoc(a, b, n);

  /@
    loop invariant 1 <= i <= n ;
    loop invariant PartialSum{Pre}(a, n, b) ;
    loop invariant PartialSum{Pre}(a, \at(i, Here), b) ==> PartialSum{Here}(a, i, b) ;
    loop assigns i ;
    loop variant n - i ;
  @/
  for(size_type i = 1 ; i < n ; ++i){
    //@ assert \true;
    //@ assert \true;
    PartialSumStep(a, b, i);
  }
}
*/

#define PartialSumUnchanged(_K,_L,_a,_b,_n)				\
  /@ assert \true; @/				\
  /@ assert \true; @/				\
  /@									\
    loop invariant 1 <= _i <= _n ;					\
    loop invariant PartialSum{_K}(_a, _n, _b) ;				\
    loop invariant PartialSum{_K}(_a, \at(_i, _L), b) ==>		\
      PartialSum{_L}(_a, _i, _b) ;					\
    loop assigns _i ;							\
    loop variant _n - _i ;						\
  @/									\
  for(size_type _i = 1 ; _i < _n ; ++_i){				\
    /@ assert \true; @/		\
    /@ assert \true; @/\
    PartialSumStep(_a, _b, _i);						\
  }



#endif /* PARTIALSUMLEMMAS_H_INCLUDED */

