
#include "partial_sort.h"

#include "../../heap/make_heap/make_heap.h"
#include "../../heap/pop_heap/pop_heap.h"
#include "../../heap/push_heap/push_heap.h"
#include "../../heap/sort_heap/sort_heap.h"
#include "../../mutating/swap/swap.h"

#include "LowerBound.h"
#include "MultisetUnchangedLemmas.h"
#include "MultisetUnchangedPreservesPartition.h"
#include "HeapMaximum.h"

#include "ReorderPreservesLowerBound.h"
#include "ReorderPreservesUpperBound.h"
#include "PartialReorderPreservesLowerBounds.h"
#include "SwappedInside.h"
#include "SwappedInsideMultisetUnchanged.h"

void partial_sort(value_type* a, size_type m, size_type n)
{
  if (m > 0u) {
    make_heap(a, m);
    //@ assert \true;
    //@ assert \true;
    
    /*@
      loop invariant bound:     m <= i <= n;
      loop invariant heap:      IsHeap(a, m);
      loop invariant upper:     UpperBound(a, 0, m, a[0]);
      loop invariant lower:     LowerBound(a, m, i, a[0]);
      loop invariant reorder:   MultisetUnchanged{Pre,Here}(a, i);
      loop invariant unchanged: Unchanged{Pre,Here}(a, i, n);
      loop assigns              i, a[0..n-1];
      loop variant              n-i;
    */
    for (size_type i = m; i < n; ++i)
      if (a[i] < a[0]) {
	//@ ghost Loop: ;
	//@ assert \true;

        pop_heap(a, m);
	//@ ghost Popped: ;
	
	/*@
	  assigns \nothing ;
	  ensures MultisetUnchanged{Pre, Popped}(a, i+1);
	*/ {
	  //@ assert \true;
	  //@ assert \true;
	  //@ assert \true;
	}
	
	//@ assert \true;
        //@ assert \true;
	
	//@ assert \true;
	
	swap(a + m - 1u, a + i);
	//@ ghost Swapped: ;
	/*@ 
	  assigns \nothing ;
	  ensures SwappedInside{Popped, Swapped}(a, m-1, i, i+1) ;
	  ensures Unchanged{Popped, Swapped}(a, i+1, n) ;
	*/ {
	  //@ assert \true;
	  //@ assert \true;
	  //@ assert \true;
	  //@ assert \true;
	  //@ assert \true;
	}
	
	/*@ 
	  assigns \nothing ;
	  ensures MultisetUnchanged{Popped, Swapped}(a, i+1) ;
	*/ {
	  //@ assert \true;
	}
	
        //@ assert \true;
        //@ assert \true;
	
	//@ assert \true;
	//@ assert \true;
        push_heap(a, m);
	//@ ghost Pushed: ; 
	//@ assert \true;
	
	/*@ 
	  assigns \nothing ;
	  ensures lower: LowerBound{Pushed}(a,m,i+1,a[0]);
	*/ {
	  //@ assert \true;
	  //@ assert \true;
	  //@ assert \true;
	  //@ assert \true;
	  //@ assert \true;
	  //@ assert \true;
	}

	/*@
	  assigns \nothing ;
	  ensures MultisetUnchanged{Swapped, Pushed}(a, i+1);
	*/ {
	  //@ assert \true;
	  //@ assert \true;
	  //@ assert \true;
	}
	//@ assert \true;
      }
    //@ assert \true;
   
    //@ ghost End: ;
    //@ assert \true;
    //@ assert \true;
    
    /* @
      assigns           a[0..m-1];
      ensures sorted:   Sorted(a, m);
      ensures reorder:  MultisetUnchanged{Old,Here}(a, m);
      ensures reorder:  Unchanged{Old,Here}(a, m, n);
    */
    sort_heap(a, m);
    //@ assert \true;
    //@ assert \true;
    //@ assert \true;
    //@ assert \true;
    
    //@ assert \true;
    //@ assert \true;
  }
}

