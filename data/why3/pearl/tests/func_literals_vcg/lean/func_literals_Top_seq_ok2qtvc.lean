import Why3.Base
open Classical
open Lean4Why3
namespace func_literals_Top_seq_ok2qtvc
axiom o1 : ℤ -> ℤ
axiom fc : ℤ -> ℤ
axiom o'def (x'x : ℤ) : o1 x'x = (if x'x = (0 : ℤ) then (0 : ℤ) else if x'x = (1 : ℤ) then (1 : ℤ) else if x'x = (2 : ℤ) then (2 : ℤ) else if x'x = (3 : ℤ) then (3 : ℤ) else (3 : ℤ))
axiom fc'def (x'x : ℤ) : fc x'x = (if x'x = (0 : ℤ) then (0 : ℤ) else if x'x = (1 : ℤ) then (1 : ℤ) else if x'x = (2 : ℤ) then (2 : ℤ) else if x'x = (3 : ℤ) then (3 : ℤ) else (3 : ℤ))
theorem seq_ok2'vc : let o2 : ℤ -> ℤ := o1; (0 : ℤ) ≤ (4 : ℤ) ∧ (let result : List ℤ := List.create (4 : ℕ) (o2 ∘ Int.ofNat); Int.ofNat (List.length result) = (4 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (4 : ℤ) → result[Int.toNat i]! = o2 i) → result = List.create (4 : ℕ) (fc ∘ Int.ofNat))
  := sorry
end func_literals_Top_seq_ok2qtvc
