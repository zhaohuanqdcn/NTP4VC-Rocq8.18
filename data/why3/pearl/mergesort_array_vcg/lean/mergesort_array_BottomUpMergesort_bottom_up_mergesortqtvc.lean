import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace mergesort_array_BottomUpMergesort_bottom_up_mergesortqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
noncomputable def sorted_sub (a : List elt) (l : ℤ) (u : ℤ) := ∀(i1 : ℤ) (i2 : ℤ), l ≤ i1 ∧ i1 < i2 ∧ i2 < u → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
noncomputable def sorted (a : List elt) := ∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 < Int.ofNat (List.length a) → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
theorem bottom_up_mergesort'vc (a : List elt) : let n : ℤ := Int.ofNat (List.length a); ∀(tmp : List elt), List.length tmp = List.length a ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length tmp) → tmp[Int.toNat i]! = a[Int.toNat i]!) → ((1 : ℤ) ≤ (1 : ℤ) ∧ List.Perm a a ∧ (∀(k : ℤ), let l : ℤ := k * (1 : ℤ); (0 : ℤ) ≤ l ∧ l < n → sorted_sub a l (min n (l + (1 : ℤ))))) ∧ (∀(len : ℤ) (tmp1 : List elt) (a1 : List elt), List.length tmp1 = List.length tmp → List.length a1 = List.length a → (1 : ℤ) ≤ len ∧ List.Perm a a1 ∧ (∀(k : ℤ), let l : ℤ := k * len; (0 : ℤ) ≤ l ∧ l < n → sorted_sub a1 l (min n (l + len))) → (if len < n then (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) = (2 : ℤ) * (0 : ℤ) * len) ∧ List.Perm a1 a1 ∧ (∀(k : ℤ), let l : ℤ := k * len; (0 : ℤ) ≤ l ∧ l < n → sorted_sub a1 l (min n (l + len))) ∧ (∀(k : ℤ), let l : ℤ := k * ((2 : ℤ) * len); (0 : ℤ) ≤ l ∧ l < (0 : ℤ) → sorted_sub a1 l (min n (l + (2 : ℤ) * len)))) ∧ (∀(i : ℤ) (tmp2 : List elt) (a2 : List elt), List.length tmp2 = List.length tmp1 → List.length a2 = List.length a1 → (0 : ℤ) ≤ (2 : ℤ) * i * len ∧ List.Perm a1 a2 ∧ (∀(k : ℤ), let l : ℤ := k * len; (2 : ℤ) * i * len ≤ l ∧ l < n → sorted_sub a2 l (min n (l + len))) ∧ (∀(k : ℤ), let l : ℤ := k * ((2 : ℤ) * len); (0 : ℤ) ≤ l ∧ l < (2 : ℤ) * i * len → sorted_sub a2 l (min n (l + (2 : ℤ) * len))) → (if (2 : ℤ) * i * len < n - len then let mid : ℤ := (2 : ℤ) * i * len + len; let hi : ℤ := min n (mid + len); (((0 : ℤ) ≤ (2 : ℤ) * i * len ∧ (2 : ℤ) * i * len ≤ mid ∧ mid ≤ hi ∧ hi ≤ Int.ofNat (List.length tmp2) ∧ List.length tmp2 = List.length a2) ∧ sorted_sub a2 ((2 : ℤ) * i * len) mid ∧ sorted_sub a2 mid hi) ∧ (∀(a3 : List elt), List.length a3 = List.length a2 → sorted_sub a3 ((2 : ℤ) * i * len) hi ∧ List.permut_sub a2 a3 (Int.toNat ((2 : ℤ) * i * len)) (Int.toNat hi) ∧ (∀(i1 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < (2 : ℤ) * i * len ∨ hi ≤ i1 ∧ i1 < Int.ofNat (List.length a3) → a3[Int.toNat i1]! = a2[Int.toNat i1]!) → ((0 : ℤ) ≤ n + len - (2 : ℤ) * i * len ∧ n + len - (mid + len) < n + len - (2 : ℤ) * i * len) ∧ ((0 : ℤ) ≤ mid + len ∧ mid + len = (2 : ℤ) * (i + (1 : ℤ)) * len) ∧ List.Perm a1 a3 ∧ (∀(k : ℤ), let l : ℤ := k * len; mid + len ≤ l ∧ l < n → sorted_sub a3 l (min n (l + len))) ∧ (∀(k : ℤ), let l : ℤ := k * ((2 : ℤ) * len); (0 : ℤ) ≤ l ∧ l < mid + len → sorted_sub a3 l (min n (l + (2 : ℤ) * len)))) else ((0 : ℤ) ≤ (2 : ℤ) * n - len ∧ (2 : ℤ) * n - (2 : ℤ) * len < (2 : ℤ) * n - len) ∧ (1 : ℤ) ≤ (2 : ℤ) * len ∧ List.Perm a a2 ∧ (∀(k : ℤ), let l : ℤ := k * ((2 : ℤ) * len); (0 : ℤ) ≤ l ∧ l < n → sorted_sub a2 l (min n (l + (2 : ℤ) * len))))) else sorted a1 ∧ List.Perm a a1))
  := sorry
end mergesort_array_BottomUpMergesort_bottom_up_mergesortqtvc
