import Why3.Base
import pearl.WP_revisited.lib.lean.wp2.Imp
open Classical
open Lean4Why3
namespace wp2_HoareLogic_assign_ruleqtvc
theorem assign_rule'vc (id1 : ℤ) (q : Imp.fmla) (e : Imp.term) (x : ℤ) (fact0 : Imp.fresh_in_fmla id1 q) : Imp.valid_triple (Imp.fmla.Flet id1 e (Imp.subst q x id1)) (Imp.stmt.Sassign x e) q
  := sorry
end wp2_HoareLogic_assign_ruleqtvc
