
#ifndef COUNTLEMMAS_H_INCLUDED
#define COUNTLEMMAS_H_INCLUDED

#include "CountLogic.h"
#include "CountSectionLemmas.h"





/*@
  requires m <= n ;
  assigns \nothing ;
  ensures \forall value_type v ;
    Count(a, n, v) == Count(a, 0, m, v) + Count(a, m, n, v) ;
*/
void CountUnion(value_type const* a, size_type m, size_type n){
  CountSectionUnion(a, 0, m, n) ;
}


#endif /* COUNTLEMMAS_H_INCLUDED */

