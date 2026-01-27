import Why3.Base
open Classical
open Lean4Why3
namespace search_Path_path_lastqtvc
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
theorem path_last'vc (s : state) (t : state) (n : ℤ) (fact0 : path s t n) (fact1 : (0 : ℤ) < n) : (¬n = (1 : ℤ) → (let o1 : ℤ := n - (1 : ℤ); (path s t n ∧ (0 : ℤ) < n) ∧ (∀(o2 : state), move s o2 ∧ path o2 t (n - (1 : ℤ)) → ((0 : ℤ) ≤ n ∧ o1 < n) ∧ path o2 t o1 ∧ (0 : ℤ) < o1))) ∧ (∀(t' : state), (if n = (1 : ℤ) then t' = s else ∃(o1 : state), (move s o1 ∧ path o1 t (n - (1 : ℤ))) ∧ path o1 t' (n - (1 : ℤ) - (1 : ℤ)) ∧ move t' t) → path s t' (n - (1 : ℤ)) ∧ move t' t)
  := sorry
end search_Path_path_lastqtvc
