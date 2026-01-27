import Why3.Base
open Classical
open Lean4Why3
namespace func_literals_Top_array_ok2qtvc
axiom o1 : ℤ -> ℤ
axiom o2 : ℤ -> ℤ
axiom fc : ℤ -> ℤ
axiom o'def (x'x : ℤ) : o1 x'x = (if x'x = (0 : ℤ) then (0 : ℤ) else if x'x = (1 : ℤ) then (1 : ℤ) else if x'x = (2 : ℤ) then (2 : ℤ) else if x'x = (3 : ℤ) then (3 : ℤ) else (3 : ℤ))
axiom o'def1 (x'x : ℤ) : o2 x'x = (if x'x = (0 : ℤ) then (0 : ℤ) else if x'x = (1 : ℤ) then (1 : ℤ) else if x'x = (2 : ℤ) then (2 : ℤ) else if x'x = (3 : ℤ) then (3 : ℤ) else (3 : ℤ))
axiom fc'def (x'x : ℤ) : fc x'x = (if x'x = (0 : ℤ) then (0 : ℤ) else if x'x = (1 : ℤ) then (1 : ℤ) else if x'x = (2 : ℤ) then (2 : ℤ) else if x'x = (3 : ℤ) then (3 : ℤ) else (3 : ℤ))
theorem array_ok2'vc : (0 : ℤ) ≤ (4 : ℤ) ∧ (∀(result : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (4 : ℤ) → result[Int.toNat i]! = o2 i) ∧ Int.ofNat (List.length result) = (4 : ℤ) → result = List.create (4 : ℕ) (fc ∘ Int.ofNat))
  := sorry
end func_literals_Top_array_ok2qtvc
