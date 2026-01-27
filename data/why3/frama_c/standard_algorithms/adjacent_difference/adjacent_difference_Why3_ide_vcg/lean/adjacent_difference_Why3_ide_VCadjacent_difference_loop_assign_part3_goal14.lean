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
namespace adjacent_difference_Why3_ide_VCadjacent_difference_loop_assign_part3_goal14
theorem goal14 (a : Memory.addr) (a_1 : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_2 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_4 : Memory.addr := Memory.shift a (1 : ℤ); let x : ℤ := i_1 - (1 : ℤ); let a_5 : Memory.addr -> ℤ := Memory.havoc t_1 (Function.update t_2 a_2 (t_2 a_3)) a_4 x; let a_6 : Memory.addr := Memory.shift a i_2; let a_7 : Memory.addr -> ℤ := Function.update a_5 a_6 i; let a_8 : Memory.addr := Memory.shift a_1 i_2; let a_9 : ℤ := a_5 a_8; let a_10 : Memory.addr := Memory.shift a_1 (Cint.to_uint32 (i_2 - (1 : ℤ))); let a_11 : ℤ := a_5 a_10; A_DifferenceAxiomatic.l_difference a_7 a_1 i_2 = i → (0 : ℤ) < i_1 → (0 : ℤ) < i_2 → i_2 ≤ i_1 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_2 ≤ (4294967294 : ℤ) → a_9 ≤ (2147483647 : ℤ) + a_11 → a_11 ≤ (2147483648 : ℤ) + a_9 → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Axiomatic1.p_adjacentdifferencebounds t_2 a_1 i_1 → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_3 i_1 → Memory.valid_rd t a_8 (1 : ℤ) → Memory.valid_rw t a_2 (1 : ℤ) → Memory.valid_rw t a_2 i_1 → Memory.valid_rw t a_6 (1 : ℤ) → ¬Memory.invalid t a_6 (1 : ℤ) → Memory.separated a_3 i_1 a_2 i_1 → Memory.valid_rd t a_10 (1 : ℤ) → Cint.is_sint32 a_9 → Cint.is_sint32 a_11 → Axiomatic.p_unchanged_1' a_5 t_2 a_1 (0 : ℤ) i_1 → Axiomatic1.p_adjacentdifference a_5 a_1 i_2 a → Axiomatic.p_unchanged_1' a_7 a_5 a (0 : ℤ) i_2 → Memory.included a_6 (1 : ℤ) a_4 x
  := sorry
end adjacent_difference_Why3_ide_VCadjacent_difference_loop_assign_part3_goal14
