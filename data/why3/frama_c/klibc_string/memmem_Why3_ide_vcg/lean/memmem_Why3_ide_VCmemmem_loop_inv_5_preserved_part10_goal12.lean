import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memmem_Why3_ide_VCmemmem_loop_inv_5_preserved_part10_goal12
theorem goal12 (a_8 : Memory.addr) (a_9 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a : Memory.addr) (i_3 : ℤ) (i_2 : ℤ) (i : ℤ) (a_6 : Memory.addr) (a_7 : Memory.addr) (i_1 : ℤ) (a_5 : Memory.addr) (i_4 : ℤ) (a_4 : Memory.addr) (t : ℤ -> ℤ) (a_3 : Memory.addr) (a_2 : Memory.addr) : let x : ℤ := Memory.addr.base a_8; let x_1 : ℤ := Memory.addr.base a_9; let x_2 : ℤ := t_1 (Memory.shift a_1 (1 : ℤ)); let x_3 : ℤ := t_1 (Memory.shift a_1 (0 : ℤ)); let x_4 : ℤ := t_1 (Memory.shift a (Cint.to_uint32 ((1 : ℤ) + i_3))); let x_5 : ℤ := Cint.to_uint32 (i_2 - (2 : ℤ)); let x_6 : ℤ := (2 : ℤ) + i; let a_10 : Memory.addr := Memory.shift a_8 (0 : ℤ); let a_11 : Memory.addr := Memory.shift a_9 (0 : ℤ); let a_12 : Memory.addr := Memory.shift a_6 (0 : ℤ); let a_13 : Memory.addr := Memory.shift a_7 (0 : ℤ); ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬i_2 = (0 : ℤ) → ¬i_2 = (1 : ℤ) → x = Memory.addr.base a_1 → x_1 = Memory.addr.base a → ¬x_2 = x_3 → ¬t_1 (Memory.shift a_5 i_4) = t_1 (Memory.shift a_4 i_4) → x_4 = x_2 → (0 : ℤ) ≤ i → i_2 ≤ i → (0 : ℤ) ≤ i_2 → (0 : ℤ) ≤ i_3 → (0 : ℤ) ≤ i_4 → Memory.region x ≤ (0 : ℤ) → Memory.region x_1 ≤ (0 : ℤ) → i_4 < x_5 → i_3 ≤ Cint.to_uint32 (i - i_2) → i_2 + i_3 ≤ x_6 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_sint32 i_1 → Cint.is_uint8 x_3 → Cint.is_uint8 x_2 → Memory.valid_rw t a_10 i_2 → Memory.valid_rw t a_11 i → Memory.separated a_11 i a_10 i_2 → Memory.valid_rw t a_12 x_5 → Memory.valid_rw t a_13 x_5 → Memory.separated a_13 x_5 a_12 x_5 → Cint.is_uint8 x_4 → (∀(i_5 : ℤ), (0 : ℤ) ≤ i_5 → i_5 < i_3 → (∃(i_6 : ℤ), (0 : ℤ) ≤ i_6 → (3 : ℤ) + i_6 ≤ i_2 → ¬t_1 (Memory.shift a_3 ((2 : ℤ) + i_6 + i_5)) = t_1 (Memory.shift a_2 ((2 : ℤ) + i_6)))) → i_2 + Cint.to_uint32 ((2 : ℤ) + i_3) ≤ x_6
  := sorry
end memmem_Why3_ide_VCmemmem_loop_inv_5_preserved_part10_goal12
