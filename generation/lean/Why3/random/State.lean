import Why3.Base
open Classical
open Lean4Why3
namespace State
axiom state : Type
axiom inhabited_axiom_state : Inhabited state
attribute [instance] inhabited_axiom_state
end State
