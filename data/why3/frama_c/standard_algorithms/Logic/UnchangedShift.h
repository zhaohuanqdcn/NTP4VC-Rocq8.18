
#ifndef UNCHANGEDSHIFT_H_INCLUDED
#define UNCHANGEDSHIFT_H_INCLUDED

#include "Unchanged.h"
#include "UnchangedStep.h"



/*
/@
  assigns *(a+p + (q .. r)) ;
  ensures Unchanged{Pre, Post}(a+p, q, r) ;
@/
void havoc(value_type* a, size_type q, size_type r, size_type p) ;
*/

/*
  Building the MACRO:

/@
  assigns *(a+p + (q .. r)) ;
  ensures Unchanged{Pre,Post}(a, p+q, p+r) ;
@/
void x(value_type* a, size_type q, size_type r, size_type p){
  havoc(a, q, r, p);

  if(q <= r){
    /@
      loop invariant q <= i <= r ;
      loop invariant Unchanged{Pre, Here}(a, p+q, p+i) ;
      loop invariant Unchanged{Pre, Here}(a+p, q, i) ;
      loop assigns i ;
      loop variant r-i ;
    @/
    for(size_type i = q ; i < r ; ++i);
  }
}

*/

#define UnchangedShift(_K, _L, _a, _q, _r, _p)			\
  /@ assert \true; @/		\
  if(_q <= _r){							\
    /@								\
      loop invariant _q <= _i <= _r ;				\
      loop invariant Unchanged{_K, _L}(_a, _p+_q, _p+_i) ;	\
      loop invariant Unchanged{_K, _L}(_a+_p, _q, _i) ;		\
      loop assigns _i ;						\
      loop variant _r-_i ;					\
    @/								\
    for(size_type _i = _q ; _i < _r ; ++_i);			\
  }								\
  /@ assert \true; @/


/*
/@
  assigns *(a+p + (q .. r)) ;
  ensures Unchanged{Pre,Post}(a, p+q, p+r) ;
@/
void test_UnchangedShift(value_type* a, size_type q, size_type r, size_type p){
  havoc(a, q, r, p);
  //@ assert \true;
}
*/

#endif /* UNCHANGEDSHIFT_H_INCLUDED */

