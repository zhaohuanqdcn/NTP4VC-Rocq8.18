
#ifndef REORDERIMPLIESMATCH_H_INCLUDED
#define REORDERIMPLIESMATCH_H_INCLUDED

#include "HasValueImpliesPositiveCount.h"
#include "PositiveCountImpliesHasValue.h"



/*
/@
  assigns a[0 .. n-1];
  ensures MultisetUnchanged{Pre,Post}(a, n) ;
@/
void havoc_1(value_type *a, size_type n) ;

/@
  requires 0 <= i < n ;
  assigns a[0 .. n-1];
  ensures HasValue{Pre}(a, n, \at(a[i], Post));
@/
void x_1(value_type *a, size_type n, size_type i){
  PositiveCountImpliesHasValueGeneral(a, 0, n);
  havoc_1(a, n);
  //@ assert \true;
  HasValueImpliesPositiveCount(a, 0, n) ;
  //@ assert \true;
  //@ assert \true;
}
*/

#define ReorderImpliesMatch_Pre(_a, _n)\
  PositiveCountImpliesHasValueGeneral(_a, 0, _n);

#define ReorderImpliesMatch(_K, _L, _a, _n, _i)				\
  /@ assert \true; @/				\
  HasValueImpliesPositiveCount(_a, 0, _n) ;				\
  /@ assert \true; @/			\
  /@ assert \true; @/			\
  /@ assert \true; @/

#endif /* REORDERIMPLIESMATCH_H_INCLUDED */

