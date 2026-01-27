import Why3.Base
open Classical
open Lean4Why3
namespace ropes_MyString_app_assocqtvc
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
axiom empty : char_string
axiom empty'def : length empty = (0 : ℤ)
noncomputable def infix_eqeq (s1 : char_string) (s2 : char_string) := length s1 = length s2 ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < length s1 → mixfix_lbrb s1 i = mixfix_lbrb s2 i)
axiom extensionality (s1 : char_string) (s2 : char_string) (fact0 : infix_eqeq s1 s2) : s1 = s2
axiom app : char_string -> char_string -> char_string
axiom app_def1 (s1 : char_string) (s2 : char_string) : length (app s1 s2) = length s1 + length s2
axiom app_def2 (i : ℤ) (s1 : char_string) (s2 : char_string) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < length s1) : mixfix_lbrb (app s1 s2) i = mixfix_lbrb s1 i
axiom app_def3 (s1 : char_string) (i : ℤ) (s2 : char_string) (fact0 : length s1 ≤ i) (fact1 : i < length s1 + length s2) : mixfix_lbrb (app s1 s2) i = mixfix_lbrb s2 (i - length s1)
theorem app_assoc'vc (s1 : char_string) (s2 : char_string) (s3 : char_string) : infix_eqeq (app s1 (app s2 s3)) (app (app s1 s2) s3)
  := sorry
end ropes_MyString_app_assocqtvc
