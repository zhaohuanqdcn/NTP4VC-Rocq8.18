
#ifndef COUNTMONOTONIC_H_INCLUDED
#define COUNTMONOTONIC_H_INCLUDED

//#include "CountLogic.h"
//#include "CountSectionLemmas.h"
#include "CountSectionLemmas.h"
#include "CountBounds.h"



/*@
  requires m <= n <= p ;
  assigns \nothing ;
  ensures \forall value_type v ; Count(a, m, n, v) <= Count(a, m, p, v) ;
*/
void CountSectionMonotonic(value_type const* a, size_type m, size_type n, size_type p){
  CountSectionUnion(a, m, n, p) ;
  CountSectionBounds(a, m, n);
  CountSectionBounds(a, n, p);
}

/*@
  requires n <= p ;
  assigns \nothing ;
  ensures \forall value_type v ; Count(a, n, v) <= Count(a, p, v) ;
*/
void CountMonotonic(value_type const* a, size_type n, size_type p){
  CountSectionMonotonic(a, 0, n, p);
}

#endif /* COUNTMONOTONIC_H_INCLUDED */

