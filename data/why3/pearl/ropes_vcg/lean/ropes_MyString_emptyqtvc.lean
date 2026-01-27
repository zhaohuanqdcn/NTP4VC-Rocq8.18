import Why3.Base
open Classical
open Lean4Why3
namespace ropes_MyString_emptyqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
axiom dummy_char : char
axiom char_string : Type
axiom inhabited_axiom_char_string : Inhabited char_string
attribute [instance] inhabited_axiom_char_string
axiom length : char_string -> ℤ
axiom length'spec (x : char_string) : (0 : ℤ) ≤ length x
axiom mixfix_lbrb : char_string -> ℤ -> char
theorem empty'vc : True
  := sorry
end ropes_MyString_emptyqtvc
