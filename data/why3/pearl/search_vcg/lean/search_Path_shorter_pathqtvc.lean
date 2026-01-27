import Why3.Base
open Classical
open Lean4Why3
namespace search_Path_shorter_pathqtvc
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
theorem shorter_path'vc (s : state) (t : state) (n : ℤ) (m : ℤ) (o1 : Bool) (fact0 : path s t n) (fact1 : (0 : ℤ) ≤ m) (fact2 : m ≤ n) (fact3 : if n = (0 : ℤ) then o1 = true else o1 = (if m = (0 : ℤ) then true else false)) : (¬o1 = true → (let o2 : ℤ := m - (1 : ℤ); let o3 : ℤ := n - (1 : ℤ); (path s t n ∧ (0 : ℤ) < n) ∧ (∀(o4 : state), move s o4 ∧ path o4 t (n - (1 : ℤ)) → ((0 : ℤ) ≤ n ∧ o3 < n) ∧ path o4 t o3 ∧ (0 : ℤ) ≤ o2 ∧ o2 ≤ o3))) ∧ (∀(r : state), (if o1 = true then r = s else ∃(o2 : state), (move s o2 ∧ path o2 t (n - (1 : ℤ))) ∧ path o2 r (m - (1 : ℤ))) → path s r m)
  := sorry
end search_Path_shorter_pathqtvc
