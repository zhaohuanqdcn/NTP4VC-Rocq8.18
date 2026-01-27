import Why3.Base
open Classical
open Lean4Why3
namespace blocking_semantics5_Syntax_mident_decideqtvc
inductive datatype where
  | TYunit : datatype
  | TYint : datatype
  | TYbool : datatype
axiom inhabited_axiom_datatype : Inhabited datatype
attribute [instance] inhabited_axiom_datatype
inductive value where
  | Vvoid : value
  | Vint : ℤ -> value
  | Vbool : Bool -> value
axiom inhabited_axiom_value : Inhabited value
attribute [instance] inhabited_axiom_value
inductive operator where
  | Oplus : operator
  | Ominus : operator
  | Omult : operator
  | Ole : operator
axiom inhabited_axiom_operator : Inhabited operator
attribute [instance] inhabited_axiom_operator
axiom mident : Type
axiom inhabited_axiom_mident : Inhabited mident
attribute [instance] inhabited_axiom_mident
theorem mident_decide'vc : True ∨ ¬True
  := sorry
end blocking_semantics5_Syntax_mident_decideqtvc
