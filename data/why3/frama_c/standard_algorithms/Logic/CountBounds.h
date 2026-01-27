
#ifndef COUNTBOUNDS_H_INCLUDED
#define COUNTBOUNDS_H_INCLUDED

// #include "CountLogic.h"
// #include "CountSectionLemmas.h"



/*@
  requires m <= n ;
  assigns \nothing ;
  ensures \forall value_type v ; 0 <= Count(a, m, n, v) <= n-m ;
*/
void CountSectionBounds(value_type const* a, size_type m, size_type n){
  /*@
    loop invariant m <= i <= n ;
    loop invariant \forall value_type v ; 0 <= Count(a, m, i, v) <= i-m ;
    loop assigns i ;
    loop variant n-i ;
  */
  for(size_type i = m ; i < n ; ++i);
}

/*@
  assigns \nothing ;
  ensures \forall value_type v ; 0 <= Count(a, n, v) <= n ;
*/
void CountBounds(value_type const* a, size_type n){
  CountSectionBounds(a, 0, n);
}


#endif /* COUNTBOUNDS_H_INCLUDED */

