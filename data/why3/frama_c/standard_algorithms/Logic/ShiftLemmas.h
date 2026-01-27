#ifndef SHIFTLEMMAS_H_INCLUDED
#define SHIFTLEMMAS_H_INCLUDED

#include "Sorted.h"
#include "LowerBound.h"
#include "StrictLowerBound.h"
#include "StrictUpperBound.h"
#include "UpperBound.h"



/*@
  requires \forall integer i, j; 0 <= i < j < up ==> p[i] <= p[j];
  assigns \nothing ;
  ensures Sorted(p, up);
*/
void ForceSorted(value_type const* p, size_type up){}

/*@
  requires Sorted(a, l, r);
  requires l <= r ;
  assigns \nothing ;
  ensures Sorted(a+l, r-l);
*/
void SortedShift(value_type const* a, size_type l, size_type r){
  //@ assert \true;
  //@ assert \true;
  //@ assert \true;
}



/*@
  requires LowerBound(a,   b, c,   val) ;
  assigns \nothing ;
  ensures \forall integer j ; b <= j < c ==> a[j] >= val ;
*/
void LowerBoundForce(value_type const* a, size_type b, size_type c, value_type val){}

/*@
  requires d + b <= UINT_MAX ;
  requires LowerBound(a+b, c,   d,   val) ;
  assigns \nothing ;
  ensures LowerBound(a,   c+b, d+b, val);
*/
void LowerBoundShift(value_type const* a, size_type c, size_type d, size_type b, value_type val){
  //@ assert \true;
}



/*@
  requires StrictLowerBound(a,   b, c,   val) ;
  assigns \nothing ;
  ensures \forall integer j ; b <= j < c ==> a[j] > val ;
*/
void StrictLowerBoundForce(value_type const* a, size_type b, size_type c, value_type val){}

/*@
  requires d + b <= UINT_MAX ;
  requires StrictLowerBound(a+b, c,   d,   val) ;
  assigns \nothing ;
  ensures StrictLowerBound(a,   c+b, d+b, val);
*/
void StrictLowerBoundShift(value_type const* a, size_type c, size_type d, size_type b, value_type val){
  //@ assert \true;
}



/*@
  requires UpperBound(a,   b, c,   val) ;
  assigns \nothing ;
  ensures \forall integer j ; b <= j < c ==> a[j] <= val ;
*/
void UpperBoundForce(value_type const* a, size_type b, size_type c, value_type val){}

/*@
  requires b <= c ;
  requires UpperBound(a+b, 0, c-b, val) ;
  assigns \nothing ;
  ensures  UpperBound(a,   b, c,   val);
*/
void UpperBoundShift(value_type const* a, size_type b, size_type c, value_type val){
  //@ assert \true;
}



/*@
  requires StrictUpperBound(a,   b, c,   val) ;
  assigns \nothing ;
  ensures \forall integer j ; b <= j < c ==> a[j] < val ;
*/
void StrictUpperBoundForce(value_type const* a, size_type b, size_type c, value_type val){}

/*@
  requires b <= c ;
  requires StrictUpperBound(a+b, 0, c-b, val) ;
  assigns \nothing ;
  ensures  StrictUpperBound(a,   b, c,   val);
*/
void StrictUpperBoundShift(value_type const* a, size_type b, size_type c, value_type val){
  //@ assert \true;
}

#endif /* SHIFTLEMMAS_H_INCLUDED */
