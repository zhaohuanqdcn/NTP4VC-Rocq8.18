import Why3.Base
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace verifythis_2021_lexicographic_permutations_2_BoxedIntArrays_boxed_permutqtvc
noncomputable def boxed (u : ℤ) (a : List ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → (2 : ℤ) * abs (a[Int.toNat i]!) < u
theorem boxed_permut'vc (u : ℤ) (a : List ℤ) (a' : List ℤ) (fact0 : boxed u a) (fact1 : List.Perm a a') : boxed u a'
  := sorry
end verifythis_2021_lexicographic_permutations_2_BoxedIntArrays_boxed_permutqtvc
