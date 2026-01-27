import Why3.Base
import pearl.WP_revisited.lib.lean.blocking_semantics5.Syntax
import pearl.WP_revisited.lib.lean.blocking_semantics5.SemOp
import pearl.WP_revisited.lib.lean.blocking_semantics5.Typing
open Classical
open Lean4Why3
namespace blocking_semantics5_TypingAndSemantics_type_inversionqtvc
noncomputable def compatible_env (sigma : Syntax.mident -> Syntax.value) (sigmat : Syntax.mident -> Syntax.datatype) (pi : List (Syntax.ident × Syntax.value)) (pit : List (Syntax.ident × Syntax.datatype)) := (∀(id1 : Syntax.mident), Typing.type_value (sigma id1) = sigmat id1) ∧ (∀(id1 : Syntax.ident), Typing.type_value (SemOp.get_stack id1 pi) = Typing.get_vartype id1 pit)
theorem type_inversion'vc (v : Syntax.value) : match Typing.type_value v with | Syntax.datatype.TYbool => (∃(b : Bool), v = Syntax.value.Vbool b) | Syntax.datatype.TYint => (∃(n : ℤ), v = Syntax.value.Vint n) | Syntax.datatype.TYunit => v = Syntax.value.Vvoid
  := sorry
end blocking_semantics5_TypingAndSemantics_type_inversionqtvc
