import Why3.Base
open Classical
open Lean4Why3
namespace RoundingMode
inductive mode where
  | RNE : mode
  | RNA : mode
  | RTP : mode
  | RTN : mode
  | RTZ : mode
axiom inhabited_axiom_mode : Inhabited mode
attribute [instance] inhabited_axiom_mode
noncomputable def to_nearest (m : mode) := m = mode.RNE ∨ m = mode.RNA
end RoundingMode
