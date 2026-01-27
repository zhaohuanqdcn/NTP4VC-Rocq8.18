
#include "pop_heap.h"
#include "maximum_heap_child.h"
#include "HeapMaximum.h"

void pop_heap(value_type* a, size_type n)
{
  if (1u < n) { // otherwise nothings needs to be done

    const value_type v = a[0u];
    //@ assert \true;
    //@ assert \true;

    if (a[n - 1u] < v) { // otherwise nothings needs to be done
      //@ assert \true;
      size_type hole = 0u;
      size_type child = maximum_heap_child(a, n, hole);
      //@ assert \true;

      /*@
          loop invariant bounds: 0 <= hole < n-1;
          loop invariant bounds: hole < child;
          loop invariant heap:   IsHeap(a, n);
          loop invariant heap:   a[n-1] < a[HeapParent(hole)];
          loop invariant heap:   child < n - 1  ==>  hole == HeapParent(child);
          loop invariant child:  HeapMaximumChild(a, n, hole, child);
          loop invariant max:    UpperBound(a, 0, n, v);
          loop assigns           hole, child, a[0..n-2];
          loop variant           n - hole;
       */
      while (child < n - 1u && a[n - 1u] < a[child]) {
        a[hole] = a[child];
        hole    = child;
        //@ assert \true;
        child = maximum_heap_child(a, n, hole);
      }

      //@ assert \true;
      //@ assert \true;
      //@ assert \true;
      //@ assert \true;
      a[hole]   = a[n - 1u];
      //@ assert \true;
      a[n - 1u] = v;
      //@ assert \true;

      //@ assert \true;
    }
  }
}

