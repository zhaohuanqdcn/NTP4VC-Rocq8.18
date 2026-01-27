import Why3.Base
open Classical
open Lean4Why3
namespace Spec
noncomputable def appears {α : Type} [Inhabited α] (v : α) (a : List α) (s : ℤ) := ∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < s) ∧ a[Int.toNat i]! = v
noncomputable def nodup {α : Type} [Inhabited α] (a : List α) (s : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < s → ¬appears (a[Int.toNat i]!) a i
end Spec
