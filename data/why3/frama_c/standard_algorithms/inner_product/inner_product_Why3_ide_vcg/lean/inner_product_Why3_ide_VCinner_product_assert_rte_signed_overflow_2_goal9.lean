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
namespace inner_product_Why3_ide_VCinner_product_assert_rte_signed_overflow_2_goal9
theorem goal9 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_2 : ℤ) (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (i_1 : ℤ) : let x : ℤ := t_1 (Memory.shift a i_2); let x_1 : ℤ := t_1 (Memory.shift a_1 i_2); i_2 ≤ i → (0 : ℤ) ≤ i_2 → i_2 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_2 → Cint.is_sint32 i_1 → Axiomatic1.p_productbounds t_1 a_1 a i → Cint.is_sint32 x → Cint.is_sint32 x_1 → Axiomatic1.p_innerproductbounds t_1 a_1 a i i_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i → Cint.is_sint32 (A_InnerProductAxiomatic.l_innerproduct t_1 a_1 a i_2 i_1) → x * x_1 ≤ (2147483647 : ℤ)
  := sorry
end inner_product_Why3_ide_VCinner_product_assert_rte_signed_overflow_2_goal9
