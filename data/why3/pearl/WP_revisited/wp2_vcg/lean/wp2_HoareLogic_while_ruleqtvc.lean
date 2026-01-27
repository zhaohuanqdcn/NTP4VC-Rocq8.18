import Why3.Base
import pearl.WP_revisited.lib.lean.wp2.Imp
open Classical
open Lean4Why3
namespace wp2_HoareLogic_while_ruleqtvc
theorem while_rule'vc (e : Imp.term) (inv : Imp.fmla) (i : Imp.stmt) (fact0 : Imp.valid_triple (Imp.fmla.Fand (Imp.fmla.Fterm e) inv) i inv) : Imp.valid_triple inv (Imp.stmt.Swhile e inv i) (Imp.fmla.Fand (Imp.fmla.Fnot (Imp.fmla.Fterm e)) inv)
  := sorry
end wp2_HoareLogic_while_ruleqtvc
