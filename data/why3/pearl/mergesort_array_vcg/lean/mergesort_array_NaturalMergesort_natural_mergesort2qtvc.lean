import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace mergesort_array_NaturalMergesort_natural_mergesort2qtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
noncomputable def sorted_sub (a : List elt) (l : ℤ) (u : ℤ) := ∀(i1 : ℤ) (i2 : ℤ), l ≤ i1 ∧ i1 < i2 ∧ i2 < u → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
noncomputable def sorted (a : List elt) := ∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 < Int.ofNat (List.length a) → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
theorem natural_mergesort2'vc (tmp : List elt) (a : List elt) (fact0 : List.length tmp = List.length a) (fact1 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length tmp) → tmp[Int.toNat i]! = a[Int.toNat i]!) : let o1 : ℤ := Int.ofNat (List.length a); (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length a) ∧ List.length a = List.length tmp) ∧ (0 : ℤ) ≤ o1) ∧ (∀(a1 : List elt), List.length a1 = List.length a → (∀(x : ℤ), (x = Int.ofNat (List.length a1) ∨ (0 : ℤ) + o1 < x ∧ x < Int.ofNat (List.length a1)) ∧ sorted_sub a1 (0 : ℤ) x ∧ List.permut_sub' a a1 (0 : ℕ) (List.length a1) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → a1[Int.toNat j]! = a[Int.toNat j]!) → sorted a1 ∧ List.Perm a a1))
  := sorry
end mergesort_array_NaturalMergesort_natural_mergesort2qtvc
