namespace PqueueNoDup
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom elts : t -> Finset elt
noncomputable def minimal_elt (x : elt) (s : Finset elt) := x ∈ s ∧ (∀(e : elt), e ∈ s → le x e)
end PqueueNoDup
