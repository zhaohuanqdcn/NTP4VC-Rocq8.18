import Why3.Base
import Why3.map.Const
import pearl.WP_revisited.lib.lean.blocking_semantics5.Syntax
import pearl.WP_revisited.lib.lean.blocking_semantics5.SemOp
open Classical
open Lean4Why3
namespace blocking_semantics5_TestSemantics_If42
axiom x : Syntax.ident
axiom y : Syntax.mident
theorem If42 (sigma1 : Syntax.mident -> Syntax.value) (pi1 : List (Syntax.ident × Syntax.value)) (s : Syntax.stmt) (sigma2 : Syntax.mident -> Syntax.value) (pi2 : List (Syntax.ident × Syntax.value)) (fact0 : SemOp.one_step (Const.const (Syntax.value.Vint (0 : ℤ))) (List.cons (x, Syntax.value.Vint (42 : ℤ)) ([] : List (Syntax.ident × Syntax.value))) (Syntax.stmt.Sif (Syntax.term.Tbin (Syntax.term.Tderef y) Syntax.operator.Ole (Syntax.term.Tvalue (Syntax.value.Vint (10 : ℤ)))) (Syntax.stmt.Sassign y (Syntax.term.Tvalue (Syntax.value.Vint (13 : ℤ)))) (Syntax.stmt.Sassign y (Syntax.term.Tvalue (Syntax.value.Vint (42 : ℤ))))) sigma1 pi1 s) (fact1 : SemOp.one_step sigma1 pi1 s sigma2 pi2 Syntax.stmt.Sskip) : sigma2 y = Syntax.value.Vint (13 : ℤ)
  := sorry
end blocking_semantics5_TestSemantics_If42
