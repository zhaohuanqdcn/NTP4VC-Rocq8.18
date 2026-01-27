import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.array.IntArraySorted
open Classical
open Lean4Why3
namespace verifythis_2017_odd_even_sort_rearranging_Top_entropy_posqtvc
axiom array_max : List ℤ -> ℤ
axiom array_max'spec (j : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ j) (fact1 : j < Int.ofNat (List.length a)) : a[Int.toNat j]! ≤ array_max a
noncomputable def aux (a : ℤ -> ℤ) (m : ℤ) (i : ℤ) := i * (m - a i)
axiom aux_closure : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom aux_closure_def (y : ℤ -> ℤ) (y1 : ℤ) (y2 : ℤ) : aux_closure y y1 y2 = aux y y1 y2
noncomputable def entropy (a : List ℤ) (m : ℤ) := int.Sum.sum (aux_closure (getElem! a ∘ Int.toNat) m) (0 : ℤ) (Int.ofNat (List.length a))
theorem entropy_pos'vc (i : ℤ) (a : List ℤ) (m : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ Int.ofNat (List.length a)) (fact2 : ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i ∧ i ≤ Int.ofNat (List.length a) → a[Int.toNat j]! ≤ m) : (0 : ℤ) ≤ int.Sum.sum (aux_closure (getElem! a ∘ Int.toNat) m) (0 : ℤ) i
  := sorry
end verifythis_2017_odd_even_sort_rearranging_Top_entropy_posqtvc
