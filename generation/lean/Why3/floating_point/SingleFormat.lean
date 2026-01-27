import Why3.Base
open Classical
open Lean4Why3
namespace SingleFormat
axiom single : Type
axiom inhabited_axiom_single : Inhabited single
attribute [instance] inhabited_axiom_single
end SingleFormat
