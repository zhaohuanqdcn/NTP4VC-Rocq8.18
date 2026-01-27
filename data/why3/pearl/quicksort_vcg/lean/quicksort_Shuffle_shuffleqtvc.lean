import Why3.Base
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.random.State
import Why3.random.Random
open Classical
open Lean4Why3
namespace quicksort_Shuffle_shuffleqtvc
theorem shuffle'vc (a : List ℤ) : let o1 : ℤ := Int.ofNat (List.length a) - (1 : ℤ); ((1 : ℤ) ≤ o1 + (1 : ℤ) → List.Perm a a ∧ (∀(a1 : List ℤ), List.length a1 = List.length a → (∀(i : ℤ), ((1 : ℤ) ≤ i ∧ i ≤ o1) ∧ List.Perm a a1 → (let o2 : ℤ := i + (1 : ℤ); (0 : ℤ) < o2 ∧ (∀(o3 : ℤ), (0 : ℤ) ≤ o3 ∧ o3 < o2 → (((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a1)) ∧ (0 : ℤ) ≤ o3 ∧ o3 < Int.ofNat (List.length a1)) ∧ (∀(a2 : List ℤ), List.length a2 = List.length a1 → Lean4Why3.arrayExchange a1 a2 i o3 → List.Perm a a2)))))) ∧ (o1 + (1 : ℤ) < (1 : ℤ) → List.Perm a a)
  := sorry
end quicksort_Shuffle_shuffleqtvc
