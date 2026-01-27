import Why3.Base
import pearl.WP_revisited.lib.lean.blocking_semantics5.Syntax
import pearl.WP_revisited.lib.lean.blocking_semantics5.SemOp
open Classical
open Lean4Why3
namespace blocking_semantics5_FreshVariables_cons_appendqtvc
theorem cons_append'vc {α : Type} [Inhabited α] (a : α) (l1 : List α) (l2 : List α) : List.cons a (l1 ++ l2) = List.cons a l1 ++ l2
  := sorry
end blocking_semantics5_FreshVariables_cons_appendqtvc
