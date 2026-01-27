import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.find.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace find_Why3_ide_VCfind_some_post_2_goal7
theorem goal7 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a i_1); let x_1 : ℤ := t_1 (Memory.shift a i_2); i_2 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → (0 : ℤ) ≤ i_2 → i ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_2 → Cint.is_sint32 x → Cint.is_sint32 x_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i_2 → ¬x = t_1 (Memory.shift a i_3)) → x_1 = x
  := sorry
end find_Why3_ide_VCfind_some_post_2_goal7
