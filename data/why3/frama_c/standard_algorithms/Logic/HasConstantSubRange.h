
#ifndef  HASCONSTANTSUBRANGE_H_INCLUDED
#define  HASCONSTANTSUBRANGE_H_INCLUDED

#include "ConstantRange.h"

/*@
  predicate
    HasConstantSubRange{A}(value_type* a, integer m, integer n, value_type b) =
      \exists integer i; 0 <= i <= m-n && ConstantRange(a, i, i+n, b);
*/


#endif /*  HASCONSTANTSUBRANGE_H_INCLUDED */

