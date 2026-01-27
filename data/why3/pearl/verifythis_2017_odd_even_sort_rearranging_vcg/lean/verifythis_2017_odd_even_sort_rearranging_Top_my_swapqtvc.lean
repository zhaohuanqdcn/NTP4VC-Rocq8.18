import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.array.IntArraySorted
open Classical
open Lean4Why3
namespace verifythis_2017_odd_even_sort_rearranging_Top_my_swapqtvc
axiom array_max : List ℤ -> ℤ
axiom array_max'spec (j : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ j) (fact1 : j < Int.ofNat (List.length a)) : a[Int.toNat j]! ≤ array_max a
noncomputable def aux (a : ℤ -> ℤ) (m : ℤ) (i : ℤ) := i * (m - a i)
axiom aux_closure : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom aux_closure_def (y : ℤ -> ℤ) (y1 : ℤ) (y2 : ℤ) : aux_closure y y1 y2 = aux y y1 y2
noncomputable def entropy (a : List ℤ) (m : ℤ) := int.Sum.sum (aux_closure (getElem! a ∘ Int.toNat) m) (0 : ℤ) (Int.ofNat (List.length a))
theorem my_swap'vc (a : List ℤ) (j : ℤ) (i : ℤ) (m : ℤ) (fact0 : a[Int.toNat j]! < a[Int.toNat i]!) (fact1 : (0 : ℤ) ≤ i) (fact2 : i < j) (fact3 : j < Int.ofNat (List.length a)) : (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) ∧ (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a) ∧ (∀(a1 : List ℤ), List.length a1 = List.length a → Lean4Why3.arrayExchange a a1 i j → Lean4Why3.arrayExchange a a1 i j ∧ entropy a1 m < entropy a m)
  := sorry
end verifythis_2017_odd_even_sort_rearranging_Top_my_swapqtvc
