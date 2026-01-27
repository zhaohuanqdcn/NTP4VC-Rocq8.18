import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.is_sorted.lib.lean.Compound.Compound
import frama_c.standard_algorithms.is_sorted.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace is_sorted_Why3_ide_VCis_sorted_loop_term_positive_goal6
theorem goal6 (a : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a i_1; let x : ℤ := t_1 a_1; let x_1 : ℤ := (1 : ℤ) + i_1; let x_2 : ℤ := t_1 (Memory.shift a x_1); (0 : ℤ) < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x ≤ x_2 → i_1 ≤ (4294967294 : ℤ) → (2 : ℤ) + i_1 ≤ i → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 x → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t a_1 (1 : ℤ) → Axiomatic.p_weaklysorted_1' t_1 a (0 : ℤ) x_1 → Cint.is_sint32 x_2 → Memory.valid_rd t (Memory.shift a (Cint.to_uint32 x_1)) (1 : ℤ) → i_1 ≤ i
  := sorry
end is_sorted_Why3_ide_VCis_sorted_loop_term_positive_goal6
