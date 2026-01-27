import Why3.Base
import Why3.int.Sum
open Classical
open Lean4Why3
namespace huffman_with_two_queues_Top_add_lastqtvc
axiom get_closure :  {α : Type} -> [Inhabited α] -> List α -> ℤ -> α
axiom get_closure_def {α : Type} [Inhabited α] (y : List α) (y1 : ℤ) : get_closure y y1 = y[Int.toNat y1]!
noncomputable def last (s : List ℤ) := s[Int.toNat (Int.ofNat (List.length s) - (1 : ℤ))]!
theorem add_last'vc (s : List ℤ) (x : ℤ) (fact0 : (0 : ℤ) < Int.ofNat (List.length s)) (fact1 : Sorted s) (fact2 : last s ≤ x) : Sorted (s ++ [x])
  := sorry
end huffman_with_two_queues_Top_add_lastqtvc
