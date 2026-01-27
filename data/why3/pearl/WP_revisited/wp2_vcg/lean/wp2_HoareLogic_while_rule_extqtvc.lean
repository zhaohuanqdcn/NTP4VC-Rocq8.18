import Why3.Base
import pearl.WP_revisited.lib.lean.wp2.Imp
open Classical
open Lean4Why3
namespace wp2_HoareLogic_while_rule_extqtvc
theorem while_rule_ext'vc (inv' : Imp.fmla) (inv : Imp.fmla) (e : Imp.term) (i : Imp.stmt) (fact0 : Imp.valid_fmla (Imp.fmla.Fimplies inv' inv)) (fact1 : Imp.valid_triple (Imp.fmla.Fand (Imp.fmla.Fterm e) inv') i inv') : Imp.valid_triple inv' (Imp.stmt.Swhile e inv i) (Imp.fmla.Fand (Imp.fmla.Fnot (Imp.fmla.Fterm e)) inv')
  := sorry
end wp2_HoareLogic_while_rule_extqtvc
