import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memchr_Why3_ide_VCmemchr_loop_inv_5_preserved_goal6
theorem goal6 (a : Memory.addr) (i_1 : ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (i_3 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (i_1 - i); let x : ℤ := t_1 a_1; let x_1 : ℤ := Cint.to_sint8 i_3; ¬i = (0 : ℤ) → ¬x = x_1 → (0 : ℤ) < i_1 → (0 : ℤ) ≤ i → i ≤ i_1 → (0 : ℤ) ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_2 + Cint.to_uint32 (i - (1 : ℤ)) < i_1 → -(128 : ℤ) ≤ i_3 → i_3 ≤ (127 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 i_3 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i_1 → Memory.addr_le a a_1 → Memory.addr_le a_1 (Memory.shift a i_1) → Cint.is_sint8 x → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 + i < i_1 → ¬t_1 (Memory.shift a i_4) = x_1) → ¬t_1 (Memory.shift a i_2) = x_1
  := sorry
end memchr_Why3_ide_VCmemchr_loop_inv_5_preserved_goal6
