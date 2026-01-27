
#include "partial_sort_copy.h"

#include "../../mutating/copy/copy.h"
#include "../../heap/make_heap/make_heap.h"
#include "../../heap/pop_heap/pop_heap.h"
#include "../../heap/push_heap/push_heap.h"
#include "../../heap/sort_heap/sort_heap.h"



//#define DANGEROUS_HYPOTHESES		/* needed for g7,gC,h1,h4,h5 */



#ifdef DANGEROUS_HYPOTHESES
#include "CountBounds.h"
#include "CountLemmas.h"
#include "LowerBound.h"
#include "HeapMaximum.h"




#endif



void partial_sort_copy(const value_type* a, size_type m,
                             value_type* b, size_type n)
{
  if (n > 0u) {

    copy(a, n, b);

    //@ ghost L1:

    //@ assert \true;
    //@ assert \true;
    make_heap(b, n);
    //  assert b1: MultisetUnchanged{L1,Here}(b, n);
    //@ assert \true;
    //@ assert \true;

    /*@
      loop invariant c1: 0 <= i <= m;
      loop invariant c2: IsLeastPartOf(a, i, b, n);
      loop invariant c3: IsHeap(b, n);
      loop assigns   c4: b[0..n-1], i;
      loop variant   c5: m-i;
    */
    for (size_type i = n; i < m; ++i) {
      if (a[i] < b[0]) {	// a[i] better than heap root, swap-in
	value_type const old_b0 = b[0];

	//@ ghost L2:

#ifdef DANGEROUS_HYPOTHESES
	//@ assert \true;
	//@ assert \true;
	//@ assert \true;
	//@ assert \true;
	//@ assert \true;
	//@ assert \true;
#endif

	pop_heap(b, n);

	//@ ghost L3:

	//@ assert \true;
	//@ assert \true;
	b[n-1] = a[i];

	//@ ghost L4:

	//@ assert \true;
	//@ assert \true;
	//  assert f3: Count{Here}(b,n,old_b0) == Count{L3}(b,n,old_b0) - 1;
	//@ assert \true;
	//@ assert \true;
	//@ assert \true;
	//@ assert \true;
	//@ assert \true;
	//@ assert \true;
	push_heap(b, n);

	//@ ghost L5:

	//  assert g1: MultisetUnchanged{L4,Here}(b, n);
	//@ assert \true;
	//@ assert \true;
	//@ assert \true;
	//@ assert \true;
	//  assert g6: \forall value_type v,w; v==a[i] && w==old_b0 && Count{Here}(b,n,v)>0 && IsInComplement{Here}(a,i+1,b,n,w) ==> v <= w;
	//@ assert \true;
	//  assert g8: \forall value_type v,w; v==a[i] && w!=old_b0 && Count{Here}(b,n,v)>0 && IsInComplement{Here}(a,i+1,b,n,w) ==> IsInComplement{L2}(a,i,b,n,w);
	//  assert g9: \forall value_type v,w; v==a[i] && w!=old_b0 && Count{Here}(b,n,v)>0 && IsInComplement{Here}(a,i+1,b,n,w) ==> old_b0 <= w;
	//  assert gA: \forall value_type v,w; v==a[i] && w!=old_b0 && Count{Here}(b,n,v)>0 && IsInComplement{Here}(a,i+1,b,n,w) ==> v <= w;
	//  assert gB: \forall value_type v,w; v!=a[i] && w==old_b0 && Count{Here}(b,n,v)>0 && IsInComplement{Here}(a,i+1,b,n,w) ==> Count{L2}(b,n,v)>0;
	//@ assert \true;
	//  assert gD: \forall value_type v,w; v!=a[i] && w!=old_b0 && Count{Here}(b,n,v)>0 && IsInComplement{Here}(a,i+1,b,n,w) ==> v <= w;
	//  assert gE: IsLeastPartOf(a, i+1, b, n);
      } else {
	//  assert h1: UpperBound(b,n,a[i]);
	//@ assert \true;
	//@ assert \true;
	//@ assert \true;
	//@ assert \true;
	//@ assert \true;
      }
    }

    //@ ghost L6:

    //@ assert \true;
    sort_heap(b, n);
    //@ assert \true;
    //@ assert \true;
    //@ assert \true;
    //@ assert \true;
  }
}

