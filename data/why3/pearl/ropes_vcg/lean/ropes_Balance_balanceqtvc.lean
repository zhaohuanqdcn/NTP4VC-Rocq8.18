import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Fibonacci
import pearl.ropes_vcg.lean.ropes.MyString
import pearl.ropes_vcg.lean.ropes.Rope
open Classical
open Lean4Why3
namespace ropes_Balance_balanceqtvc
axiom max : ℤ
axiom max'def : (2 : ℤ) ≤ max
axiom string_of_array : List Rope.rope -> ℤ -> ℤ -> MyString.char_string
axiom string_of_array_empty (l : ℤ) (q : List Rope.rope) (fact0 : (0 : ℤ) ≤ l) (fact1 : l ≤ Int.ofNat (List.length q)) : MyString.infix_eqeq (string_of_array q l l) MyString.empty
axiom string_of_array_concat_left (l : ℤ) (u : ℤ) (q : List Rope.rope) (fact0 : (0 : ℤ) ≤ l) (fact1 : l < u) (fact2 : u ≤ Int.ofNat (List.length q)) : MyString.infix_eqeq (string_of_array q l u) (MyString.app (string_of_array q (l + (1 : ℤ)) u) (Rope.string (q[Int.toNat l]!)))
noncomputable def string_of_queue (q : List Rope.rope) := string_of_array q (2 : ℤ) (Int.ofNat (List.length q))
theorem balance'vc (r : Rope.rope) (fact0 : Rope.inv r) (fact1 : Rope.length r < Fibonacci.fib (max + (1 : ℤ))) : let o1 : ℤ := max + (1 : ℤ); (0 : ℤ) ≤ o1 ∧ (∀(q : List Rope.rope), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < o1 → q[Int.toNat i]! = Rope.rope.Emp) ∧ Int.ofNat (List.length q) = o1 → (((2 : ℤ) < Int.ofNat (List.length q) ∧ Int.ofNat (List.length q) = max + (1 : ℤ)) ∧ Rope.inv r ∧ (∀(j : ℤ), (2 : ℤ) ≤ j ∧ j ≤ max → Rope.inv (q[Int.toNat j]!)) ∧ MyString.length (string_of_queue q) + Rope.length r < Fibonacci.fib (max + (1 : ℤ))) ∧ (∀(q1 : List Rope.rope), List.length q1 = List.length q → (∀(j : ℤ), (2 : ℤ) ≤ j ∧ j ≤ max → Rope.inv (q1[Int.toNat j]!)) ∧ MyString.infix_eqeq (string_of_queue q1) (MyString.app (string_of_queue q) (Rope.string r)) → (let o2 : ℤ := max; ((2 : ℤ) ≤ o2 + (1 : ℤ) → (Rope.inv Rope.rope.Emp ∧ MyString.infix_eqeq (Rope.string Rope.rope.Emp) (string_of_array q1 (2 : ℤ) (2 : ℤ))) ∧ (∀(res : Rope.rope), (∀(i : ℤ), ((2 : ℤ) ≤ i ∧ i ≤ o2) ∧ Rope.inv res ∧ MyString.infix_eqeq (Rope.string res) (string_of_array q1 (2 : ℤ) i) → ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length q1)) ∧ (let o3 : Rope.rope := q1[Int.toNat i]!; (Rope.inv o3 ∧ Rope.inv res) ∧ (∀(o4 : Rope.rope), Rope.inv o4 ∧ MyString.infix_eqeq (Rope.string o4) (MyString.app (Rope.string o3) (Rope.string res)) → Rope.inv o4 ∧ MyString.infix_eqeq (Rope.string o4) (string_of_array q1 (2 : ℤ) (i + (1 : ℤ)))))) ∧ (Rope.inv res ∧ MyString.infix_eqeq (Rope.string res) (string_of_array q1 (2 : ℤ) (o2 + (1 : ℤ))) → Rope.inv res ∧ MyString.infix_eqeq (Rope.string res) (Rope.string r)))) ∧ (o2 + (1 : ℤ) < (2 : ℤ) → (let result : Rope.rope := Rope.rope.Emp; Rope.inv result ∧ MyString.infix_eqeq (Rope.string result) (Rope.string r))))))
  := sorry
end ropes_Balance_balanceqtvc
