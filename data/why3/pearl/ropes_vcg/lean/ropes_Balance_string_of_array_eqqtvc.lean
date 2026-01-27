import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Fibonacci
import pearl.ropes_vcg.lean.ropes.MyString
import pearl.ropes_vcg.lean.ropes.Rope
open Classical
open Lean4Why3
namespace ropes_Balance_string_of_array_eqqtvc
axiom max : ℤ
axiom max'def : (2 : ℤ) ≤ max
axiom string_of_array : List Rope.rope -> ℤ -> ℤ -> MyString.char_string
axiom string_of_array_empty (l : ℤ) (q : List Rope.rope) (fact0 : (0 : ℤ) ≤ l) (fact1 : l ≤ Int.ofNat (List.length q)) : MyString.infix_eqeq (string_of_array q l l) MyString.empty
axiom string_of_array_concat_left (l : ℤ) (u : ℤ) (q : List Rope.rope) (fact0 : (0 : ℤ) ≤ l) (fact1 : l < u) (fact2 : u ≤ Int.ofNat (List.length q)) : MyString.infix_eqeq (string_of_array q l u) (MyString.app (string_of_array q (l + (1 : ℤ)) u) (Rope.string (q[Int.toNat l]!)))
theorem string_of_array_eq'vc (l : ℤ) (u : ℤ) (q1 : List Rope.rope) (q2 : List Rope.rope) (fact0 : (0 : ℤ) ≤ l) (fact1 : l ≤ u) (fact2 : u ≤ Int.ofNat (List.length q1)) (fact3 : List.length q1 = List.length q2) (fact4 : ∀(j : ℤ), l ≤ j ∧ j < u → q1[Int.toNat j]! = q2[Int.toNat j]!) : MyString.infix_eqeq (string_of_array q1 l u) (string_of_array q2 l u)
  := sorry
end ropes_Balance_string_of_array_eqqtvc
