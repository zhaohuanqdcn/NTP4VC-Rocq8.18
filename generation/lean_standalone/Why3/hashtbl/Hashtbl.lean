namespace Hashtbl
axiom key : Type
axiom inhabited_axiom_key : Inhabited key
attribute [instance] inhabited_axiom_key
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom contents :  {α : Type} -> [Inhabited α] -> t α -> key -> List α
noncomputable def mixfix_lbrb {α : Type} [Inhabited α] (h : t α) (k : key) := contents h k
end Hashtbl
