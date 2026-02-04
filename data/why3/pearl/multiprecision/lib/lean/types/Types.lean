import Why3.Base
import Why3.why3.Ref.Ref
import pearl.multiprecision.lib.lean.types.Config
import Why3.mach.c.C
import Why3.mach.int.Unsigned
open Classical
open Lean4Why3
namespace Types
axiom limb : Type
axiom inhabited_axiom_limb : Inhabited limb
attribute [instance] inhabited_axiom_limb
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
end Types
