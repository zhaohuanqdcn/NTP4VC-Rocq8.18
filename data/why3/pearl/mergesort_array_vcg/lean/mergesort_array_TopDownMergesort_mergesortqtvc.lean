import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace mergesort_array_TopDownMergesort_mergesortqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
noncomputable def sorted_sub (a : List elt) (l : ℤ) (u : ℤ) := ∀(i1 : ℤ) (i2 : ℤ), l ≤ i1 ∧ i1 < i2 ∧ i2 < u → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
noncomputable def sorted (a : List elt) := ∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 < Int.ofNat (List.length a) → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
theorem mergesort'vc (tmp : List elt) (a : List elt) (fact0 : List.length tmp = List.length a) (fact1 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length tmp) → tmp[Int.toNat i]! = a[Int.toNat i]!) : let o1 : ℤ := Int.ofNat (List.length a); ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ o1 ∧ o1 ≤ Int.ofNat (List.length a) ∧ List.length a = List.length tmp) ∧ (∀(a1 : List elt), List.length a1 = List.length a → sorted_sub a1 (0 : ℤ) o1 ∧ List.permut_sub' a a1 (0 : ℕ) (Int.toNat o1) → sorted a1 ∧ List.Perm a a1)
  := sorry
end mergesort_array_TopDownMergesort_mergesortqtvc
