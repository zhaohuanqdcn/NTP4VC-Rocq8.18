import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
open Classical
open Lean4Why3
namespace assigning_meanings_to_programs_Sum_sumqtvc
theorem sum'vc (n : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : n < Int.ofNat (List.length a)) : (1 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ n + (1 : ℤ) ∧ (0 : ℤ) = List.sum (List.drop (1 : ℕ) (List.take ((1 : ℕ) - (1 : ℕ)) a)) ∧ (∀(i : ℤ), (1 : ℤ) ≤ i ∧ i ≤ n + (1 : ℤ) → (if i ≤ n then ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ ((0 : ℤ) ≤ n - i ∧ n - (i + (1 : ℤ)) < n - i) ∧ ((1 : ℤ) ≤ i + (1 : ℤ) ∧ i + (1 : ℤ) ≤ n + (1 : ℤ)) ∧ List.sum (List.drop (1 : ℕ) (List.take (Int.toNat i - (1 : ℕ)) a)) + a[Int.toNat i]! = List.sum (List.drop (1 : ℕ) (List.take (Int.toNat (i + (1 : ℤ)) - (1 : ℕ)) a)) else List.sum (List.drop (1 : ℕ) (List.take (Int.toNat i - (1 : ℕ)) a)) = List.sum (List.drop (1 : ℕ) (List.take (Int.toNat (n + (1 : ℤ)) - (1 : ℕ)) a))))
  := sorry
end assigning_meanings_to_programs_Sum_sumqtvc
