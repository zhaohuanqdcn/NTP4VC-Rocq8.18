import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace mergesort_array_NaturalMergesort_find_runqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
noncomputable def sorted_sub (a : List elt) (l : ℤ) (u : ℤ) := ∀(i1 : ℤ) (i2 : ℤ), l ≤ i1 ∧ i1 < i2 ∧ i2 < u → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
noncomputable def sorted (a : List elt) := ∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 < Int.ofNat (List.length a) → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
theorem find_run'vc (lo : ℤ) (a : List elt) (fact0 : (0 : ℤ) ≤ lo) (fact1 : lo < Int.ofNat (List.length a)) : let o1 : ℤ := lo + (1 : ℤ); ((lo < o1 ∧ o1 ≤ Int.ofNat (List.length a)) ∧ sorted_sub a lo o1) ∧ (∀(i : ℤ), (lo < i ∧ i ≤ Int.ofNat (List.length a)) ∧ sorted_sub a lo i → (let o2 : ℤ := Int.ofNat (List.length a); (i < o2 → ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ (let o3 : ℤ := i - (1 : ℤ); (0 : ℤ) ≤ o3 ∧ o3 < Int.ofNat (List.length a))) ∧ (∀(o3 : Bool), (if i < o2 then o3 = (if le (a[Int.toNat (i - (1 : ℤ))]!) (a[Int.toNat i]!) then true else false) else o3 = false) → (if o3 = true then ((0 : ℤ) ≤ Int.ofNat (List.length a) - i ∧ Int.ofNat (List.length a) - (i + (1 : ℤ)) < Int.ofNat (List.length a) - i) ∧ (lo < i + (1 : ℤ) ∧ i + (1 : ℤ) ≤ Int.ofNat (List.length a)) ∧ sorted_sub a lo (i + (1 : ℤ)) else (lo < i ∧ i ≤ Int.ofNat (List.length a)) ∧ sorted_sub a lo i ∧ (i < Int.ofNat (List.length a) → ¬le (a[Int.toNat (i - (1 : ℤ))]!) (a[Int.toNat i]!))))))
  := sorry
end mergesort_array_NaturalMergesort_find_runqtvc
