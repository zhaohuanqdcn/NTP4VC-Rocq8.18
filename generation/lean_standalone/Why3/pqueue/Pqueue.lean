namespace Pqueue
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
axiom elts : t -> List elt
axiom t'invariant (i1 : ℤ) (i2 : ℤ) (self : t) (fact0 : (0 : ℤ) ≤ i1) (fact1 : i1 ≤ i2) (fact2 : i2 < Int.ofNat (List.length (elts self))) : le ((elts self)[Int.toNat i1]!) ((elts self)[Int.toNat i2]!)
end Pqueue
