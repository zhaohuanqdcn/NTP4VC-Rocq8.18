
#ifndef WEAKLYSORTEDIMPLIESSORTED_H_INCLUDED
#define WEAKLYSORTEDIMPLIESSORTED_H_INCLUDED

#include "Sorted.h"
#include "WeaklySorted.h"



/*@
  requires WeaklySorted(a, m, n);
  assigns \nothing ;
  ensures Sorted(a, m, n);
*/
void WeaklySortedImpliesSorted(value_type const* a, size_type m, size_type n){
  if(m <= n){
    /*@
      loop invariant m <= i <= n ;
      loop invariant WeaklySorted(a, m, n);
      loop invariant Sorted(a, m, i);
      loop assigns i ;
      loop variant n - i ;
    */
    for(size_type i = m ; i < n ; ++i){
      /*@ 
	loop invariant m <= j <= i ;
	loop invariant \forall integer k; j <= k < i ==> a[k] <= a[i] ; 
	loop assigns j ;
	loop variant j ;
      */
      for(size_type j = i ; j > m ; --j);
    }
  }
}


#endif /* WEAKLYSORTEDIMPLIESSORTED_H_INCLUDED */

