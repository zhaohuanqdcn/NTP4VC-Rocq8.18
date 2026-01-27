import Why3.Base
import Why3.map.MapEq
open Classical
open Lean4Why3
namespace verifythis_2021_lexicographic_permutations_2_ArrayListConversions_to_listqtvc
axiom to_list_from : ℤ -> List ℤ -> List ℤ
axiom to_list_from'def (i : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ Int.ofNat (List.length a)) : if i = Int.ofNat (List.length a) then to_list_from i a = ([] : List ℤ) else to_list_from i a = List.cons (a[Int.toNat i]!) (to_list_from (i + (1 : ℤ)) a)
axiom to_list_from'spec'0 (i : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ Int.ofNat (List.length a)) : Int.ofNat (List.length (to_list_from i a)) = Int.ofNat (List.length a) - i
axiom to_list_from'spec (i : ℤ) (a : List ℤ) (k : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ Int.ofNat (List.length a)) (fact2 : (0 : ℤ) ≤ k) (fact3 : k < Int.ofNat (List.length a) - i) : getElem_i? (to_list_from i a) k = Option.some (a[Int.toNat (k + i)]!)
theorem to_list'vc (a : List ℤ) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length a)
  := sorry
end verifythis_2021_lexicographic_permutations_2_ArrayListConversions_to_listqtvc
