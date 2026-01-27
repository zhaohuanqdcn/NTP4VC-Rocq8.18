import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace vstte10_max_sum_MaxAndSum_max_sumqtvc
theorem max_sum'vc (a : List ℤ) (fact0 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → (0 : ℤ) ≤ a[Int.toNat i]!) : let o1 : ℤ := Int.ofNat (List.length a) - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → (0 : ℤ) ≤ (0 : ℤ) * (0 : ℤ) ∧ (∀(max : ℤ) (sum : ℤ), (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ sum ≤ i * max → ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ (if max < a[Int.toNat i]! then ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ sum + a[Int.toNat i]! ≤ (i + (1 : ℤ)) * a[Int.toNat i]! else ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ sum + a[Int.toNat i]! ≤ (i + (1 : ℤ)) * max)) ∧ (sum ≤ (o1 + (1 : ℤ)) * max → sum ≤ Int.ofNat (List.length a) * max))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → (0 : ℤ) ≤ Int.ofNat (List.length a) * (0 : ℤ))
  := sorry
end vstte10_max_sum_MaxAndSum_max_sumqtvc
