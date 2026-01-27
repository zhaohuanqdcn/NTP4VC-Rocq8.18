import Why3.Base
open Classical
open Lean4Why3
namespace StringBuffer
axiom buffer : Type
axiom inhabited_axiom_buffer : Inhabited buffer
attribute [instance] inhabited_axiom_buffer
axiom str : buffer -> List (BitVec 8)
end StringBuffer
