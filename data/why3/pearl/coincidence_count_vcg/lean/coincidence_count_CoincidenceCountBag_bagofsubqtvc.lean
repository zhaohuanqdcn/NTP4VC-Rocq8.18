import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace coincidence_count_CoincidenceCountBag_bagofsubqtvc
noncomputable def increasing (a : List ℤ) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < Int.ofNat (List.length a) → a[Int.toNat i]! ≤ a[Int.toNat j]!
theorem bagofsub'vc {α : Type} [Inhabited α] (lo : ℤ) (hi : ℤ) (a : List α) (fact0 : (0 : ℤ) ≤ lo) (fact1 : lo ≤ hi) (fact2 : hi ≤ Int.ofNat (List.length a)) (fact3 : ¬hi ≤ lo) : let o1 : ℤ := lo + (1 : ℤ); (((0 : ℤ) ≤ hi - lo ∧ hi - o1 < hi - lo) ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ hi ∧ hi ≤ Int.ofNat (List.length a)) ∧ (0 : ℤ) ≤ lo ∧ lo < Int.ofNat (List.length a)
  := sorry
end coincidence_count_CoincidenceCountBag_bagofsubqtvc
