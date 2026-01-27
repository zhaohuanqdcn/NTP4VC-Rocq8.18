import Why3.Base
import pearl.WP_revisited.lib.lean.blocking_semantics5.Syntax
import pearl.WP_revisited.lib.lean.blocking_semantics5.SemOp
import pearl.WP_revisited.lib.lean.blocking_semantics5.Typing
open Classical
open Lean4Why3
namespace blocking_semantics5_TypingAndSemantics_eval_type_termqtvc
noncomputable def compatible_env (sigma : Syntax.mident -> Syntax.value) (sigmat : Syntax.mident -> Syntax.datatype) (pi : List (Syntax.ident × Syntax.value)) (pit : List (Syntax.ident × Syntax.datatype)) := (∀(id1 : Syntax.mident), Typing.type_value (sigma id1) = sigmat id1) ∧ (∀(id1 : Syntax.ident), Typing.type_value (SemOp.get_stack id1 pi) = Typing.get_vartype id1 pit)
theorem eval_type_term'vc (sigma : Syntax.mident -> Syntax.value) (sigmat : Syntax.mident -> Syntax.datatype) (pi : List (Syntax.ident × Syntax.value)) (pit : List (Syntax.ident × Syntax.datatype)) (t : Syntax.term) (ty : Syntax.datatype) (fact0 : compatible_env sigma sigmat pi pit) (fact1 : Typing.type_term sigmat pit t ty) : Typing.type_value (SemOp.eval_term sigma pi t) = ty
  := sorry
end blocking_semantics5_TypingAndSemantics_eval_type_termqtvc
