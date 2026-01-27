import Why3.Base
open Classical
open Lean4Why3
namespace HashTable
axiom t : Type -> Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] {β : Type} [Inhabited β] : Inhabited (t α β)
attribute [instance] inhabited_axiom_t
axiom contents :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> t α β -> α -> Option β
noncomputable def mixfix_lbrb {β : Type} {α : Type} [Inhabited β] [Inhabited α] (h : t α β) (k : α) := contents h k
end HashTable
