
#ifndef HEAPMAXIMUM_LEMMA_INCLUDED
#define HEAPMAXIMUM_LEMMA_INCLUDED

#include "MaxElement.h"
#include "IsHeap.h"
#include "C_Division.h"




/*@
  requires 1 <= n && IsHeap(a, n) ;
  assigns \nothing ;
  ensures MaxElement(a, n, 0) ;
*/
void HeapMaximum(value_type* a, size_type n){
  /*@
    loop invariant 0 <= i <= n ;
    loop invariant \forall size_type j ; 0 <= j < i ==> a[j] <= a[0] ;
    loop assigns i ;
    loop variant n - i ;
  */
  for(size_type i = 0 ; i < n ; i++){
    //@ assert \true;
    //@ assert \true;
  }
}


#endif /* HEAPMAXIMUM_LEMMA_INCLUDED */

