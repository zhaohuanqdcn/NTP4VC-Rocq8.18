import Why3.Base
open Classical
open Lean4Why3
namespace balance_NoCheating_solve8qtvc
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
axiom o1 : ℤ -> Bool
axiom o2 : ℤ -> Bool
axiom o3 : ℤ -> Bool
axiom o4 : ℤ -> Bool
axiom o'def (i : ℤ) : (o1 i = true) = (i = (3 : ℤ) ∨ i = (4 : ℤ) ∨ i = (5 : ℤ))
axiom o'def1 (i : ℤ) : (o2 i = true) = (i = (0 : ℤ) ∨ i = (1 : ℤ) ∨ i = (2 : ℤ))
axiom o'def2 (i : ℤ) : (o3 i = true) = (i = (7 : ℤ))
axiom o'def3 (i : ℤ) : (o4 i = true) = (i = (6 : ℤ))
theorem solve8'vc (counter1 : counter) (balls : List ℤ) (lb : ℤ) (w : ℤ) (fact0 : v counter1 = (2 : ℤ)) (fact1 : spec balls (0 : ℤ) (8 : ℤ) lb w) : let o5 : ℤ -> Bool := o1; let o6 : ℤ -> Bool := o2; ((0 : ℤ) < v counter1 ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (8 : ℤ) → ¬o6 i = true ∨ ¬o5 i = true)) ∧ (∀(counter2 : counter) (o7 : outcome), (let left1 : ℤ := sum balls o6; let right1 : ℤ := sum balls o5; match o7 with | outcome.Left => right1 < left1 | outcome.Equal => left1 = right1 | outcome.Right => left1 < right1) ∧ v counter2 = v counter1 - (1 : ℤ) → (match o7 with | outcome.Right => (1 : ℤ) ≤ v counter2 ∧ spec balls (0 : ℤ) ((0 : ℤ) + (3 : ℤ)) lb w | outcome.Left => (1 : ℤ) ≤ v counter2 ∧ spec balls (3 : ℤ) ((3 : ℤ) + (3 : ℤ)) lb w | outcome.Equal => (let o8 : ℤ -> Bool := o3; let o9 : ℤ -> Bool := o4; ((0 : ℤ) < v counter2 ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (8 : ℤ) → ¬o9 i = true ∨ ¬o8 i = true)) ∧ (∀(counter3 : counter) (o10 : outcome), (let left1 : ℤ := sum balls o9; let right1 : ℤ := sum balls o8; match o10 with | outcome.Left => right1 < left1 | outcome.Equal => left1 = right1 | outcome.Right => left1 < right1) ∧ v counter3 = v counter2 - (1 : ℤ) → (match o10 with | outcome.Right => True | outcome.Left => True | outcome.Equal => False) ∧ (∀(result : ℤ), (match o10 with | outcome.Right => result = (6 : ℤ) | outcome.Left => result = (7 : ℤ) | outcome.Equal => False) → result = lb)))))
  := sorry
end balance_NoCheating_solve8qtvc
