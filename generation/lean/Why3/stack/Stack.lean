import Why3.Base
open Classical
open Lean4Why3
namespace Stack
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom elts :  {α : Type} -> [Inhabited α] -> t α -> List α
noncomputable def length {α : Type} [Inhabited α] (s : t α) := Int.ofNat (List.length (elts s))
end Stack
