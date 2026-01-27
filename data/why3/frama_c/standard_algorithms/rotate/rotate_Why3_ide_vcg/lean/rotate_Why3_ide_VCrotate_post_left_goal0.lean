import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.rotate.lib.lean.Compound.Compound
import frama_c.standard_algorithms.rotate.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace rotate_Why3_ide_VCrotate_post_left_goal0
theorem goal0 (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_3 : Memory.addr -> ℤ) (t_5 : Memory.addr -> ℤ) (t_7 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (t_6 : Memory.addr -> ℤ) (t_4 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) : let x : ℤ := i_1 - i; let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr := Memory.shift a x; (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i ≤ (4294967295 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 x → Memory.valid_rw t a_1 i_1 → (if i < i_1 then if (0 : ℤ) < i then Memory.havoc t_3 t_5 a_1 i_1 = t_7 ∧ Memory.havoc t_1 t_6 a_1 x = t_4 ∧ Memory.havoc t_2 t_4 a_2 i = t_5 ∧ Memory.valid_rw t a_1 x ∧ Axiomatic.p_reverse_5' t_4 t_6 a (0 : ℤ) x ∧ Memory.valid_rw t a_2 i ∧ Axiomatic.p_reverse_4' t_5 t_6 a (0 : ℤ) x (0 : ℤ) ∧ Axiomatic.p_reverse_4' t_5 t_6 a x i_1 x ∧ Axiomatic.p_reverse_4' t_7 t_5 a (0 : ℤ) x i ∧ Axiomatic.p_reverse_4' t_7 t_5 a x i_1 (0 : ℤ) ∧ Axiomatic.p_reverse_5' t_5 t_4 a_2 (0 : ℤ) i else t_7 = t_6 else t_7 = t_6) → Axiomatic.p_equalranges_4' t_7 t_6 a (0 : ℤ) x i
  := sorry
end rotate_Why3_ide_VCrotate_post_left_goal0
