import Why3.Base
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace verifythis_2021_lexicographic_permutations_2_BoxedIntArrays_maxiqtvc
noncomputable def boxed (u : ℤ) (a : List ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → (2 : ℤ) * abs (a[Int.toNat i]!) < u
axiom greater : List ℤ -> ℤ
axiom greater'spec'0 (a : List ℤ) : (0 : ℤ) ≤ greater a
axiom greater'spec (i : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < Int.ofNat (List.length a)) : (2 : ℤ) * abs (a[Int.toNat i]!) < greater a
theorem maxi'vc : True
  := sorry
end verifythis_2021_lexicographic_permutations_2_BoxedIntArrays_maxiqtvc
