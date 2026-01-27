import Why3.Base
import pearl.WP_revisited.lib.lean.wp2.Imp
open Classical
open Lean4Why3
namespace wp2_HoareLogic_skip_ruleqtvc
theorem skip_rule'vc (q : Imp.fmla) : Imp.valid_triple q Imp.stmt.Sskip q
  := sorry
end wp2_HoareLogic_skip_ruleqtvc
