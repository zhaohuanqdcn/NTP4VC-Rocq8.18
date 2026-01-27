import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace division_Hoare_divisionqtvc
axiom integer : Type
axiom inhabited_axiom_integer : Inhabited integer
attribute [instance] inhabited_axiom_integer
axiom zero : integer
axiom one : integer
axiom infix_pl : integer -> integer -> integer
axiom infix_mn : integer -> integer -> integer
axiom infix_as : integer -> integer -> integer
axiom infix_lseq : integer -> integer -> Prop
axiom A1 (x : integer) (y : integer) : infix_pl x y = infix_pl y x
axiom A2 (x : integer) (y : integer) : infix_as x y = infix_as y x
axiom A3 (x : integer) (y : integer) (z : integer) : infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z)
axiom A4 (x : integer) (y : integer) (z : integer) : infix_as (infix_as x y) z = infix_as x (infix_as y z)
axiom A5 (x : integer) (y : integer) (z : integer) : infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z)
axiom A6 (y : integer) (x : integer) (fact0 : infix_lseq y x) : infix_pl (infix_mn x y) y = x
axiom A7 (x : integer) : infix_pl x zero = x
axiom A8 (x : integer) : infix_as x zero = zero
axiom A9 (x : integer) : infix_as x one = x
theorem division'vc (x : integer) (y : integer) : x = infix_pl x (infix_as y zero) ∧ (∀(q : integer) (r : integer), x = infix_pl r (infix_as y q) → (if infix_lseq y r then x = infix_pl (infix_mn r y) (infix_as y (infix_pl one q)) else ¬infix_lseq y r ∧ x = infix_pl r (infix_as y q)))
  := sorry
end division_Hoare_divisionqtvc
