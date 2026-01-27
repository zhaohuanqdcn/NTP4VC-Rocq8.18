import Why3.Base
open Classical
open Lean4Why3
namespace Memory
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom eq : loc -> loc -> Prop
axiom eq'spec (x : loc) (y : loc) : eq x y = (x = y)
inductive kind where
  | Parent : kind
  | Left : kind
  | Right : kind
axiom inhabited_axiom_kind : Inhabited kind
attribute [instance] inhabited_axiom_kind
axiom pmem : Type
axiom inhabited_axiom_pmem : Inhabited pmem
attribute [instance] inhabited_axiom_pmem
axiom memory : Type
axiom inhabited_axiom_memory : Inhabited memory
attribute [instance] inhabited_axiom_memory
axiom accessor : memory -> kind -> loc -> loc
axiom mark : memory -> loc -> Bool
axiom null : loc
axiom non_det_magic : Type
axiom inhabited_axiom_non_det_magic : Inhabited non_det_magic
attribute [instance] inhabited_axiom_non_det_magic
axiom non_det : Type
axiom inhabited_axiom_non_det : Inhabited non_det
attribute [instance] inhabited_axiom_non_det
axiom non_det_field : non_det -> non_det_magic
end Memory
