import Why3.Base
import pearl.WP_revisited.lib.lean.blocking_semantics5.Syntax
import pearl.WP_revisited.lib.lean.blocking_semantics5.SemOp
open Classical
open Lean4Why3
namespace blocking_semantics5_FreshVariables_append_nil_lqtvc
theorem append_nil_l'vc {α : Type} [Inhabited α] (l : List α) : ([] : List α) ++ l = l
  := sorry
end blocking_semantics5_FreshVariables_append_nil_lqtvc
