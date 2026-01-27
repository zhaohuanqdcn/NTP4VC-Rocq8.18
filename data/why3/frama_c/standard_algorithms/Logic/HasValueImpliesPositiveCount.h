
#ifndef HASVALUEIMPLIESPOSITIVECOUNT_H_INCLUDED
#define HASVALUEIMPLIESPOSITIVECOUNT_H_INCLUDED

#include "HasValue.h"
#include "CountBounds.h"
#include "CountSectionLemmas.h"



/*@
  requires m <= n ;
  assigns \nothing ;
  ensures \forall value_type v ; HasValue(a, m, n, v) ==> Count(a, m, n, v) > 0;
*/
void HasValueImpliesPositiveCount(value_type *a, size_type m, size_type n){
  //@ assert \true;

  /*@
    loop invariant m <= i <= n ;
    loop invariant i < n ==> HasValue(a, m, n, a[i]) ;
    loop invariant \forall integer j ; m <= j < i ==> Count(a, m, n, a[j]) > 0 ;
    loop assigns i ;
    loop variant n - i ;
  */
  for(size_type i = m ; i < n ; ++i){
    CountSectionBounds(a, i+1, n) ;
    CountSectionBounds(a, m, i) ;
    //@ assert \true;
    //@ assert \true;
    CountSectionUnion(a, m, i+1, n) ;
  }
}

#endif /* HASVALUEIMPLIESPOSITIVECOUNT_H_INCLUDED */

