import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace pigeonhole_Pigeonhole_belowqtvc
theorem below'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : (¬n = (0 : ℤ) → (let o1 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ n ∧ o1 < n) ∧ (0 : ℤ) ≤ o1)) ∧ (∀(result : Finset ℤ), (if n = (0 : ℤ) then result = (∅ : Finset ℤ) else let o1 : ℤ := n - (1 : ℤ); ∃(o2 : Finset ℤ), ((∀(i : ℤ), (i ∈ o2) = ((0 : ℤ) ≤ i ∧ i < o1)) ∧ Int.ofNat (Finset.card o2) = o1) ∧ result = insert (n - (1 : ℤ)) o2) → (∀(i : ℤ), (i ∈ result) = ((0 : ℤ) ≤ i ∧ i < n)) ∧ Int.ofNat (Finset.card result) = n)
  := sorry
end pigeonhole_Pigeonhole_belowqtvc
