import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.random_shuffle.lib.lean.Compound.Compound
import frama_c.standard_algorithms.random_shuffle.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.random_shuffle.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.random_shuffle.lib.lean.A_Count.A_Count
open Classical
open Lean4Why3
namespace random_shuffle_Why3_ide_VCrandom_shuffle_loop_assign_part3_goal6
theorem goal6 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_2 : ℤ) (i_3 : ℤ) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_1 i_2; let a_3 : Memory.addr := Memory.shift a i_3; let a_4 : Memory.addr := Memory.shift a (Cint.to_uint32 ((1 : ℤ) + i_1)); let a_5 : ℤ := a_2 a_3; let a_6 : ℤ := Function.update (Function.update a_2 a_3 i) a_4 a_5 a_3; let a_7 : ℤ := a_2 a_4; a_6 = a_7 → (0 : ℤ) < i_2 → (0 : ℤ) < i_3 → (0 : ℤ) ≤ i_1 → i_1 < i_3 → i_3 ≤ i_2 → i_3 < i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Memory.valid_rw t a_1 i_2 → Memory.valid_rw t a_3 (1 : ℤ) → Cint.is_sint32 a_5 → Cint.is_sint32 a_7 → Memory.valid_rw t a_4 (1 : ℤ) → Cint.is_sint32 a_6 → Axiomatic.p_unchanged_1' a_2 t_2 a i_3 i_2 → Axiomatic1.p_multisetunchanged_1' a_2 t_2 a (0 : ℤ) i_3 → (¬Memory.invalid t a_3 (1 : ℤ) → Memory.included a_3 (1 : ℤ) a_1 i_2) ∧ (¬Memory.invalid t a_4 (1 : ℤ) → Memory.included a_4 (1 : ℤ) a_1 i_2)
  := sorry
end random_shuffle_Why3_ide_VCrandom_shuffle_loop_assign_part3_goal6
