
#ifndef POSITIVECOUNTIMPLIESHASVALUE_H_INCLUDED
#define POSITIVECOUNTIMPLIESHASVALUE_H_INCLUDED

#include "HasValue.h"
// #include "CountBounds.h"



/*@
  requires m < n ;
  requires Count(a, m, n, v) > 0 ;
  assigns \nothing ;
  ensures HasValue(a, m, n, v) ;
*/
void PositiveCountImpliesHasValue(value_type const* a, size_type m, size_type n, value_type v){
  /*@
    loop invariant m <= i <= n ;
    loop invariant
      (\forall integer j ; m <= j < i ==> a[j] != v) ==>
        Count(a, m, i, v) == 0 ;
    loop assigns i ;
    loop variant n - i ;
  */
  for(size_type i = m ; i < n ; ++i);
}

/*@
  assigns \nothing ;
  ensures \forall value_type v ; Count(a, m, n, v) > 0 ==> HasValue(a, m, n, v) ;
*/
void PositiveCountImpliesHasValueGeneral(value_type const* a, size_type m, size_type n){
  if(m < n){
    /*@
      loop invariant m <= i <= n ;
      loop invariant \forall value_type v ; 
        (\forall integer j ; m <= j < i ==> a[j] != v) ==>
	  Count(a, m, i, v) == 0 ;
      loop assigns i ;
      loop variant n - i ;
    */
    for(size_type i = m ; i < n ; ++i);
  }
}

#endif /* POSITIVECOUNTIMPLIESHASVALUE_H_INCLUDED */

