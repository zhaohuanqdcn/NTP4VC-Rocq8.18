import Why3.Base
open Classical
open Lean4Why3
namespace tower_of_hanoi_Hanoi_moveqtvc
axiom tower : Type
axiom inhabited_axiom_tower : Inhabited tower
attribute [instance] inhabited_axiom_tower
axiom rod : tower -> List ℤ
axiom tower'invariant (self : tower) : Sorted (rod self)
noncomputable def tower'eq (a : tower) (b : tower) := rod a = rod b
axiom tower'inj (a : tower) (b : tower) (fact0 : tower'eq a b) : a = b
axiom prepend : ℤ -> List ℤ -> List ℤ
axiom prepend_def_zero (n : ℤ) (s : List ℤ) (fact0 : n ≤ (0 : ℤ)) : prepend n s = s
axiom prepend_def_succ (n : ℤ) (s : List ℤ) (fact0 : (0 : ℤ) < n) : prepend n s = prepend (n - (1 : ℤ)) (List.cons n s)
theorem move'vc (a : tower) (n : ℤ) (s : List ℤ) (b : tower) (fact0 : rod a = List.cons n s) (fact1 : match rod b with | ([] : List ℤ) => True | List.cons x _ => n < x) : match rod a with | List.cons x r => (∀(a1 : tower) (b1 : tower), Sorted r ∧ (r = rod a1 → Sorted (List.cons x (rod b)) ∧ (List.cons x (rod b) = rod b1 → rod a1 = s ∧ rod b1 = List.cons n (rod b)))) | ([] : List ℤ) => False
  := sorry
end tower_of_hanoi_Hanoi_moveqtvc
