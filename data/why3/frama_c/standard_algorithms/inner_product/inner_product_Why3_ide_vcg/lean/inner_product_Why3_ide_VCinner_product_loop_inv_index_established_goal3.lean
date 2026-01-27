import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.inner_product.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.inner_product.lib.lean.A_InnerProductAxiomatic.A_InnerProductAxiomatic
import frama_c.standard_algorithms.inner_product.lib.lean.Compound.Compound
import frama_c.standard_algorithms.inner_product.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace inner_product_Why3_ide_VCinner_product_loop_inv_index_established_goal3
theorem goal3 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Cint.is_uint32 i) (fact4 : Cint.is_sint32 i_1) (fact5 : Axiomatic1.p_productbounds t_1 a_1 a i) (fact6 : Axiomatic1.p_innerproductbounds t_1 a_1 a i i_1) (fact7 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact8 : Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) : (0 : ℤ) ≤ i
  := sorry
end inner_product_Why3_ide_VCinner_product_loop_inv_index_established_goal3
