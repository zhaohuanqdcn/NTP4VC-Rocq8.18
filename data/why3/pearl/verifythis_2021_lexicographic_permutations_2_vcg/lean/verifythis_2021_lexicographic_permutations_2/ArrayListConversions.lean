import Why3.Base
import Why3.map.MapEq
open Classical
open Lean4Why3
namespace ArrayListConversions
axiom to_list_from : ℤ -> List ℤ -> List ℤ
axiom to_list_from'def (i : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ Int.ofNat (List.length a)) : if i = Int.ofNat (List.length a) then to_list_from i a = ([] : List ℤ) else to_list_from i a = List.cons (a[Int.toNat i]!) (to_list_from (i + (1 : ℤ)) a)
axiom to_list_from'spec'0 (i : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ Int.ofNat (List.length a)) : Int.ofNat (List.length (to_list_from i a)) = Int.ofNat (List.length a) - i
axiom to_list_from'spec (i : ℤ) (a : List ℤ) (k : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ Int.ofNat (List.length a)) (fact2 : (0 : ℤ) ≤ k) (fact3 : k < Int.ofNat (List.length a) - i) : getElem_i? (to_list_from i a) k = Option.some (a[Int.toNat (k + i)]!)
axiom of_list : List ℤ -> List ℤ
axiom of_list'spec'0 (l : List ℤ) : List.length (of_list l) = List.length l
axiom of_list'spec (k : ℤ) (l : List ℤ) (fact0 : (0 : ℤ) ≤ k) (fact1 : k < Int.ofNat (List.length l)) : getElem_i? l k = Option.some ((of_list l)[Int.toNat k]!)
end ArrayListConversions
