import Why3.Base
open Classical
open Lean4Why3
namespace search_Path_path_firstqtvc
axiom state : Type
axiom inhabited_axiom_state : Inhabited state
attribute [instance] inhabited_axiom_state
axiom moves : state -> List state
axiom start : state
axiom success : state -> Prop
inductive path : state -> state -> ℤ -> Prop where
 | Path0 (s : state) : path s s (0 : ℤ)
 | Path1 (i : ℤ) (s : state) : (0 : ℤ) ≤ i → i < Int.ofNat (List.length (moves s)) → path s ((moves s)[Int.toNat i]!) (1 : ℤ)
 | Patht (s : state) (t : state) (n : ℤ) (u : state) (m : ℤ) : path s t n → path t u m → path s u (n + m)
noncomputable def move (s : state) (t : state) := ∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (moves s))) ∧ t = (moves s)[Int.toNat i]!
theorem path_first'vc (s : state) (t : state) (n : ℤ) (fact0 : path s t n) (fact1 : (0 : ℤ) < n) : let o1 : ℤ := Int.ofNat (List.length (moves s)) - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → ¬path ((moves s)[Int.toNat j]!) t (n - (1 : ℤ))) ∧ (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → ¬path ((moves s)[Int.toNat j]!) t (n - (1 : ℤ))) → (let s' : state := (moves s)[Int.toNat i]!; if path s' t (n - (1 : ℤ)) then move s s' ∧ path s' t (n - (1 : ℤ)) else ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i + (1 : ℤ) → ¬path ((moves s)[Int.toNat j]!) t (n - (1 : ℤ)))) ∧ ¬(∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < o1 + (1 : ℤ) → ¬path ((moves s)[Int.toNat j]!) t (n - (1 : ℤ)))) ∧ ¬o1 + (1 : ℤ) < (0 : ℤ)
  := sorry
end search_Path_path_firstqtvc
