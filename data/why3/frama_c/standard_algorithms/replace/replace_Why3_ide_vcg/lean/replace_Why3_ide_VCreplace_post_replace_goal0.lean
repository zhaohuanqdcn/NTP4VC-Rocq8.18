import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.replace.lib.lean.Compound.Compound
import frama_c.standard_algorithms.replace.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace replace_Why3_ide_VCreplace_post_replace_goal0
theorem goal0 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_2 : ℤ) (i_3 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_1 i_2; i_3 ≤ i_2 → (0 : ℤ) ≤ i_3 → i_2 ≤ i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_sint32 i → Cint.is_sint32 i_1 → Memory.valid_rw t a_1 i_2 → Axiomatic.p_unchanged_1' a_2 t_2 a i_3 i_2 → Axiomatic.p_replace_2' a_2 t_2 a i_3 i_1 i → Axiomatic.p_replace_2' (Memory.havoc t_1 t_2 a_1 i_3) t_2 a i_3 i_1 i
  := sorry
end replace_Why3_ide_VCreplace_post_replace_goal0
