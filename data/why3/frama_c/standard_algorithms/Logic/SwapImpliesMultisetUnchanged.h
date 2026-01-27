
#ifndef SWAPIMPLIESMULTISETUNCHANGED_H_INCLUDED
#define SWAPIMPLIESMULTISETUNCHANGED_H_INCLUDED

#include "MultisetUnchangedLemmas.h"




// Prepare macros
/*
/@
  requires i <= k < n ;
  assigns a[i], a[k] ;
  ensures \at(a[i],Pre) == \at(a[k],Post) ;
  ensures \at(a[k],Pre) == \at(a[i],Post) ;
  ensures MultisetUnchanged{Pre,Post}(a, 0,   i) ;
  ensures MultisetUnchanged{Pre,Post}(a, i+1, k) ;
  ensures MultisetUnchanged{Pre,Post}(a, k+1, n) ;
@/
void havoc(value_type* a, size_type i, size_type k, size_type n);

/@
  requires i <= k < n ;
  assigns a[i], a[k] ;
  ensures MultisetUnchanged{Pre,Post}(a, n) ;
@/
void x(value_type* a, size_type i, size_type k, size_type n){
  if(i != k && a[i] != a[k]){
    CountSectionUnion(a, 0, k+1, n) ;
    CountSectionUnion(a, 0, k, k+1) ;
    CountSectionUnion(a, 0, i+1, k) ;
    CountSectionUnion(a, 0, i, i+1) ;
    
    /@ assert \true; @/
  }
  
  havoc(a,i,k,n);
  if(i == k || a[i] == a[k]){
    /@ assert \true; @/
  } else {
    CountSectionUnion(a, 0, k+1, n) ;
    CountSectionUnion(a, 0, k, k+1) ;
    CountSectionUnion(a, 0, i+1, k) ;
    CountSectionUnion(a, 0, i, i+1) ;

    /@ assert \true; @/
    /@ assert \true; @/
    /@ assert \true; @/
  }
}
*/

#define PreSwapImpliesMultisetUnchanged(_a, _i, _k, _n)				\
  if(_i != _k && _a[_i] != _a[_k]){						\
    CountSectionUnion(_a, 0, _k+1, _n) ;					\
    CountSectionUnion(_a, 0, _k, _k+1) ;					\
    CountSectionUnion(_a, 0, _i+1, _k) ;					\
    CountSectionUnion(_a, 0, _i, _i+1) ;		   			\
						   				\
    /@ assert \true; @/										\
  }

#define SwapImpliesMultisetUnchanged(_K, _L, _a, _i, _k, _n)			\
  if(_i == _k || _a[_i] == _a[_k]){						\
    /@ assert \true; @/					\
    /@ assert \true; @/		\
  } else {									\
    CountSectionUnion(_a, 0, _k+1, _n) ;					\
    CountSectionUnion(_a, 0, _k, _k+1) ;					\
    CountSectionUnion(_a, 0, _i+1, _k) ;					\
    CountSectionUnion(_a, 0, _i, _i+1) ;					\
										\
    /@ assert \true; @/										\
    /@ assert \true; @/										\
    /@ assert \true; @/ 	        \
    /@ assert \true; @/		\
    /@ assert \true; @/ 	        \
    /@ assert \true; @/										\
    /@ assert \true; @/		\
  }

#endif /* SWAPIMPLIESMULTISETUNCHANGED_H_INCLUDED */

