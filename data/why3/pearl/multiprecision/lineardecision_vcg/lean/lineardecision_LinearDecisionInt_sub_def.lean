import Why3.Base
open Classical
open Lean4Why3
namespace lineardecision_LinearDecisionInt_sub_def
inductive t' where
  | IC : ℤ -> t'
  | Error : t'
axiom inhabited_axiom_t' : Inhabited t'
attribute [instance] inhabited_axiom_t'
noncomputable def interp_id (t : t') (x_v : ℤ -> ℤ) := match t with | t'.IC i => i | t'.Error => (0 : ℤ)
theorem sub_def (a1 : ℤ) (a2 : ℤ) : a1 - a2 = a1 + -a2
  := sorry
end lineardecision_LinearDecisionInt_sub_def
