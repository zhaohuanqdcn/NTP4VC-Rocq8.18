import Why3.Base
open Classical
open Lean4Why3
namespace tower_of_hanoi_Hanoi_tower_of_hanoiqtvc
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
theorem tower_of_hanoi'vc (a : tower) (b : tower) (c : tower) (fact0 : rod a = prepend (Int.ofNat (List.length (rod a))) ([] : List ℤ)) (fact1 : rod b = rod c) (fact2 : rod c = ([] : List ℤ)) : let o1 : List ℤ := ([] : List ℤ); let o2 : ℤ := Int.ofNat (List.length (rod a)); (rod a = prepend o2 o1 ∧ (match rod b with | ([] : List ℤ) => True | List.cons x _ => o2 < x) ∧ (match rod c with | ([] : List ℤ) => True | List.cons x _ => o2 < x)) ∧ (∀(c1 : tower) (b1 : tower) (a1 : tower), rod a1 = o1 ∧ rod b1 = prepend o2 (rod b) ∧ rod c1 = rod c → rod b1 = rod a ∧ rod a1 = rod c1 ∧ rod c1 = ([] : List ℤ))
  := sorry
end tower_of_hanoi_Hanoi_tower_of_hanoiqtvc
