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
namespace inner_product_Why3_ide_VCinner_product_assert_rte_mem_access_goal6
theorem goal6 (i_2 : ℤ) (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : i_2 ≤ i) (fact1 : (0 : ℤ) ≤ i_2) (fact2 : i_2 < i) (fact3 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact4 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact5 : Memory.linked t) (fact6 : Cint.is_uint32 i) (fact7 : Cint.is_uint32 i_2) (fact8 : Cint.is_sint32 i_1) (fact9 : Axiomatic1.p_productbounds t_1 a_1 a i) (fact10 : Axiomatic1.p_innerproductbounds t_1 a_1 a i i_1) (fact11 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact12 : Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) (fact13 : Cint.is_sint32 (A_InnerProductAxiomatic.l_innerproduct t_1 a_1 a i_2 i_1)) : Memory.valid_rd t (Memory.shift a_1 i_2) (1 : ℤ)
  := sorry
end inner_product_Why3_ide_VCinner_product_assert_rte_mem_access_goal6
