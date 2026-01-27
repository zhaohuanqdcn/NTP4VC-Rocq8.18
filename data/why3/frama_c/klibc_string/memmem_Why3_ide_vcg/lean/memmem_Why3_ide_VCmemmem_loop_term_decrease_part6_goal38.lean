import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memmem_Why3_ide_VCmemmem_loop_term_decrease_part6_goal38
theorem goal38 (a_8 : Memory.addr) (a_9 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a : Memory.addr) (i_2 : ℤ) (a_6 : Memory.addr) (i_1 : ℤ) (a_7 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (a_5 : Memory.addr) (a_4 : Memory.addr) (a_3 : Memory.addr) (a_2 : Memory.addr) : let x : ℤ := Memory.addr.base a_8; let x_1 : ℤ := Memory.addr.base a_9; let x_2 : ℤ := t_1 (Memory.shift a_1 (0 : ℤ)); let x_3 : ℤ := t_1 (Memory.shift a i_2); let x_4 : ℤ := t_1 (Memory.shift a_1 (1 : ℤ)); let x_5 : ℤ := t_1 (Memory.shift a (Cint.to_uint32 ((1 : ℤ) + i_2))); let a_10 : Memory.addr := Memory.shift a_8 (0 : ℤ); let a_11 : Memory.addr := Memory.shift a_9 (0 : ℤ); let a_12 : Memory.addr := Memory.shift a_6 (0 : ℤ); let x_6 : ℤ := Cint.to_uint32 (i_1 - (2 : ℤ)); let a_13 : Memory.addr := Memory.shift a_7 (0 : ℤ); ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬i_1 = (1 : ℤ) → x = Memory.addr.base a_1 → x_1 = Memory.addr.base a → ¬x_2 = x_3 → ¬x_4 = x_2 → x_5 = x_4 → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → Memory.region x ≤ (0 : ℤ) → Memory.region x_1 ≤ (0 : ℤ) → i_2 ≤ Cint.to_uint32 (i - i_1) → i_1 + i_2 ≤ (2 : ℤ) + i → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint8 x_3 → Cint.is_uint8 x_2 → Cint.is_uint8 x_4 → Memory.valid_rw t a_10 i_1 → Memory.valid_rw t a_11 i → Memory.separated a_11 i a_10 i_1 → Memory.valid_rw t a_12 x_6 → Memory.valid_rw t a_13 x_6 → Memory.separated a_13 x_6 a_12 x_6 → Cint.is_uint8 x_5 → ((0 : ℤ) < x_6 → ¬(∃(i_3 : ℤ), ¬t_1 (Memory.shift a_5 i_3) = t_1 (Memory.shift a_4 i_3) ∧ (0 : ℤ) ≤ i_3 ∧ i_3 < x_6)) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i_2 → (∃(i_4 : ℤ), (0 : ℤ) ≤ i_4 → (3 : ℤ) + i_4 ≤ i_1 → ¬t_1 (Memory.shift a_3 ((2 : ℤ) + i_4 + i_3)) = t_1 (Memory.shift a_2 ((2 : ℤ) + i_4)))) → i_2 < Cint.to_uint32 ((2 : ℤ) + i_2)
  := sorry
end memmem_Why3_ide_VCmemmem_loop_term_decrease_part6_goal38
