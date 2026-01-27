import Why3.Base
open Classical
open Lean4Why3
namespace tower_of_hanoi_Hanoi_hanoi_recqtvc
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
theorem hanoi_rec'vc (a : tower) (n : ℤ) (s : List ℤ) (b : tower) (c : tower) (fact0 : rod a = prepend n s) (fact1 : match rod b with | ([] : List ℤ) => True | List.cons x _ => n < x) (fact2 : match rod c with | ([] : List ℤ) => True | List.cons x _ => n < x) : if (0 : ℤ) < n then let t : List ℤ := rod c; let o1 : List ℤ := List.cons n s; let o2 : ℤ := n - (1 : ℤ); (((0 : ℤ) ≤ n ∧ o2 < n) ∧ rod a = prepend o2 o1 ∧ (match rod c with | ([] : List ℤ) => True | List.cons x _ => o2 < x) ∧ (match rod b with | ([] : List ℤ) => True | List.cons x _ => o2 < x)) ∧ (∀(c1 : tower) (b1 : tower) (a1 : tower), rod a1 = o1 ∧ rod c1 = prepend o2 (rod c) ∧ rod b1 = rod b → (rod a1 = List.cons n s ∧ (match rod b1 with | ([] : List ℤ) => True | List.cons x _ => n < x)) ∧ (∀(b2 : tower) (a2 : tower), rod a2 = s ∧ rod b2 = List.cons n (rod b1) → (let o3 : ℤ := n - (1 : ℤ); (((0 : ℤ) ≤ n ∧ o3 < n) ∧ rod c1 = prepend o3 t ∧ (match rod b2 with | ([] : List ℤ) => True | List.cons x _ => o3 < x) ∧ (match rod a2 with | ([] : List ℤ) => True | List.cons x _ => o3 < x)) ∧ (∀(c2 : tower) (b3 : tower) (a3 : tower), rod c2 = t ∧ rod b3 = prepend o3 (rod b2) ∧ rod a3 = rod a2 → rod a3 = s ∧ rod b3 = prepend n (rod b) ∧ rod c2 = rod c)))) else rod a = s ∧ rod b = prepend n (rod b)
  := sorry
end tower_of_hanoi_Hanoi_hanoi_recqtvc
