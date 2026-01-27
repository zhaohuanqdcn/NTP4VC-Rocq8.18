import Why3.Base
open Classical
open Lean4Why3
namespace Memory
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom null : loc
axiom memory : Type
axiom inhabited_axiom_memory : Inhabited memory
attribute [instance] inhabited_axiom_memory
axiom left1 : memory -> loc -> loc
axiom right1 : memory -> loc -> loc
axiom mark : memory -> loc -> Bool
axiom color : memory -> loc -> Bool
noncomputable def update {α : Type} [Inhabited α] (m1 : loc -> α) (m2 : loc -> α) (l : loc) (v : α) := m1 l = v ∧ (∀(x : loc), ¬x = l → m1 x = m2 x)
end Memory
