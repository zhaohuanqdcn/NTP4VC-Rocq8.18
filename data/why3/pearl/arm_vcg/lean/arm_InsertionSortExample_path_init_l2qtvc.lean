import Why3.Base
import Why3.why3.Ref.Ref
import pearl.arm_vcg.lean.arm.ARM
open Classical
open Lean4Why3
namespace arm_InsertionSortExample_path_init_l2qtvc
axiom a : ℤ
noncomputable def separation (fp : ℤ) := a + (10 : ℤ) < fp - (24 : ℤ)
noncomputable def inv (mem : ℤ -> ℤ) := mem a = (0 : ℤ) ∧ (∀(k : ℤ), (1 : ℤ) ≤ k ∧ k ≤ (10 : ℤ) → (0 : ℤ) < mem (a + k))
noncomputable def inv_l2 (mem : ℤ -> ℤ) (fp : ℤ) (l4 : ℤ) := ((2 : ℤ) ≤ mem (fp - (16 : ℤ)) ∧ mem (fp - (16 : ℤ)) ≤ (11 : ℤ)) ∧ l4 = mem (fp - (16 : ℤ)) - (2 : ℤ) ∧ inv mem
theorem path_init_l2'vc (fp : ℤ) (mem : ℤ -> ℤ) (fact0 : separation fp) (fact1 : inv mem) : inv_l2 (Function.update mem (fp - (16 : ℤ)) (2 : ℤ)) fp (0 : ℤ)
  := sorry
end arm_InsertionSortExample_path_init_l2qtvc
