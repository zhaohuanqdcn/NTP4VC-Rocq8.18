import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace binary_sort_BinarySort_occ_shiftqtvc
theorem occ_shift'vc {α : Type} [Inhabited α] (mid : ℤ) (k : ℤ) (m2 : ℤ -> α) (m1 : ℤ -> α) (x : α) (fact0 : (0 : ℤ) ≤ mid) (fact1 : mid ≤ k) (fact2 : ∀(i : ℤ), mid < i ∧ i ≤ k → m2 i = m1 (i - (1 : ℤ))) (fact3 : m2 mid = m1 k) : Lean4Why3.map_occ x m1 mid (k + (1 : ℤ)) = Lean4Why3.map_occ x m2 mid (k + (1 : ℤ))
  := sorry
end binary_sort_BinarySort_occ_shiftqtvc
