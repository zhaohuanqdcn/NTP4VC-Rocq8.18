import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.find.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace find_Why3_ide_VCfind_some_post_3_goal8
theorem goal8 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_1 : ℤ) (i_3 : ℤ) (i : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a i_1); let a_1 : Memory.addr := Memory.shift a i_3; let x_1 : ℤ := t_1 a_1; i_3 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → (0 : ℤ) ≤ i_2 → i_2 < i_3 → (0 : ℤ) ≤ i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_3 → Cint.is_sint32 x → Cint.is_sint32 x_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → i ≤ i_3 ∨ x_1 = x ∧ Memory.valid_rd t a_1 (1 : ℤ) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 < i_3 → ¬x = t_1 (Memory.shift a i_4)) → ¬t_1 (Memory.shift a i_2) = x
  := sorry
end find_Why3_ide_VCfind_some_post_3_goal8
