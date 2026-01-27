import Why3.Base
import pearl.WP_revisited.lib.lean.wp2.Imp
open Classical
open Lean4Why3
namespace wp2_HoareLogic_assert_rule_extqtvc
theorem assert_rule_ext'vc (f : Imp.fmla) (p : Imp.fmla) : Imp.valid_triple (Imp.fmla.Fimplies f p) (Imp.stmt.Sassert f) p
  := sorry
end wp2_HoareLogic_assert_rule_extqtvc
