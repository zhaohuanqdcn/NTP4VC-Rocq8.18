import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace mergesort_array_NaturalMergesort_natural_mergesortqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
noncomputable def sorted_sub (a : List elt) (l : ℤ) (u : ℤ) := ∀(i1 : ℤ) (i2 : ℤ), l ≤ i1 ∧ i1 < i2 ∧ i2 < u → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
noncomputable def sorted (a : List elt) := ∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 < Int.ofNat (List.length a) → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
theorem natural_mergesort'vc (a : List elt) : let n : ℤ := Int.ofNat (List.length a); if n ≤ (1 : ℤ) then sorted a ∧ List.Perm a a else ∀(tmp : List elt), List.length tmp = List.length a ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length tmp) → tmp[Int.toNat i]! = a[Int.toNat i]!) → ((((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ n) ∧ sorted_sub a (0 : ℤ) (0 : ℤ)) ∧ List.Perm a a) ∧ (∀(first_run : ℤ) (tmp1 : List elt) (a1 : List elt), List.length tmp1 = List.length tmp → List.length a1 = List.length a → (((0 : ℤ) ≤ first_run ∧ first_run ≤ n) ∧ sorted_sub a1 (0 : ℤ) first_run) ∧ List.Perm a a1 → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ n) ∧ (first_run ≤ first_run ∧ first_run ≤ n) ∧ sorted_sub a1 (0 : ℤ) first_run ∧ List.Perm a1 a1) ∧ (∀(lo : ℤ) (first_run1 : ℤ) (tmp2 : List elt) (a2 : List elt), List.length tmp2 = List.length tmp1 → List.length a2 = List.length a1 → ((0 : ℤ) ≤ lo ∧ lo ≤ n) ∧ (first_run ≤ first_run1 ∧ first_run1 ≤ n) ∧ sorted_sub a2 (0 : ℤ) first_run1 ∧ (lo = (0 : ℤ) ∨ first_run1 ≤ lo ∧ first_run < first_run1) ∧ List.Perm a1 a2 → (if lo < n - (1 : ℤ) then ((0 : ℤ) ≤ lo ∧ lo < Int.ofNat (List.length a2)) ∧ (∀(mid : ℤ), (lo < mid ∧ mid ≤ Int.ofNat (List.length a2)) ∧ sorted_sub a2 lo mid ∧ (mid < Int.ofNat (List.length a2) → ¬le (a2[Int.toNat (mid - (1 : ℤ))]!) (a2[Int.toNat mid]!)) → (if mid = n then if lo = (0 : ℤ) then sorted a2 ∧ List.Perm a a2 else ((0 : ℤ) ≤ n - first_run ∧ n - first_run1 < n - first_run) ∧ (((0 : ℤ) ≤ first_run1 ∧ first_run1 ≤ n) ∧ sorted_sub a2 (0 : ℤ) first_run1) ∧ List.Perm a a2 else ((0 : ℤ) ≤ mid ∧ mid < Int.ofNat (List.length a2)) ∧ (∀(hi : ℤ), (mid < hi ∧ hi ≤ Int.ofNat (List.length a2)) ∧ sorted_sub a2 mid hi ∧ (hi < Int.ofNat (List.length a2) → ¬le (a2[Int.toNat (hi - (1 : ℤ))]!) (a2[Int.toNat hi]!)) → (((0 : ℤ) ≤ lo ∧ lo ≤ mid ∧ mid ≤ hi ∧ hi ≤ Int.ofNat (List.length tmp2) ∧ List.length tmp2 = List.length a2) ∧ sorted_sub a2 lo mid ∧ sorted_sub a2 mid hi) ∧ (∀(a3 : List elt), List.length a3 = List.length a2 → sorted_sub a3 lo hi ∧ List.permut_sub a2 a3 (Int.toNat lo) (Int.toNat hi) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < lo ∨ hi ≤ i ∧ i < Int.ofNat (List.length a3) → a3[Int.toNat i]! = a2[Int.toNat i]!) → (if lo = (0 : ℤ) then ((0 : ℤ) ≤ n - lo ∧ n - hi < n - lo) ∧ ((0 : ℤ) ≤ hi ∧ hi ≤ n) ∧ (first_run ≤ hi ∧ hi ≤ n) ∧ sorted_sub a3 (0 : ℤ) hi ∧ (hi = (0 : ℤ) ∨ hi ≤ hi ∧ first_run < hi) ∧ List.Perm a1 a3 else ((0 : ℤ) ≤ n - lo ∧ n - hi < n - lo) ∧ ((0 : ℤ) ≤ hi ∧ hi ≤ n) ∧ (first_run ≤ first_run1 ∧ first_run1 ≤ n) ∧ sorted_sub a3 (0 : ℤ) first_run1 ∧ (hi = (0 : ℤ) ∨ first_run1 ≤ hi ∧ first_run < first_run1) ∧ List.Perm a1 a3))))) else ((0 : ℤ) ≤ n - first_run ∧ n - first_run1 < n - first_run) ∧ (((0 : ℤ) ≤ first_run1 ∧ first_run1 ≤ n) ∧ sorted_sub a2 (0 : ℤ) first_run1) ∧ List.Perm a a2)))
  := sorry
end mergesort_array_NaturalMergesort_natural_mergesortqtvc
