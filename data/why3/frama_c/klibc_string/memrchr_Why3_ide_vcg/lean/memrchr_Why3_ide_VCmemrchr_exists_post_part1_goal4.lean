import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memrchr_Why3_ide_VCmemrchr_exists_post_part1_goal4
theorem goal4 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (i_2 : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a (i - (1 : ℤ))); let x_1 : ℤ := t_1 (Memory.shift a i_2); ¬i = (0 : ℤ) → x = Cint.to_sint8 x_1 → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → -(128 : ℤ) ≤ x_1 → x_1 ≤ (126 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 x_1 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i_1 → Cint.is_sint8 x → (∀(i_3 : ℤ), i ≤ i_3 → i_3 < i_1 → ¬x_1 = t_1 (Memory.shift a i_3)) → (∃(i_3 : ℤ), let x_2 : ℤ := t_1 (Memory.shift a i_3); (0 : ℤ) ≤ i_3 → i_3 < i_1 → (1 : ℤ) + i_3 = i ∧ x_1 = x_2 ∧ (∀(i_4 : ℤ), i_4 < i_1 → i_3 < i_4 → ¬x_1 = x_2))
  := sorry
end memrchr_Why3_ide_VCmemrchr_exists_post_part1_goal4
