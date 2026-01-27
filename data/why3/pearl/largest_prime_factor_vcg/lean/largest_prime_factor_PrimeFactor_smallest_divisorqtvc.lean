import Why3.Base
open Classical
open Lean4Why3
namespace largest_prime_factor_PrimeFactor_smallest_divisorqtvc
theorem smallest_divisor'vc (n : ℤ) (d : ℤ) (fact0 : (2 : ℤ) ≤ n) (fact1 : (2 : ℤ) ≤ d) (fact2 : d ≤ n) (fact3 : ∀(i : ℤ), (2 : ℤ) ≤ i ∧ i < d → ¬i ∣  n) : let o1 : ℤ := d * d; (¬n < o1 → ((2 : ℤ) ≤ d → ¬d = (0 : ℤ)) ∧ (∀(o2 : Bool), (if (2 : ℤ) ≤ d then o2 = (if Int.tmod n d = (0 : ℤ) then true else false) else o2 = false) → ¬o2 = true → (let o3 : ℤ := d + (1 : ℤ); ((0 : ℤ) ≤ n - d ∧ n - o3 < n - d) ∧ (2 : ℤ) ≤ n ∧ ((2 : ℤ) ≤ o3 ∧ o3 ≤ n) ∧ (∀(i : ℤ), (2 : ℤ) ≤ i ∧ i < o3 → ¬i ∣  n)))) ∧ (∀(result : ℤ), (if n < o1 then result = n else ∃(o2 : Bool), (if (2 : ℤ) ≤ d then o2 = (if Int.tmod n d = (0 : ℤ) then true else false) else o2 = false) ∧ (if o2 = true then result = d else (d + (1 : ℤ) ≤ result ∧ result ≤ n) ∧ result ∣  n ∧ (∀(i : ℤ), (2 : ℤ) ≤ i ∧ i < result → ¬i ∣  n))) → (d ≤ result ∧ result ≤ n) ∧ result ∣  n ∧ (∀(i : ℤ), (2 : ℤ) ≤ i ∧ i < result → ¬i ∣  n))
  := sorry
end largest_prime_factor_PrimeFactor_smallest_divisorqtvc
