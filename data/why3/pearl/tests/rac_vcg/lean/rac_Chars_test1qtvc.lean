import Why3.Base
open Classical
open Lean4Why3
namespace rac_Chars_test1qtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
axiom char'int : char -> ℤ
noncomputable def char'eq (a : char) (b : char) := char'int a = char'int b
axiom char'inj (a : char) (b : char) (fact0 : char'eq a b) : a = b
theorem test1'vc : True
  := sorry
end rac_Chars_test1qtvc
