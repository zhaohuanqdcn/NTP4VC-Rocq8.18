import Why3.Base
open Classical
open Lean4Why3
namespace Hanoi
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
end Hanoi
