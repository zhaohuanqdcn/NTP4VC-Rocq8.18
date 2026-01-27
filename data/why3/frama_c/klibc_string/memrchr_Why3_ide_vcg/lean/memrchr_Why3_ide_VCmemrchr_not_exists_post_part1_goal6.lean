import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memrchr_Why3_ide_VCmemrchr_not_exists_post_part1_goal6
theorem goal6 (a : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (i_1 - (1 : ℤ)); let x : ℤ := t_1 a_1; ¬i_1 = (0 : ℤ) → x = Cint.to_sint8 i_2 → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → -(128 : ℤ) ≤ i_2 → i_2 ≤ (126 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 i_2 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → Cint.is_sint8 x → (∀(i_3 : ℤ), i_3 < i → i_1 ≤ i_3 → ¬t_1 (Memory.shift a i_3) = i_2) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i → ¬t_1 (Memory.shift a i_3) = i_2) → a_1 = Memory.addr.mk (0 : ℤ) (0 : ℤ)
  := sorry
end memrchr_Why3_ide_VCmemrchr_not_exists_post_part1_goal6
