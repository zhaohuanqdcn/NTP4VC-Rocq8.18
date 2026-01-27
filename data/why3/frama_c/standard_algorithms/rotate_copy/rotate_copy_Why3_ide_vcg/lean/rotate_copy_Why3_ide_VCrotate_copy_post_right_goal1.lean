import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.rotate_copy.lib.lean.Compound.Compound
import frama_c.standard_algorithms.rotate_copy.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace rotate_copy_Why3_ide_VCrotate_copy_post_right_goal1
theorem goal1 (a_1 : Memory.addr) (a : Memory.addr) (i_1 : ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let a_4 : Memory.addr := Memory.shift a_1 i_1; let x : ℤ := i - i_1; let a_5 : Memory.addr := Memory.shift a x; let a_6 : Memory.addr -> ℤ := Memory.havoc t_1 t_3 a_5 i_1; let a_7 : Memory.addr -> ℤ := Memory.havoc t_2 a_6 a_3 x; i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i ≤ (4294967295 : ℤ) + i_1 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rd t a_2 i → Memory.valid_rd t a_2 i_1 → Memory.valid_rw t a_3 i → Memory.valid_rd t a_4 x → Memory.valid_rw t a_3 x → Memory.separated a_2 i a_3 i → Memory.separated a_4 x a (1 : ℤ) → Memory.valid_rw t a_5 i_1 → Memory.separated a_2 i_1 a_5 (1 : ℤ) → Axiomatic.p_equalranges_1' a_6 t_3 a_1 i_1 a_5 → Axiomatic.p_equalranges_1' a_7 a_6 a_4 x a → Axiomatic.p_equalranges_3' a_7 t_3 a_1 i_1 x a (0 : ℤ)
  := sorry
end rotate_copy_Why3_ide_VCrotate_copy_post_right_goal1
