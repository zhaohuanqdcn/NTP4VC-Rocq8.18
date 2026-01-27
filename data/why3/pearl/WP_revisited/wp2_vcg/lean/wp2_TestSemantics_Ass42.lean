import Why3.Base
import Why3.map.Const
import pearl.WP_revisited.lib.lean.wp2.Imp
open Classical
open Lean4Why3
namespace wp2_TestSemantics_Ass42
theorem Ass42 (sigma' : ℤ -> Imp.value) (pi' : ℤ -> Imp.value) (fact0 : Imp.one_step (Const.const (Imp.value.Vint (0 : ℤ))) (Const.const (Imp.value.Vint (42 : ℤ))) (Imp.stmt.Sassign (0 : ℤ) (Imp.term.Tconst (42 : ℤ))) sigma' pi' Imp.stmt.Sskip) : sigma' (0 : ℤ) = Imp.value.Vint (42 : ℤ)
  := sorry
end wp2_TestSemantics_Ass42
