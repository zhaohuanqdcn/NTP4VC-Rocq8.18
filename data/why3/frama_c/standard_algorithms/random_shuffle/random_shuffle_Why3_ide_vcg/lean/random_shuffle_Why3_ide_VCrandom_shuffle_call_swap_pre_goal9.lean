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
namespace random_shuffle_Why3_ide_VCrandom_shuffle_call_swap_pre_goal9
theorem goal9 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_1 i_1; (0 : ℤ) < i_1 → (0 : ℤ) < i_2 → (0 : ℤ) ≤ i → i < i_2 → i_2 ≤ i_1 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Memory.valid_rw t a_1 i_1 → Axiomatic.p_unchanged_1' a_2 t_2 a i_2 i_1 → Axiomatic1.p_multisetunchanged_1' a_2 t_2 a (0 : ℤ) i_2 → Memory.valid_rw t (Memory.shift a (Cint.to_uint32 ((1 : ℤ) + i))) (1 : ℤ)
  := sorry
end random_shuffle_Why3_ide_VCrandom_shuffle_call_swap_pre_goal9
