import Why3.Base
open Classical
open Lean4Why3
namespace balance_NoCheating_solve3qtvc
inductive outcome where
  | Left : outcome
  | Equal : outcome
  | Right : outcome
axiom inhabited_axiom_outcome : Inhabited outcome
attribute [instance] inhabited_axiom_outcome
axiom counter : Type
axiom inhabited_axiom_counter : Inhabited counter
attribute [instance] inhabited_axiom_counter
axiom v : counter -> ℤ
axiom subset : Type
axiom inhabited_axiom_subset : Inhabited subset
attribute [instance] inhabited_axiom_subset
noncomputable def sum (balls : List ℤ) (s : ℤ -> Bool) := (if s (0 : ℤ) = true then balls[(0 : ℕ)]! else (0 : ℤ)) + (if s (1 : ℤ) = true then balls[(1 : ℕ)]! else (0 : ℤ)) + (if s (2 : ℤ) = true then balls[(2 : ℕ)]! else (0 : ℤ)) + (if s (3 : ℤ) = true then balls[(3 : ℕ)]! else (0 : ℤ)) + (if s (4 : ℤ) = true then balls[(4 : ℕ)]! else (0 : ℤ)) + (if s (5 : ℤ) = true then balls[(5 : ℕ)]! else (0 : ℤ)) + (if s (6 : ℤ) = true then balls[(6 : ℕ)]! else (0 : ℤ)) + (if s (7 : ℤ) = true then balls[(7 : ℕ)]! else (0 : ℤ))
noncomputable def spec (balls : List ℤ) (lo : ℤ) (hi : ℤ) (lb : ℤ) (w : ℤ) := ((0 : ℤ) ≤ lo ∧ lo ≤ lb ∧ lb < hi ∧ hi ≤ Int.ofNat (List.length balls) ∧ Int.ofNat (List.length balls) = (8 : ℤ)) ∧ (∀(i : ℤ), lo ≤ i ∧ i < hi → ¬i = lb → balls[Int.toNat i]! = w) ∧ balls[Int.toNat lb]! < w
axiom o1 : ℤ -> ℤ -> Bool
axiom o2 : ℤ -> ℤ -> Bool
axiom o'def (lo : ℤ) (i : ℤ) : (o1 lo i = true) = (i = lo + (1 : ℤ))
axiom o'def1 (lo : ℤ) (i : ℤ) : (o2 lo i = true) = (i = lo)
theorem solve3'vc (counter1 : counter) (balls : List ℤ) (lo : ℤ) (lb : ℤ) (w : ℤ) (fact0 : (1 : ℤ) ≤ v counter1) (fact1 : spec balls lo (lo + (3 : ℤ)) lb w) : let o3 : ℤ -> Bool := o1 lo; let o4 : ℤ -> Bool := o2 lo; ((0 : ℤ) < v counter1 ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (8 : ℤ) → ¬o4 i = true ∨ ¬o3 i = true)) ∧ (∀(counter2 : counter) (o5 : outcome), (let left1 : ℤ := sum balls o4; let right1 : ℤ := sum balls o3; match o5 with | outcome.Left => right1 < left1 | outcome.Equal => left1 = right1 | outcome.Right => left1 < right1) ∧ v counter2 = v counter1 - (1 : ℤ) → (match o5 with | outcome.Right => True | outcome.Left => True | outcome.Equal => True) ∧ (∀(result : ℤ), (match o5 with | outcome.Right => result = lo | outcome.Left => result = lo + (1 : ℤ) | outcome.Equal => result = lo + (2 : ℤ)) → result = lb ∧ v counter2 = v counter1 - (1 : ℤ)))
  := sorry
end balance_NoCheating_solve3qtvc
