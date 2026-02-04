import Why3.Base
import Why3.Qed.Qed
open Classical
open Lean4Why3
namespace S5_FloatRMat
structure s5_floatrmat where
  f5_floatrmat_m : ℤ -> ℝ
axiom inhabited_axiom_s5_floatrmat : Inhabited s5_floatrmat
attribute [instance] inhabited_axiom_s5_floatrmat
end S5_FloatRMat
