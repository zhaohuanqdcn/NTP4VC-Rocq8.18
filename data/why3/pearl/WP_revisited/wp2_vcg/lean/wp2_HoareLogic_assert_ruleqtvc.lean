import Why3.Base
import pearl.WP_revisited.lib.lean.wp2.Imp
open Classical
open Lean4Why3
namespace wp2_HoareLogic_assert_ruleqtvc
theorem assert_rule'vc (p : Imp.fmla) (f : Imp.fmla) (fact0 : Imp.valid_fmla (Imp.fmla.Fimplies p f)) : Imp.valid_triple p (Imp.stmt.Sassert f) p
  := sorry
end wp2_HoareLogic_assert_ruleqtvc
