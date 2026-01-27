import Why3.Base
import Why3.why3.Ref.Ref
import pearl.edit_distance_vcg.lean.edit_distance.MyWord
open Classical
open Lean4Why3
namespace edit_distance_EditDistance_suffix_lengthqtvc
axiom suffix : List MyWord.char -> ℤ -> List MyWord.char
axiom suffix_nil (a : List MyWord.char) : suffix a (Int.ofNat (List.length a)) = ([] : List MyWord.char)
axiom suffix_cons (i : ℤ) (a : List MyWord.char) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < Int.ofNat (List.length a)) : suffix a i = List.cons (a[Int.toNat i]!) (suffix a (i + (1 : ℤ)))
theorem suffix_length'vc (i : ℤ) (a : List MyWord.char) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ Int.ofNat (List.length a)) : Int.ofNat (List.length (suffix a i)) = Int.ofNat (List.length a) - i
  := sorry
end edit_distance_EditDistance_suffix_lengthqtvc
