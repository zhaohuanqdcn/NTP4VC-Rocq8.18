import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace min_max_Top_a_similar_min_maxqtvc
noncomputable def is_min (m : ℤ) (a : List ℤ) (lo : ℤ) (hi : ℤ) := (∃(i : ℤ), (lo ≤ i ∧ i < hi ∧ hi ≤ Int.ofNat (List.length a)) ∧ a[Int.toNat i]! = m) ∧ (∀(i : ℤ), lo ≤ i ∧ i < hi → m ≤ a[Int.toNat i]!)
noncomputable def is_max (m : ℤ) (a : List ℤ) (lo : ℤ) (hi : ℤ) := (∃(i : ℤ), (lo ≤ i ∧ i < hi ∧ hi ≤ Int.ofNat (List.length a)) ∧ a[Int.toNat i]! = m) ∧ (∀(i : ℤ), lo ≤ i ∧ i < hi → a[Int.toNat i]! ≤ m)
theorem a_similar_min_max'vc (a : List ℤ) (fact0 : (1 : ℤ) ≤ Int.ofNat (List.length a)) : let o1 : ℤ := Int.ofNat (List.length a); ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < o1 ∧ o1 ≤ Int.ofNat (List.length a)) ∧ (∀(x : ℤ) (y : ℤ), is_min x a (0 : ℤ) o1 ∧ is_max y a (0 : ℤ) o1 → is_min x a (0 : ℤ) (Int.ofNat (List.length a)) ∧ is_max y a (0 : ℤ) (Int.ofNat (List.length a)))
  := sorry
end min_max_Top_a_similar_min_maxqtvc
