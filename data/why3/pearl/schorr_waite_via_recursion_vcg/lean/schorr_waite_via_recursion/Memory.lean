import Why3.Base
open Classical
open Lean4Why3
namespace Memory
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom null : loc
inductive color where
  | White : color
  | Black : Option ℤ -> color
axiom inhabited_axiom_color : Inhabited color
attribute [instance] inhabited_axiom_color
axiom pmem : Type
axiom inhabited_axiom_pmem : Inhabited pmem
attribute [instance] inhabited_axiom_pmem
axiom memory : Type
axiom inhabited_axiom_memory : Inhabited memory
attribute [instance] inhabited_axiom_memory
axiom block_size : memory -> loc -> ℤ
axiom accessor : memory -> loc -> ℤ -> loc
axiom colors : memory -> loc -> color
end Memory
