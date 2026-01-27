
#include "push_heap.h"
#include "../is_heap/heap_aux.h"
#include "CountLemmas.h"
#include "MultisetAdd.h"
#include "MultisetAddDistinct.h"
#include "MultisetMinus.h"
#include "MultisetMinusDistinct.h"
#include "MultisetRetainRest2.h"
#include "MultisetPushHeapRetain.h"
#include "MultisetPushHeapClosure.h"

void push_heap(value_type* a, size_type n)
{
  // start of prologue
  if (1u < n) { // otherwise nothings needs to be done

    const value_type v      = a[n - 1];
    size_type  hole = heap_parent(n - 1);

    if (a[hole] < v) {
      a[n - 1] = a[hole] ;
      //@ assert \true;
      //@ assert \true;
      //@ assert \true;
      //@ assert \true;
      //@ assert \true;

      // end of prologue
      // start of main act
      if (0u < hole) {
        size_type parent = heap_parent(hole);

        /*@
          loop invariant bound:  0 <= hole < n-1;
          loop invariant heap:   IsHeap(a, n);
          loop invariant heap:   parent == HeapParent(hole);
          loop invariant less:   a[hole] < v;
          loop invariant add:    MultisetAdd{Pre,Here}(a, n, a[hole]);
          loop invariant minus:  MultisetMinus{Pre,Here}(a, n, v);
          loop invariant retain: MultisetRetainRest{Pre,Here}(a, n, v, a[hole]);
          loop assigns           hole, parent, a[0..n-1];
          loop variant           hole;
        */
        while (0u < hole && a[parent] < v) {
          //@ ghost Loop: // LoopEntry not yet supported!
          //@ assert \true;

          if (a[hole] < a[parent]) {
	    //@ assert \true;
	    //@ assert \true;
	    
            a[hole] = a[parent];
            //@ assert \true;
            //@ assert \true;

	    //@ assert \true;
	    //@ assert \true;

	    //@ assert \true;
	    //@ assert \true;
	    
	    //@ assert \true;
	    //@ assert \true;
	    //@ assert \true;
            //@ assert \true;
	    	    
	    //@ assert \true;
	    
            //@ assert \true;
            //@ assert \true;
            //@ assert \true;
            //@ assert \true;
            //@ assert \true;
          }

          hole = parent;
          if (0u < hole) {
            parent = heap_parent(hole);
          }
        }
      }
      // end of main act
      // start of epilogue

      //@ ghost Epi:

      //@ assert \true;
      //@ assert \true;

      a[hole] = v;

      //@ assert \true;
      //@ assert \true;

      //@ assert \true;
      //@ assert \true;
      
      //@ assert \true;
      //@ assert \true;
      //@ assert \true;
      //@ assert \true;

      //@ assert \true;
      
      //@ assert \true;
      //@ assert \true;
      //@ assert \true;
      //@ assert \true;
      //@ assert \true;
    }
  }
  // end of epilogue
}

