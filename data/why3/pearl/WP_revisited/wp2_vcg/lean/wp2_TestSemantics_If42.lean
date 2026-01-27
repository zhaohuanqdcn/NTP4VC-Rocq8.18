import Why3.Base
import Why3.map.Const
import pearl.WP_revisited.lib.lean.wp2.Imp
open Classical
open Lean4Why3
namespace wp2_TestSemantics_If42
theorem If42 (sigma1 : ℤ -> Imp.value) (pi1 : ℤ -> Imp.value) (i : Imp.stmt) (sigma2 : ℤ -> Imp.value) (pi2 : ℤ -> Imp.value) (fact0 : Imp.one_step (Const.const (Imp.value.Vint (0 : ℤ))) (Const.const (Imp.value.Vint (42 : ℤ))) (Imp.stmt.Sif (Imp.term.Tbin (Imp.term.Tderef (0 : ℤ)) Imp.operator.Ole (Imp.term.Tconst (10 : ℤ))) (Imp.stmt.Sassign (0 : ℤ) (Imp.term.Tconst (13 : ℤ))) (Imp.stmt.Sassign (0 : ℤ) (Imp.term.Tconst (42 : ℤ)))) sigma1 pi1 i) (fact1 : Imp.one_step sigma1 pi1 i sigma2 pi2 Imp.stmt.Sskip) : sigma2 (0 : ℤ) = Imp.value.Vint (13 : ℤ)
  := sorry
end wp2_TestSemantics_If42
