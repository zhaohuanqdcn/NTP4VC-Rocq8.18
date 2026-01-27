import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memmem_Why3_ide_VCmemmem_loop_inv_10_preserved_goal28
theorem goal28 (a_7 : Memory.addr) (a_8 : Memory.addr) (i : ℤ) (a_3 : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (a_4 : Memory.addr) (a_5 : Memory.addr) (a_2 : Memory.addr) (a_1 : Memory.addr) (a_6 : Memory.addr) : let x : ℤ := Memory.addr.base a_7; let x_1 : ℤ := Memory.addr.base a_8; let x_2 : ℤ := Cint.to_uint32 (i - (1 : ℤ)); let a_9 : Memory.addr := Memory.shift a_3 (i_1 - i); let x_4 : ℤ := t_1 a_9; let x_5 : ℤ := t_1 a; let a_10 : Memory.addr := Memory.shift a_7 (0 : ℤ); let a_11 : Memory.addr := Memory.shift a_8 (0 : ℤ); x = Memory.addr.base a → x_1 = Memory.addr.base a_3 → ¬x_2 = (0 : ℤ) → ¬x_4 = x_5 → (0 : ℤ) < i → (0 : ℤ) < i_1 → (0 : ℤ) ≤ i_1 → i ≤ i_1 → Memory.region x ≤ (0 : ℤ) → Memory.region x_1 ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint8 x_5 → Memory.valid_rw t a_10 (1 : ℤ) → Memory.valid_rw t a_11 i_1 → Memory.separated a_11 i_1 a_10 (1 : ℤ) → Memory.addr_le a_4 a_9 → Memory.addr_le a_9 (Memory.shift a_5 i_1) → Cint.is_uint8 x_4 → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + i < i_1 → ¬t_1 (Memory.shift a_2 (0 : ℤ)) = t_1 (Memory.shift a_1 i_2)) → Memory.shift a_6 (i_1 - x_2) = Memory.shift a_3 ((1 : ℤ) + i_1 - i)
  := sorry
end memmem_Why3_ide_VCmemmem_loop_inv_10_preserved_goal28
