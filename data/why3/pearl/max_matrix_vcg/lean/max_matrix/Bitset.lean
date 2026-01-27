import Why3.Base
open Classical
open Lean4Why3
namespace Bitset
axiom size : ℤ
axiom set : Type
axiom inhabited_axiom_set : Inhabited set
attribute [instance] inhabited_axiom_set
axiom mem : ℤ -> set -> Prop
axiom remove : ℤ -> set -> set
axiom remove'spec (y : ℤ) (x : ℤ) (s : set) : mem y (remove x s) = (¬y = x ∧ mem y s)
axiom below : ℤ -> set
axiom below'spec (n : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : n ≤ size) : mem x (below n) = ((0 : ℤ) ≤ x ∧ x < n)
axiom cardinal : set -> ℤ
axiom cardinal_empty (s : set) : (cardinal s = (0 : ℤ)) = (∀(x : ℤ), ¬mem x s)
axiom cardinal_remove (x : ℤ) (s : set) (fact0 : mem x s) : cardinal s = (1 : ℤ) + cardinal (remove x s)
axiom cardinal_below (n : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : n ≤ size) : cardinal (below n) = (if (0 : ℤ) ≤ n then n else (0 : ℤ))
end Bitset
