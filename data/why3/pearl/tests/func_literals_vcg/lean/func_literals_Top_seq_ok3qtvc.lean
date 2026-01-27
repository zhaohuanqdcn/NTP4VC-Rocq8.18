import Why3.Base
open Classical
open Lean4Why3
namespace func_literals_Top_seq_ok3qtvc
axiom o1 : ℤ -> ℤ -> ℤ
axiom fc : ℤ -> ℤ -> ℤ
axiom o'def (default : ℤ) (x'x : ℤ) : o1 default x'x = (if x'x = (0 : ℤ) then (0 : ℤ) else if x'x = (1 : ℤ) then (1 : ℤ) else if x'x = (2 : ℤ) then (2 : ℤ) else if x'x = (3 : ℤ) then (3 : ℤ) else default)
axiom fc'def (default : ℤ) (x'x : ℤ) : fc default x'x = (if x'x = (0 : ℤ) then (0 : ℤ) else if x'x = (1 : ℤ) then (1 : ℤ) else if x'x = (2 : ℤ) then (2 : ℤ) else if x'x = (3 : ℤ) then (3 : ℤ) else default)
theorem seq_ok3'vc (default : ℤ) : let o2 : ℤ -> ℤ := o1 default; (0 : ℤ) ≤ (4 : ℤ) ∧ (let result : List ℤ := List.create (4 : ℕ) (o2 ∘ Int.ofNat); Int.ofNat (List.length result) = (4 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (4 : ℤ) → result[Int.toNat i]! = o2 i) → result = List.create (4 : ℕ) (fc default ∘ Int.ofNat))
  := sorry
end func_literals_Top_seq_ok3qtvc
