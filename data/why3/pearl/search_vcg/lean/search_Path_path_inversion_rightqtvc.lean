import Why3.Base
open Classical
open Lean4Why3
namespace search_Path_path_inversion_rightqtvc
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
theorem path_inversion_right'vc (s : state) (t : state) (n : ℤ) (fact0 : path s t n) : n = (0 : ℤ) ∧ s = t ∨ (0 : ℤ) < n ∧ (∃(s' : state), path s s' (n - (1 : ℤ)) ∧ move s' t)
  := sorry
end search_Path_path_inversion_rightqtvc
