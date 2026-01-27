#ifndef MULTISETUNCHANGEDPRESERVESPARTITION_H_INCLUDED
#define MULTISETUNCHANGEDPRESERVESPARTITION_H_INCLUDED

#include "Partition.h"
#include "MultisetUnchanged.h"
#include "ReorderImpliesMatch.h"

/*
/@
  assigns a[0 .. m-1] ;
  ensures MultisetUnchanged{Pre, Post}(a, m) ;
@/
void havoc_p(value_type* a, size_type m);

/@
  requires _m <= _n ;
  requires Partition(_a, _m, _n) ;
  assigns _a[0 .. _m-1] ;
  ensures Partition(_a, _m, _n) ;
@/
void MultisetUnchangedPreservesPartition_(value_type* _a, size_type _m, size_type _n){
  //@ ghost _K: ;
  //@ assert \true;
  
  havoc_p(_a, _m) ;
  /@
    loop invariant 0 <= _i <= _m ;
    loop invariant 
      \forall integer _j, _k; _i <= _j < _m <= _k < _n ==> _a[_j] <= _a[_k];
    loop assigns _i ;
    loop variant _i ;
  @/
  for(size_type _i = _m ; _i > 0 ; --_i){
    //@ assert \true;
  }
}
*/

#define MultisetUnchangedPreservesPartition_Pre(_a, _m)\
  ReorderImpliesMatch_Pre(_a, _m);

#define MultisetUnchangedPreservesPartition(_K, _L, _a, _m, _n)                \
  /@                                                                   \
  loop invariant 0 <= _i <= _m ;                                       \
  loop invariant                                                       \
    \forall integer _j, _k; _i <= _j < _m <= _k < _n ==>               \
                             _a[_j] <= _a[_k];                         \
  loop assigns _i ;                                                    \
  loop variant _i ;                                                    \
  @/                                                                   \
  for(size_type _i = _m ; _i > 0 ; --_i){                              \
    ReorderImpliesMatch(_K, _L, _a, _m, _i-1);                         \
  }                                                                    \
  /@ assert \true; @/




#endif /* MULTISETUNCHANGEDPRESERVESPARTITION_H_INCLUDED */
