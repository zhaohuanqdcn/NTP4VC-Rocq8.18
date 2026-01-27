import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.reverse.lib.lean.Compound.Compound
import frama_c.standard_algorithms.reverse.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace reverse_Why3_ide_VCreverse_loop_inv_left_preserved_goal3
theorem goal3 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_1 i_1; let x_1 : ℤ := i_1 - (1 : ℤ) - i_2; let a_3 : Memory.addr := Memory.shift a x_1; let a_4 : Memory.addr := Memory.shift a i_2; let a_5 : ℤ := a_2 a_3; let a_6 : Memory.addr -> ℤ := Function.update (Function.update a_2 a_3 i) a_4 a_5; let a_7 : ℤ := a_6 a_3; let a_8 : ℤ := a_2 a_4; let x_2 : ℤ := Int.tdiv i_1 (2 : ℤ); let x_3 : ℤ := Cint.to_uint32 (i_1 - (1 : ℤ)); let x_4 : ℤ := (1 : ℤ) + i_2; let x_5 : ℤ := i_1 - i_2; a_7 = a_8 → (0 : ℤ) < i_1 → (0 : ℤ) ≤ i_2 → i_2 < x_2 → i_2 ≤ x_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_2 + x_2 ≤ i_1 → i_2 ≤ x_3 → i_2 ≤ (4294967294 : ℤ) → x_3 ≤ (4294967295 : ℤ) + i_2 → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 x_2 → Cint.is_uint32 x_4 → Memory.valid_rw t a_1 i_1 → Memory.valid_rw t a_4 (1 : ℤ) → Cint.is_sint32 a_8 → Cint.is_sint32 a_5 → Memory.valid_rw t a_3 (1 : ℤ) → Cint.is_sint32 a_7 → Axiomatic.p_unchanged_1' a_2 t_2 a i_2 x_5 → Axiomatic.p_reverse_4' a_2 t_2 a (0 : ℤ) i_2 x_5 → Axiomatic.p_reverse_4' a_2 t_2 a x_5 i_1 (0 : ℤ) → Axiomatic.p_reverse_4' a_6 t_2 a (0 : ℤ) x_4 x_1
  := sorry
end reverse_Why3_ide_VCreverse_loop_inv_left_preserved_goal3
