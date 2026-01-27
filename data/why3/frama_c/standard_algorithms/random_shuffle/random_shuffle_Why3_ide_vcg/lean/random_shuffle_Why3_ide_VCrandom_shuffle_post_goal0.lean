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
namespace random_shuffle_Why3_ide_VCrandom_shuffle_post_goal0
theorem goal0 (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (p : Bool) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_1 i → (if (0 : ℤ) < i then p = false ∧ Memory.havoc t_1 t_3 a_1 i = t_2 ∧ (0 : ℤ) < i_1 ∧ i_1 ≤ i ∧ i ≤ i_1 ∧ Axiomatic.p_unchanged_1' t_2 t_3 a i_1 i ∧ Axiomatic1.p_multisetunchanged_1' t_2 t_3 a (0 : ℤ) i_1 else t_3 = t_2) → Axiomatic1.p_multisetunchanged_1' t_2 t_3 a (0 : ℤ) i
  := sorry
end random_shuffle_Why3_ide_VCrandom_shuffle_post_goal0
