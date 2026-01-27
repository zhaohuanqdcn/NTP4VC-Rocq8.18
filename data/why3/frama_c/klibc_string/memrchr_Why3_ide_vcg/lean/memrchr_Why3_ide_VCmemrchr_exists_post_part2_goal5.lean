import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memrchr_Why3_ide_VCmemrchr_exists_post_part2_goal5
theorem goal5 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a i_1); (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → -(128 : ℤ) ≤ x → x ≤ (126 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_sint8 (t_1 (Memory.shift a (-(1 : ℤ)))) → Cint.is_sint32 x → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i → ¬x = t_1 (Memory.shift a i_2)) → (∃(i_2 : ℤ), let x_1 : ℤ := t_1 (Memory.shift a i_2); (0 : ℤ) ≤ i_2 → i_2 < i → Memory.shift a i_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) ∧ x = x_1 ∧ (∀(i_3 : ℤ), i_3 < i → i_2 < i_3 → ¬x = x_1))
  := sorry
end memrchr_Why3_ide_VCmemrchr_exists_post_part2_goal5
