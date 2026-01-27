import Why3.Base
import pearl.WP_revisited.lib.lean.wp2.Imp
open Classical
open Lean4Why3
namespace wp2_HoareLogic_if_ruleqtvc
theorem if_rule'vc (p : Imp.fmla) (e : Imp.term) (i1 : Imp.stmt) (q : Imp.fmla) (i2 : Imp.stmt) (fact0 : Imp.valid_triple (Imp.fmla.Fand p (Imp.fmla.Fterm e)) i1 q) (fact1 : Imp.valid_triple (Imp.fmla.Fand p (Imp.fmla.Fnot (Imp.fmla.Fterm e))) i2 q) : Imp.valid_triple p (Imp.stmt.Sif e i1 i2) q
  := sorry
end wp2_HoareLogic_if_ruleqtvc
