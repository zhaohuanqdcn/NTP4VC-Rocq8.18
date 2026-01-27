import Why3.Base
open Classical
open Lean4Why3
namespace func_literals_Top_array_ok4qtvc
axiom o1 : ℤ -> ℤ -> ℤ
axiom o2 : ℤ -> ℤ -> ℤ
axiom fc : ℤ -> ℤ -> ℤ
axiom o'def (default : ℤ) (x'x : ℤ) : o1 default x'x = (if x'x = (0 : ℤ) then (0 : ℤ) else if x'x = (1 : ℤ) then (1 : ℤ) else if x'x = (2 : ℤ) then (2 : ℤ) else if x'x = (3 : ℤ) then (3 : ℤ) else default)
axiom o'def1 (default : ℤ) (x'x : ℤ) : o2 default x'x = (if x'x = (0 : ℤ) then (0 : ℤ) else if x'x = (1 : ℤ) then (1 : ℤ) else if x'x = (2 : ℤ) then (2 : ℤ) else if x'x = (3 : ℤ) then (3 : ℤ) else default)
axiom fc'def (default : ℤ) (x'x : ℤ) : fc default x'x = (if x'x = (0 : ℤ) then (0 : ℤ) else if x'x = (1 : ℤ) then (1 : ℤ) else if x'x = (2 : ℤ) then (2 : ℤ) else if x'x = (3 : ℤ) then (3 : ℤ) else default)
theorem array_ok4'vc (default : ℤ) : (0 : ℤ) ≤ (4 : ℤ) ∧ (∀(result : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (4 : ℤ) → result[Int.toNat i]! = o2 default i) ∧ Int.ofNat (List.length result) = (4 : ℤ) → result = List.create (4 : ℕ) (fc default ∘ Int.ofNat))
  := sorry
end func_literals_Top_array_ok4qtvc
