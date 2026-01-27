import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.array.IntArraySorted
open Classical
open Lean4Why3
namespace quicksort_Traditional_quicksortqtvc
theorem quicksort'vc (a : List ℤ) : let o1 : ℤ := Int.ofNat (List.length a); ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ Int.ofNat (List.length a)) ∧ (∀(a1 : List ℤ), List.length a1 = List.length a → IntArraySorted.sorted_sub1 a1 (0 : ℤ) o1 ∧ List.permut_sub' a a1 (0 : ℕ) (Int.toNat o1) → IntArraySorted.sorted a1 ∧ List.Perm a a1)
  := sorry
end quicksort_Traditional_quicksortqtvc
