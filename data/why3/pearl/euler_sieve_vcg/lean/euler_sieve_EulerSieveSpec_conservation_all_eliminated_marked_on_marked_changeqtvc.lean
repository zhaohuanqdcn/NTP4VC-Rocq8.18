import Why3.Base
import pearl.euler_sieve_vcg.lean.euler_sieve.ArithmeticResults
import pearl.euler_sieve_vcg.lean.euler_sieve.DivisibilityResults
open Classical
open Lean4Why3
namespace euler_sieve_EulerSieveSpec_conservation_all_eliminated_marked_on_marked_changeqtvc
noncomputable def inv_nexts (nexts : List ℤ) (n : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → i < nexts[Int.toNat i]! ∧ nexts[Int.toNat i]! ≤ n
noncomputable def all_eliminated_marked (marked : List Bool) (nexts : List ℤ) := List.length marked = List.length nexts ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length marked) → (∀(j : ℤ), i < j ∧ j < nexts[Int.toNat i]! → marked[Int.toNat j]! = true))
noncomputable def all_eliminated_marked_partial (marked : List Bool) (nexts : List ℤ) (min : ℤ) := List.length marked = List.length nexts ∧ (∀(i : ℤ), min ≤ i ∧ i < Int.ofNat (List.length marked) → (∀(j : ℤ), i < j ∧ j < nexts[Int.toNat i]! → marked[Int.toNat j]! = true))
noncomputable def not_marked_impl_next_not_marked (marked_old : List Bool) (nexts : List ℤ) (n : ℤ) := List.length marked_old = List.length nexts ∧ (2 : ℤ) ≤ Int.ofNat (List.length marked_old) ∧ (2 : ℤ) ≤ n ∧ (∀(i : ℤ), (2 : ℤ) ≤ i ∧ i ≤ (Int.ofNat (List.length marked_old) - (1 : ℤ)) / n → nexts[Int.toNat i]! ≤ (Int.ofNat (List.length marked_old) - (1 : ℤ)) / n → ¬marked_old[Int.toNat i]! = true → ¬marked_old[Int.toNat (nexts[Int.toNat i]!)]! = true)
noncomputable def is_copy (marked : List Bool) (marked_old : List Bool) := List.length marked = List.length marked_old ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length marked) → ¬marked[Int.toNat i]! = true → ¬marked_old[Int.toNat i]! = true)
noncomputable def not_marked_impl_next_not_marked_partial (marked : List Bool) (nexts : List ℤ) (n : ℤ) (p : ℤ) := List.length marked = List.length nexts ∧ (2 : ℤ) ≤ Int.ofNat (List.length marked) ∧ (2 : ℤ) ≤ n ∧ p ≤ (Int.ofNat (List.length marked) - (1 : ℤ)) / n ∧ (∀(i : ℤ), (2 : ℤ) ≤ i ∧ i < p → nexts[Int.toNat i]! ≤ (Int.ofNat (List.length marked) - (1 : ℤ)) / n → ¬marked[Int.toNat i]! = true → ¬marked[Int.toNat (nexts[Int.toNat i]!)]! = true)
noncomputable def all_primes (marked : List Bool) (n : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → (¬marked[Int.toNat i]! = true) = Nat.Prime (Int.toNat i)
noncomputable def all_multiples_marked (marked : List Bool) (i : ℤ) (max : ℤ) := ((2 : ℤ) ≤ i ∧ i < Int.ofNat (List.length marked)) ∧ (∀(k : ℤ), (2 : ℤ) ≤ k ∧ k < max → i * k < Int.ofNat (List.length marked) → marked[Int.toNat (i * k)]! = true)
noncomputable def previously_marked_multiples (marked : List Bool) (n : ℤ) := ∀(i : ℤ), (2 : ℤ) ≤ i ∧ i < n → all_multiples_marked marked i (Int.ofNat (List.length marked))
noncomputable def only_multiples_marked (marked : List Bool) (n : ℤ) := ∀(k : ℤ), (2 : ℤ) ≤ k ∧ k < Int.ofNat (List.length marked) → marked[Int.toNat k]! = true → (∃(i : ℤ) (j : ℤ), ((2 : ℤ) ≤ i ∧ i < n) ∧ ((2 : ℤ) ≤ j ∧ j < Int.ofNat (List.length marked)) ∧ i * j = k)
noncomputable def prime_multiples_marked (marked_old : List Bool) (marked : List Bool) (n : ℤ) (max : ℤ) := List.length marked_old = List.length marked ∧ (n < max ∧ max ≤ Int.ofNat (List.length marked)) ∧ (∀(i : ℤ), n ≤ i ∧ i < max → ¬marked_old[Int.toNat i]! = true → n * i < Int.ofNat (List.length marked_old) → marked[Int.toNat (n * i)]! = true)
noncomputable def inv_remove_products (nexts : List ℤ) (marked : List Bool) (n : ℤ) := List.length nexts = List.length marked ∧ ¬marked[(2 : ℕ)]! = true ∧ all_primes marked n ∧ Nat.Prime (Int.toNat n) ∧ ¬marked[Int.toNat n]! = true ∧ inv_nexts nexts (Int.ofNat (List.length nexts))
theorem conservation_all_eliminated_marked_on_marked_change'vc (marked : List Bool) (nexts : List ℤ) (i : ℤ) (fact0 : List.length marked = List.length nexts) (fact1 : inv_nexts nexts (Int.ofNat (List.length nexts))) (fact2 : all_eliminated_marked marked nexts) (fact3 : (0 : ℤ) ≤ i) (fact4 : i < Int.ofNat (List.length marked)) : all_eliminated_marked (List.set marked (Int.toNat i) true) nexts
  := sorry
end euler_sieve_EulerSieveSpec_conservation_all_eliminated_marked_on_marked_changeqtvc
