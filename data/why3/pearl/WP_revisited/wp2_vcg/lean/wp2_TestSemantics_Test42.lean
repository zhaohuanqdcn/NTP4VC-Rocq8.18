import Why3.Base
import Why3.map.Const
import pearl.WP_revisited.lib.lean.wp2.Imp
open Classical
open Lean4Why3
namespace wp2_TestSemantics_Test42
theorem Test42 : Imp.eval_term (Const.const (Imp.value.Vint (0 : ℤ))) (Const.const (Imp.value.Vint (42 : ℤ))) (Imp.term.Tvar (0 : ℤ)) = Imp.value.Vint (42 : ℤ)
  := sorry
end wp2_TestSemantics_Test42
