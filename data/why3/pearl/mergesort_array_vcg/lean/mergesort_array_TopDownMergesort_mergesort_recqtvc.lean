import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace mergesort_array_TopDownMergesort_mergesort_recqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
noncomputable def sorted_sub (a : List elt) (l : ℤ) (u : ℤ) := ∀(i1 : ℤ) (i2 : ℤ), l ≤ i1 ∧ i1 < i2 ∧ i2 < u → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
noncomputable def sorted (a : List elt) := ∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 < Int.ofNat (List.length a) → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
theorem mergesort_rec'vc (l : ℤ) (r : ℤ) (a : List elt) (tmp : List elt) (fact0 : (0 : ℤ) ≤ l) (fact1 : l ≤ r) (fact2 : r ≤ Int.ofNat (List.length a)) (fact3 : List.length a = List.length tmp) : if r - (1 : ℤ) ≤ l then sorted_sub a l r ∧ List.permut_sub' a a (Int.toNat l) (Int.toNat r) else ¬(2 : ℤ) = (0 : ℤ) ∧ (let m : ℤ := l + Int.tdiv (r - l) (2 : ℤ); (((0 : ℤ) ≤ r - l ∧ m - l < r - l) ∧ (0 : ℤ) ≤ l ∧ l ≤ m ∧ m ≤ Int.ofNat (List.length a) ∧ List.length a = List.length tmp) ∧ (∀(tmp1 : List elt) (a1 : List elt), List.length tmp1 = List.length tmp → List.length a1 = List.length a → sorted_sub a1 l m ∧ List.permut_sub' a a1 (Int.toNat l) (Int.toNat m) → (((0 : ℤ) ≤ r - l ∧ r - m < r - l) ∧ (0 : ℤ) ≤ m ∧ m ≤ r ∧ r ≤ Int.ofNat (List.length a1) ∧ List.length a1 = List.length tmp1) ∧ (∀(tmp2 : List elt) (a2 : List elt), List.length tmp2 = List.length tmp1 → List.length a2 = List.length a1 → sorted_sub a2 m r ∧ List.permut_sub' a1 a2 (Int.toNat m) (Int.toNat r) → (((0 : ℤ) ≤ l ∧ l ≤ m ∧ m ≤ r ∧ r ≤ Int.ofNat (List.length tmp2) ∧ List.length tmp2 = List.length a2) ∧ sorted_sub a2 l m ∧ sorted_sub a2 m r) ∧ (∀(a3 : List elt), List.length a3 = List.length a2 → sorted_sub a3 l r ∧ List.permut_sub a2 a3 (Int.toNat l) (Int.toNat r) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < l ∨ r ≤ i ∧ i < Int.ofNat (List.length a3) → a3[Int.toNat i]! = a2[Int.toNat i]!) → sorted_sub a3 l r ∧ List.permut_sub' a a3 (Int.toNat l) (Int.toNat r)))))
  := sorry
end mergesort_array_TopDownMergesort_mergesort_recqtvc
