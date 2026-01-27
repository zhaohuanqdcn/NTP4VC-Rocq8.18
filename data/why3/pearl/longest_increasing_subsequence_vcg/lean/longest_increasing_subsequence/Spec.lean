import Why3.Base
open Classical
open Lean4Why3
namespace Spec
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom lt : elt -> elt -> Prop
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : lt x y) (fact1 : lt y z) : lt x z
axiom Asymm (x : elt) (y : elt) (fact0 : lt x y) : ¬lt y x
axiom Trichotomy (x : elt) (y : elt) : lt x y ∨ lt y x ∨ x = y
noncomputable def iss (s : List ℤ) (w : List elt) := (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → (0 : ℤ) ≤ s[Int.toNat i]! ∧ s[Int.toNat i]! < Int.ofNat (List.length w)) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < Int.ofNat (List.length s) → s[Int.toNat i]! < s[Int.toNat j]! ∧ lt (w[Int.toNat (s[Int.toNat i]!)]!) (w[Int.toNat (s[Int.toNat j]!)]!))
noncomputable def liss (s : List ℤ) (w : List elt) := iss s w ∧ (∀(s' : List ℤ), iss s' w → List.length s' ≤ List.length s)
end Spec
