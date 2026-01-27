import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace coincidence_count_CoincidenceCountBag_bagofincreasingqtvc
noncomputable def increasing (a : List ℤ) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < Int.ofNat (List.length a) → a[Int.toNat i]! ≤ a[Int.toNat j]!
axiom bagofsub :  {α : Type} -> [Inhabited α] -> List α -> ℤ -> ℤ -> Multiset α
axiom bagofsub'def {α : Type} [Inhabited α] (lo : ℤ) (hi : ℤ) (a : List α) (fact0 : (0 : ℤ) ≤ lo) (fact1 : lo ≤ hi) (fact2 : hi ≤ Int.ofNat (List.length a)) : if hi ≤ lo then bagofsub a lo hi = (∅ : Multiset α) else bagofsub a lo hi = Multiset.cons (a[Int.toNat lo]!) (bagofsub a (lo + (1 : ℤ)) hi)
noncomputable def bagof {α : Type} [Inhabited α] (a : List α) := bagofsub a (0 : ℤ) (Int.ofNat (List.length a))
noncomputable def drop {α : Type} [Inhabited α] (a : List α) (i : ℤ) := bagofsub a i (Int.ofNat (List.length a))
theorem bagofincreasing'vc (a : List ℤ) (i : ℤ) (x : ℤ) (fact0 : increasing a) (fact1 : (0 : ℤ) ≤ i) (fact2 : i < Int.ofNat (List.length a)) (fact3 : x < a[Int.toNat i]!) : ¬x ∈ drop a i
  := sorry
end coincidence_count_CoincidenceCountBag_bagofincreasingqtvc
