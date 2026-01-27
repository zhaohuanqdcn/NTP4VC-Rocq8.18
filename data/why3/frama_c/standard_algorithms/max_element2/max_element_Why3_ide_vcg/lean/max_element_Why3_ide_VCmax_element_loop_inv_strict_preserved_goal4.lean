import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.max_element2.lib.lean.Compound.Compound
import frama_c.standard_algorithms.max_element2.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace max_element_Why3_ide_VCmax_element_loop_inv_strict_preserved_goal4
theorem goal4 (a : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a i_1; let x : ℤ := t_1 a_1; let a_2 : Memory.addr := Memory.shift a i_2; let x_1 : ℤ := t_1 a_2; let a_3 : Memory.addr := Memory.shift a (0 : ℤ); (0 : ℤ) < i → i_2 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → (0 : ℤ) ≤ i_2 → i_2 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x < x_1 → i_2 ≤ (4294967294 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 (t_1 a_3) → Cint.is_sint32 x → Cint.is_sint32 x_1 → Memory.valid_rd t a_3 i → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rd t a_2 (1 : ℤ) → Axiomatic.p_upperbound_1' t_1 a (0 : ℤ) i_2 x → Axiomatic.p_strictupperbound_1' t_1 a (0 : ℤ) i_1 x → Axiomatic.p_strictupperbound_1' t_1 a (0 : ℤ) i_2 x_1
  := sorry
end max_element_Why3_ide_VCmax_element_loop_inv_strict_preserved_goal4
