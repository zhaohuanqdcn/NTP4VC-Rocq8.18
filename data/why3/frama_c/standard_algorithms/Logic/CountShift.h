
#ifndef COUNTSHIFT_H_INCLUDED
#define COUNTSHIFT_H_INCLUDED

#include "CountSectionLemmas.h"



/*@
  requires m + n <= UINT_MAX ;
  assigns \nothing ;
  ensures \forall value_type v ; Count(a+m, 0, n, v) == Count(a, m, m+n, v) ;
*/
void CountShift(value_type const* a, size_type m, size_type n){
  /*@
    loop invariant 0 <= i <= n ;
    loop invariant
      \forall value_type v ; Count(a+m, 0, i, v) == Count(a, m, m+i, v) ;
    loop assigns i ;
    loop variant n - i ;
  */
  for(size_type i = 0 ; i < n ; ++i) ;
}


#endif /* COUNTSHIFT_H_INCLUDED */

