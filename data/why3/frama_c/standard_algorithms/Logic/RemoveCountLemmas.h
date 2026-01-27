
#ifndef REMOVECOUNTLEMMAS_H_INCLUDED
#define REMOVECOUNTLEMMAS_H_INCLUDED

#include "RemoveCount.h"
#include "CountLemmas.h"
#include "CountBounds.h"
#include "CountMonotonic.h"



/*@
  requires m <= n ;
  assigns \nothing ;
  ensures \forall value_type v ;
    RemoveCount(a, m, v) <= RemoveCount(a, n, v);
*/
void RemoveCountMonotonic(value_type* a, size_type m, size_type n){
  CountUnion(a, m, n);
  CountMonotonic(a, m, n) ;
  CountBounds(a, m);
  CountSectionBounds(a, m, n);
}

/*@
  requires m < n ;
  assigns \nothing ;
  ensures \forall value_type v ; a[m] != v ==>
    RemoveCount(a, m, v) <= RemoveCount(a, n, v);
*/
void RemoveStrictlyMonotonic(value_type* a, size_type m, size_type n){
  RemoveCountMonotonic(a, m+1, n);
}

#endif /* REMOVECOUNTLEMMAS_H_INCLUDED */

