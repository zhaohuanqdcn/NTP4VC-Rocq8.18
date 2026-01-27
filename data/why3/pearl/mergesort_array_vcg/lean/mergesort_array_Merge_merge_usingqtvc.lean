import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace mergesort_array_Merge_merge_usingqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
noncomputable def sorted_sub (a : List elt) (l : ℤ) (u : ℤ) := ∀(i1 : ℤ) (i2 : ℤ), l ≤ i1 ∧ i1 < i2 ∧ i2 < u → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
noncomputable def sorted (a : List elt) := ∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 < Int.ofNat (List.length a) → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
theorem merge_using'vc (l : ℤ) (m : ℤ) (r : ℤ) (tmp : List elt) (a : List elt) (o1 : Bool) (fact0 : (0 : ℤ) ≤ l) (fact1 : l ≤ m) (fact2 : m ≤ r) (fact3 : r ≤ Int.ofNat (List.length tmp)) (fact4 : List.length tmp = List.length a) (fact5 : sorted_sub a l m) (fact6 : sorted_sub a m r) (fact7 : if l < m then o1 = (if m < r then true else false) else o1 = false) : if o1 = true then ((0 : ℤ) ≤ m ∧ m < Int.ofNat (List.length a)) ∧ (let o2 : ℤ := m - (1 : ℤ); ((0 : ℤ) ≤ o2 ∧ o2 < Int.ofNat (List.length a)) ∧ (if le (a[Int.toNat o2]!) (a[Int.toNat m]!) then sorted_sub a l r ∧ List.permut_sub a a (Int.toNat l) (Int.toNat r) else let o3 : ℤ := r - l; (((0 : ℤ) ≤ l ∧ (0 : ℤ) ≤ o3 ∧ l + o3 ≤ Int.ofNat (List.length a)) ∧ (0 : ℤ) ≤ l ∧ l + o3 ≤ Int.ofNat (List.length tmp)) ∧ (∀(tmp1 : List elt), List.length tmp1 = List.length tmp → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < l ∨ l + o3 ≤ i ∧ i < Int.ofNat (List.length tmp1) → tmp1[Int.toNat i]! = tmp[Int.toNat i]!) ∧ (∀(i : ℤ), l ≤ i ∧ i < l + o3 → tmp1[Int.toNat i]! = a[Int.toNat (l + i - l)]!) → (((0 : ℤ) ≤ l ∧ l ≤ m ∧ m ≤ r ∧ r ≤ Int.ofNat (List.length tmp1) ∧ List.length tmp1 = List.length a) ∧ sorted_sub tmp1 l m ∧ sorted_sub tmp1 m r) ∧ (∀(a1 : List elt), List.length a1 = List.length a → sorted_sub a1 l r ∧ List.permut_sub tmp1 a1 (Int.toNat l) (Int.toNat r) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < l ∨ r ≤ i ∧ i < Int.ofNat (List.length a1) → a1[Int.toNat i]! = a[Int.toNat i]!) → sorted_sub a1 l r ∧ List.permut_sub a a1 (Int.toNat l) (Int.toNat r) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < l ∨ r ≤ i ∧ i < Int.ofNat (List.length a1) → a1[Int.toNat i]! = a[Int.toNat i]!))))) else sorted_sub a l r ∧ List.permut_sub a a (Int.toNat l) (Int.toNat r)
  := sorry
end mergesort_array_Merge_merge_usingqtvc
