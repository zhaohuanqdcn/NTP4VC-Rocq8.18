
#ifndef SWAPPEDINSIDEMULTISETUNCHANGED_H_INCLUDED
#define SWAPPEDINSIDEMULTISETUNCHANGED_H_INCLUDED

#include "SwappedInside.h"
#include "MultisetUnchanged.h"
#include "EqualRangesPreservesCount.h"



/*
/@
  assigns a[i], a[k];
  ensures SwappedInside{Pre,Post}(a, i, k, n) ;
@/
void havoc_s(value_type* a, size_type i, size_type k, size_type n);

/@
  requires 0 <= _i <= _k < _n ;
  assigns _a[_i], _a[_k];
  ensures MultisetUnchanged{Pre, Post}(_a, _n);
@/
void SwappedInsideMultisetUnchanged_(value_type *_a, size_type _i, size_type _k, size_type _n){
  if(_i != _k && _a[_i] != _a[_k]){
    CountSectionUnion(_a, 0, _k+1, _n) ;
    CountSectionUnion(_a, 0, _k, _k+1) ;
    CountSectionUnion(_a, 0, _i+1, _k) ;
    CountSectionUnion(_a, 0, _i, _i+1) ;
    
    /@ assert \true; @/
  }
  
  havoc_s(_a, _i, _k, _n);

  if(_i == _k || _a[_i] == _a[_k]){
    /@ assert \true; @/
  } else {
    CountSectionUnion(_a, 0, _k+1, _n) ;
    CountSectionUnion(_a, 0, _k, _k+1) ;
    CountSectionUnion(_a, 0, _i+1, _k) ;
    CountSectionUnion(_a, 0, _i, _i+1) ;
    /@ assert \true; @/
    /@ assert \true; @/
    /@ assert \true; @/
    /@ assert \true; @/
    /@ assert \true; @/
    /@ assert \true; @/
  }
}
*/

#define SwappedInsideMultisetUnchanged_pre(_a, _i, _k, _n)		\
  if(_i != _k && _a[_i] != _a[_k]){					\
    CountSectionUnion(_a, 0, _k+1, _n) ;				\
    CountSectionUnion(_a, 0, _k, _k+1) ;				\
    CountSectionUnion(_a, 0, _i+1, _k) ;				\
    CountSectionUnion(_a, 0, _i, _i+1) ;				\
									\
    /@ assert \true; @/									\
  }

#define SwappedInsideMultisetUnchanged(_K, _L, _a, _i, _k, _n)			\
  if(_i == _k || _a[_i] == _a[_k]){						\
    /@ assert \true; @/					\
    /@ assert \true; @/				\
  } else {									\
    CountSectionUnion(_a, 0, _k+1, _n) ;					\
    CountSectionUnion(_a, 0, _k, _k+1) ;					\
    CountSectionUnion(_a, 0, _i+1, _k) ;					\
    CountSectionUnion(_a, 0, _i, _i+1) ;					\
    /@ assert \true; @/										\
    /@ assert \true; @/										\
    /@ assert \true; @/		\
    /@ assert \true; @/		\
    /@ assert \true; @/		\
    /@ assert \true; @/										\
    /@ assert \true; @/		\
    /@ assert \true; @/				\
  }  


#endif /* SWAPPEDINSIDEMULTISETUNCHANGED_H_INCLUDED */

