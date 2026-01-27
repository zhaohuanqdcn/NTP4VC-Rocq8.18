import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace ftell_Why3_ide_VCftell_post_part1_goal0
theorem goal0 (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_6 : Memory.addr) (a_4 : Memory.addr) (a_5 : Memory.addr) (a : Memory.addr) (i : ℤ) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) : let a_7 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x : ℤ := t_1 (Memory.shift (Memory.shift a_6 (0 : ℤ)) (0 : ℤ)); let x_1 : ℤ := t_1 (Memory.shift a_6 (8 : ℤ)); let x_2 : ℤ := Cint.to_sint32 x_1; let x_3 : ℤ := t_1 (Memory.shift a_6 (7 : ℤ)); let x_4 : ℤ := Cint.to_sint32 x_3; let x_5 : ℤ := t_1 (Memory.shift a_4 (7 : ℤ)); let x_6 : ℤ := t_1 (Memory.shift a_5 (8 : ℤ)); a_7 = Memory.shift a (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → (0 : ℤ) ≤ x → x_2 ≤ i + x_4 → Memory.framed t_2 → Memory.linked t → Cint.is_sint64 i → Cint.is_uint32 x_5 → Cint.is_uint32 x_3 → Cint.is_uint32 x_6 → Cint.is_uint32 x_1 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_1 → Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a_3 → Axiomatic3.p_valid_file t t_1 a_7 → Cint.is_sint32 x → Cint.is_sint64 (i + x_4 - x_2) → i = -(1 : ℤ) ∨ i ≤ (0 : ℤ) ∨ Cint.to_sint32 x_6 ≤ i + Cint.to_sint32 x_5
  := sorry
end ftell_Why3_ide_VCftell_post_part1_goal0
