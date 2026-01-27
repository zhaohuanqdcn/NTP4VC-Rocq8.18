import Why3.Base
import pearl.WP_revisited.lib.lean.wp2.Imp
open Classical
open Lean4Why3
namespace wp2_HoareLogic_seq_ruleqtvc
theorem seq_rule'vc (p : Imp.fmla) (i1 : Imp.stmt) (r : Imp.fmla) (i2 : Imp.stmt) (q : Imp.fmla) (fact0 : Imp.valid_triple p i1 r) (fact1 : Imp.valid_triple r i2 q) : Imp.valid_triple p (Imp.stmt.Sseq i1 i2) q
  := sorry
end wp2_HoareLogic_seq_ruleqtvc
