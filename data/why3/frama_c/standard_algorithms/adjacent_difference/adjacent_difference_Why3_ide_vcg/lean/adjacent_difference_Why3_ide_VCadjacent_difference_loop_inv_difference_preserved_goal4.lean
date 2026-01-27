import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.adjacent_difference.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.adjacent_difference.lib.lean.Compound.Compound
import frama_c.standard_algorithms.adjacent_difference.lib.lean.A_DifferenceAxiomatic.A_DifferenceAxiomatic
import frama_c.standard_algorithms.adjacent_difference.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace adjacent_difference_Why3_ide_VCadjacent_difference_loop_inv_difference_preserved_goal4
theorem goal4 (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 (Function.update t_2 a_2 (t_2 a_3)) (Memory.shift a (1 : ℤ)) (i_1 - (1 : ℤ)); let a_5 : Memory.addr := Memory.shift a i_2; let a_6 : Memory.addr -> ℤ := Function.update a_4 a_5 i; let a_7 : Memory.addr := Memory.shift a_1 i_2; let a_8 : ℤ := a_4 a_7; let a_9 : Memory.addr := Memory.shift a_1 (Cint.to_uint32 (i_2 - (1 : ℤ))); let a_10 : ℤ := a_4 a_9; let x : ℤ := (1 : ℤ) + i_2; A_DifferenceAxiomatic.l_difference a_6 a_1 i_2 = i → (0 : ℤ) < i_1 → (0 : ℤ) < i_2 → i_2 ≤ i_1 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_2 ≤ (4294967294 : ℤ) → a_8 ≤ (2147483647 : ℤ) + a_10 → a_10 ≤ (2147483648 : ℤ) + a_8 → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Axiomatic1.p_adjacentdifferencebounds t_2 a_1 i_1 → Cint.is_uint32 x → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_3 i_1 → Memory.valid_rd t a_7 (1 : ℤ) → Memory.valid_rw t a_2 (1 : ℤ) → Memory.valid_rw t a_2 i_1 → Memory.valid_rw t a_5 (1 : ℤ) → Memory.separated a_3 i_1 a_2 i_1 → Memory.valid_rd t a_9 (1 : ℤ) → Cint.is_sint32 a_8 → Cint.is_sint32 a_10 → Axiomatic.p_unchanged_1' a_4 t_2 a_1 (0 : ℤ) i_1 → Axiomatic1.p_adjacentdifference a_4 a_1 i_2 a → Axiomatic.p_unchanged_1' a_6 a_4 a (0 : ℤ) i_2 → Axiomatic1.p_adjacentdifference a_6 a_1 x a
  := sorry
end adjacent_difference_Why3_ide_VCadjacent_difference_loop_inv_difference_preserved_goal4
