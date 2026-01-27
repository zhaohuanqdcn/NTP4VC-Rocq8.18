import Why3.Base
import Why3.map.Const
import pearl.WP_revisited.lib.lean.blocking_semantics5.Syntax
import pearl.WP_revisited.lib.lean.blocking_semantics5.SemOp
open Classical
open Lean4Why3
namespace blocking_semantics5_TestSemantics_Test42
axiom x : Syntax.ident
axiom y : Syntax.mident
theorem Test42 : SemOp.eval_term (Const.const (Syntax.value.Vint (0 : ℤ))) (List.cons (x, Syntax.value.Vint (42 : ℤ)) ([] : List (Syntax.ident × Syntax.value))) (Syntax.term.Tvar x) = Syntax.value.Vint (42 : ℤ)
  := sorry
end blocking_semantics5_TestSemantics_Test42
