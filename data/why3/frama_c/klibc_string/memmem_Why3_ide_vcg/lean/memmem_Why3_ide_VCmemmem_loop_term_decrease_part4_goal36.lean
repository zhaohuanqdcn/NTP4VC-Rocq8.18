import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memmem_Why3_ide_VCmemmem_loop_term_decrease_part4_goal36
theorem goal36 (a_4 : Memory.addr) (a_5 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i_2 : ℤ) (a : Memory.addr) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (a_3 : Memory.addr) (a_2 : Memory.addr) : let x : ℤ := Memory.addr.base a_4; let x_1 : ℤ := Memory.addr.base a_5; let x_2 : ℤ := t_1 (Memory.shift a_1 (1 : ℤ)); let x_3 : ℤ := t_1 (Memory.shift a_1 (0 : ℤ)); let x_4 : ℤ := Cint.to_uint32 ((1 : ℤ) + i_2); let x_5 : ℤ := t_1 (Memory.shift a x_4); let a_6 : Memory.addr := Memory.shift a_4 (0 : ℤ); let a_7 : Memory.addr := Memory.shift a_5 (0 : ℤ); ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬i_1 = (1 : ℤ) → x = Memory.addr.base a_1 → x_1 = Memory.addr.base a → ¬x_2 = x_3 → ¬x_5 = x_2 → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → Memory.region x ≤ (0 : ℤ) → Memory.region x_1 ≤ (0 : ℤ) → i_2 ≤ Cint.to_uint32 (i - i_1) → i_1 + i_2 ≤ (2 : ℤ) + i → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint8 x_3 → Cint.is_uint8 x_2 → Memory.valid_rw t a_6 i_1 → Memory.valid_rw t a_7 i → Memory.separated a_7 i a_6 i_1 → Cint.is_uint8 x_5 → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i_2 → (∃(i_4 : ℤ), (0 : ℤ) ≤ i_4 → (3 : ℤ) + i_4 ≤ i_1 → ¬t_1 (Memory.shift a_3 ((2 : ℤ) + i_4 + i_3)) = t_1 (Memory.shift a_2 ((2 : ℤ) + i_4)))) → i_2 < x_4
  := sorry
end memmem_Why3_ide_VCmemmem_loop_term_decrease_part4_goal36
