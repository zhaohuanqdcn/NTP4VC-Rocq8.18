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
namespace inner_product_Why3_ide_VCinner_product_assert_rte_unsigned_overflow_goal12
theorem goal12 (a : Memory.addr) (i_2 : ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a i_2; let x : ℤ := t_1 a_2; let a_3 : Memory.addr := Memory.shift a_1 i_2; let x_1 : ℤ := t_1 a_3; let x_2 : ℤ := x * x_1; let x_3 : ℤ := A_InnerProductAxiomatic.l_innerproduct t_1 a_1 a i_2 i_1; let x_4 : ℤ := x_3 + Cint.to_sint32 x_2; i_2 ≤ i → (0 : ℤ) ≤ i_2 → i_2 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ x_2 → x_2 ≤ (2147483647 : ℤ) → -(2147483648 : ℤ) ≤ x_4 → x_4 ≤ (2147483647 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_2 → Cint.is_sint32 i_1 → Axiomatic1.p_productbounds t_1 a_1 a i → Cint.is_sint32 x → Cint.is_sint32 x_1 → Axiomatic1.p_innerproductbounds t_1 a_1 a i i_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i → Memory.valid_rd t a_3 (1 : ℤ) → Cint.is_sint32 x_3 → i_2 ≤ (4294967294 : ℤ)
  := sorry
end inner_product_Why3_ide_VCinner_product_assert_rte_unsigned_overflow_goal12
