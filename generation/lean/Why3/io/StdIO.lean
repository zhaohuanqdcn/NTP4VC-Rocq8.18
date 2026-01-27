import Why3.Base
open Classical
open Lean4Why3
namespace StdIO
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom foo : t -> ℤ
end StdIO
