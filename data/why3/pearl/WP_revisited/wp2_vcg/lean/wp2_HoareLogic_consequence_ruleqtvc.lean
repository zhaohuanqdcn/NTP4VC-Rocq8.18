import Why3.Base
import pearl.WP_revisited.lib.lean.wp2.Imp
open Classical
open Lean4Why3
namespace wp2_HoareLogic_consequence_ruleqtvc
theorem consequence_rule'vc (p' : Imp.fmla) (p : Imp.fmla) (i : Imp.stmt) (q : Imp.fmla) (q' : Imp.fmla) (fact0 : Imp.valid_fmla (Imp.fmla.Fimplies p' p)) (fact1 : Imp.valid_triple p i q) (fact2 : Imp.valid_fmla (Imp.fmla.Fimplies q q')) : Imp.valid_triple p' i q'
  := sorry
end wp2_HoareLogic_consequence_ruleqtvc
