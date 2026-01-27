import Why3.Base
import pearl.WP_revisited.lib.lean.blocking_semantics5.Syntax
open Classical
open Lean4Why3
namespace blocking_semantics5_SemOp_get_stack_neqqtvc
axiom env : Type
axiom inhabited_axiom_env : Inhabited env
attribute [instance] inhabited_axiom_env
axiom stack : Type
axiom inhabited_axiom_stack : Inhabited stack
attribute [instance] inhabited_axiom_stack
noncomputable def get_stack : Syntax.ident -> List (Syntax.ident × Syntax.value) -> Syntax.value
  | i, ([] : List (Syntax.ident × Syntax.value)) => Syntax.value.Vvoid
  | i, (List.cons (x, v) r) => if x = i then v else get_stack i r
theorem get_stack_neq'vc (x : Syntax.ident) (i : Syntax.ident) (v : Syntax.value) (r : List (Syntax.ident × Syntax.value)) (fact0 : ¬x = i) : get_stack i (List.cons (x, v) r) = get_stack i r
  := sorry
end blocking_semantics5_SemOp_get_stack_neqqtvc
