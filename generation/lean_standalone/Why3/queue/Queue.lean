namespace Queue
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom seq :  {α : Type} -> [Inhabited α] -> t α -> List α
end Queue
