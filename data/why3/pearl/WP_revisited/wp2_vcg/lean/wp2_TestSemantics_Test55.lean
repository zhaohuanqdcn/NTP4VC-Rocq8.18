import Why3.Base
import Why3.map.Const
import pearl.WP_revisited.lib.lean.wp2.Imp
open Classical
open Lean4Why3
namespace wp2_TestSemantics_Test55
theorem Test55 : Imp.eval_term (Const.const (Imp.value.Vint (0 : ℤ))) (Const.const (Imp.value.Vint (42 : ℤ))) (Imp.term.Tbin (Imp.term.Tvar (0 : ℤ)) Imp.operator.Oplus (Imp.term.Tconst (13 : ℤ))) = Imp.value.Vint (55 : ℤ)
  := sorry
end wp2_TestSemantics_Test55
