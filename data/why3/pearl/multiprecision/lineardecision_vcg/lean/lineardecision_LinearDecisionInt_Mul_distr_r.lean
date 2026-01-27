import Why3.Base
open Classical
open Lean4Why3
namespace lineardecision_LinearDecisionInt_Mul_distr_r
inductive t' where
  | IC : ℤ -> t'
  | Error : t'
axiom inhabited_axiom_t' : Inhabited t'
attribute [instance] inhabited_axiom_t'
noncomputable def interp_id (t : t') (x_v : ℤ -> ℤ) := match t with | t'.IC i => i | t'.Error => (0 : ℤ)
theorem Mul_distr_r (y : ℤ) (z : ℤ) (x : ℤ) : (y + z) * x = y * x + z * x
  := sorry
end lineardecision_LinearDecisionInt_Mul_distr_r
