
#ifndef COUNTSECTIONLEMMAS_H_INCLUDED
#define COUNTSECTIONLEMMAS_H_INCLUDED

#include "CountSection.h"




/*@
  requires k <= m <= n ;
  assigns \nothing ;
  ensures \forall value_type v ;
    Count(a, k, n, v) == Count(a, k, m, v) + Count(a, m, n, v) ;
*/
void CountSectionUnion(value_type const* a, size_type k, size_type m, size_type n){
  /*@
    loop invariant m <= i <= n ;
    loop invariant \forall value_type v ;
      Count(a, k, i, v) == Count(a, k, m, v) + Count(a, m, i, v) ;
    loop assigns i ;
    loop variant n - i ;
  */
  for(size_type i = m ; i < n ; ++i);
}

#endif /* COUNTSECTIONLEMMAS_H_INCLUDED */

