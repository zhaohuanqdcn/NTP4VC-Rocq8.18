import Why3.Base
import pearl.prover.lib.lean.Functions.Config
open Classical
open Lean4Why3
namespace Types
axiom iset : Type
axiom inhabited_axiom_iset : Inhabited iset
attribute [instance] inhabited_axiom_iset
end Types
