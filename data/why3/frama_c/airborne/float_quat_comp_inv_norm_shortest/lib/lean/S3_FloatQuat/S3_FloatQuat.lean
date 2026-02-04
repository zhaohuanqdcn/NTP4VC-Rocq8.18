import Why3.Base
import Why3.Qed.Qed
open Classical
open Lean4Why3
namespace S3_FloatQuat
structure s3_floatquat where
  f3_floatquat_qi : ℝ
  f3_floatquat_qx : ℝ
  f3_floatquat_qy : ℝ
  f3_floatquat_qz : ℝ
axiom inhabited_axiom_s3_floatquat : Inhabited s3_floatquat
attribute [instance] inhabited_axiom_s3_floatquat
end S3_FloatQuat
