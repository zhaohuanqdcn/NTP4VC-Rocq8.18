import Why3.Base
import pearl.WP_revisited.lib.lean.blocking_semantics5.Syntax
import pearl.WP_revisited.lib.lean.blocking_semantics5.SemOp
import pearl.WP_revisited.lib.lean.blocking_semantics5.Typing
open Classical
open Lean4Why3
namespace blocking_semantics5_TypingAndSemantics_type_preservationqtvc
noncomputable def compatible_env (sigma : Syntax.mident -> Syntax.value) (sigmat : Syntax.mident -> Syntax.datatype) (pi : List (Syntax.ident × Syntax.value)) (pit : List (Syntax.ident × Syntax.datatype)) := (∀(id1 : Syntax.mident), Typing.type_value (sigma id1) = sigmat id1) ∧ (∀(id1 : Syntax.ident), Typing.type_value (SemOp.get_stack id1 pi) = Typing.get_vartype id1 pit)
theorem type_preservation'vc (sigmat : Syntax.mident -> Syntax.datatype) (pit : List (Syntax.ident × Syntax.datatype)) (s1 : Syntax.stmt) (sigma1 : Syntax.mident -> Syntax.value) (pi1 : List (Syntax.ident × Syntax.value)) (sigma2 : Syntax.mident -> Syntax.value) (pi2 : List (Syntax.ident × Syntax.value)) (s2 : Syntax.stmt) (fact0 : Typing.type_stmt sigmat pit s1) (fact1 : compatible_env sigma1 sigmat pi1 pit) (fact2 : SemOp.one_step sigma1 pi1 s1 sigma2 pi2 s2) : Typing.type_stmt sigmat pit s2 ∧ compatible_env sigma2 sigmat pi2 pit
  := sorry
end blocking_semantics5_TypingAndSemantics_type_preservationqtvc
