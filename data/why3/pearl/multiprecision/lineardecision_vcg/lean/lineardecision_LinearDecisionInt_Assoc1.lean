import Why3.Base
open Classical
open Lean4Why3
namespace lineardecision_LinearDecisionInt_Assoc1
inductive t' where
  | IC : ℤ -> t'
  | Error : t'
axiom inhabited_axiom_t' : Inhabited t'
attribute [instance] inhabited_axiom_t'
noncomputable def interp_id (t : t') (x_v : ℤ -> ℤ) := match t with | t'.IC i => i | t'.Error => (0 : ℤ)
theorem Assoc (x : ℤ) (y : ℤ) (z : ℤ) : x * y * z = x * (y * z)
  := sorry
end lineardecision_LinearDecisionInt_Assoc1
