
#include "remove.h"
#include "../remove_copy/remove_copy.h"
#include "../../nonmutating/find2/find2.h"
#include "CountShift.h"
#include "UnchangedShift.h"
#include "HasValueImpliesPositiveCount.h"
#include "PositiveCountImpliesHasValue.h"

size_type remove(value_type* a, size_type n, value_type v)
{
  const size_type f = find(a, n, v);
  //@ assert \true;

  if (f < n) {
    //@ assert \true;

    /*@
      assigns            m, a[f..n-1];
      ensures bound:     0 <= m <= n-f-1;
      ensures size:      m == n-f-1 - Count{Old}(a+f+1, n-f-1, v);
      ensures retain:    MultisetRetainRest{Old,Here}(a+f+1, n-f-1, a+f, m, v);
      ensures discard:   !HasValue(a+f, 0, m, v);
      ensures unchanged: Unchanged{Old,Here}(a+f, m, n-f);
      ensures unchanged: Unchanged{Old,Here}(a, 0, f);
    */
    const size_type m = remove_copy(a + f + 1u, n - f - 1u, a + f, v);

    //@ assert \true;

    //@ assert \true;
    //@ assert \true;
    //@ assert \true;
    //@ assert \true;
    //@ assert \true;
    //@ assert \true;
    //@ assert \true;
    return f + m;
  }
  else {
    //@ assert \true;
    //@ assert \true;
    return n;
  }
}

