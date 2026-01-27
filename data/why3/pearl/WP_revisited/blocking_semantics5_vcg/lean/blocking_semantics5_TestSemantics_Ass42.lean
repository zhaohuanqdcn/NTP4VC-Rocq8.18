import Why3.Base
import Why3.map.Const
import pearl.WP_revisited.lib.lean.blocking_semantics5.Syntax
import pearl.WP_revisited.lib.lean.blocking_semantics5.SemOp
open Classical
open Lean4Why3
namespace blocking_semantics5_TestSemantics_Ass42
axiom x : Syntax.ident
axiom y : Syntax.mident
theorem Ass42 (sigma' : Syntax.mident -> Syntax.value) (pi' : List (Syntax.ident × Syntax.value)) (fact0 : SemOp.one_step (Const.const (Syntax.value.Vint (0 : ℤ))) (List.cons (x, Syntax.value.Vint (42 : ℤ)) ([] : List (Syntax.ident × Syntax.value))) (Syntax.stmt.Sassign y (Syntax.term.Tvalue (Syntax.value.Vint (42 : ℤ)))) sigma' pi' Syntax.stmt.Sskip) : sigma' y = Syntax.value.Vint (42 : ℤ)
  := sorry
end blocking_semantics5_TestSemantics_Ass42
