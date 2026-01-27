import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace insertion_sort_naive_InsertionSortNaiveGen_sortqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
noncomputable def sorted_sub (a : ℤ -> elt) (l : ℤ) (u : ℤ) := ∀(i1 : ℤ) (i2 : ℤ), l ≤ i1 ∧ i1 ≤ i2 ∧ i2 < u → le (a i1) (a i2)
axiom le_refl (x : elt) : le x x
axiom le_asym (x : elt) (y : elt) (fact0 : ¬le x y) : le y x
axiom le_trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
noncomputable def sorted_sub1 (a : List elt) (l : ℤ) (u : ℤ) := sorted_sub (getElem! a ∘ Int.toNat) l u
noncomputable def sorted (a : List elt) := sorted_sub (getElem! a ∘ Int.toNat) (0 : ℤ) (Int.ofNat (List.length a))
theorem sort'vc (a : List elt) : let o1 : ℤ := Int.ofNat (List.length a) - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → (List.Perm a a ∧ sorted_sub1 a (0 : ℤ) (0 : ℤ)) ∧ (∀(a1 : List elt), List.length a1 = List.length a → (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ List.Perm a a1 ∧ sorted_sub1 a1 (0 : ℤ) i → (((0 : ℤ) ≤ i ∧ i ≤ i) ∧ List.Perm a a1 ∧ sorted_sub1 a1 (0 : ℤ) i ∧ sorted_sub1 a1 i (i + (1 : ℤ)) ∧ (∀(k1 : ℤ) (k2 : ℤ), ((0 : ℤ) ≤ k1 ∧ k1 < i) ∧ i + (1 : ℤ) ≤ k2 ∧ k2 ≤ i → le (a1[Int.toNat k1]!) (a1[Int.toNat k2]!))) ∧ (∀(j : ℤ) (a2 : List elt), List.length a2 = List.length a1 → ((0 : ℤ) ≤ j ∧ j ≤ i) ∧ List.Perm a a2 ∧ sorted_sub1 a2 (0 : ℤ) j ∧ sorted_sub1 a2 j (i + (1 : ℤ)) ∧ (∀(k1 : ℤ) (k2 : ℤ), ((0 : ℤ) ≤ k1 ∧ k1 < j) ∧ j + (1 : ℤ) ≤ k2 ∧ k2 ≤ i → le (a2[Int.toNat k1]!) (a2[Int.toNat k2]!)) → ((0 : ℤ) < j → ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a2)) ∧ (let o2 : ℤ := j - (1 : ℤ); (0 : ℤ) ≤ o2 ∧ o2 < Int.ofNat (List.length a2))) ∧ (∀(o2 : Bool), (if (0 : ℤ) < j then o2 = (if le (a2[Int.toNat (j - (1 : ℤ))]!) (a2[Int.toNat j]!) then false else true) else o2 = false) → (if o2 = true then let b : ℤ := j - (1 : ℤ); ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a2)) ∧ (let t : elt := a2[Int.toNat j]!; ((0 : ℤ) ≤ b ∧ b < Int.ofNat (List.length a2)) ∧ (let o3 : elt := a2[Int.toNat b]!; ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a2)) ∧ (List.length (List.set a2 (Int.toNat j) o3) = List.length a2 → getElem! (List.set a2 (Int.toNat j) o3) ∘ Int.toNat = Function.update (getElem! a2 ∘ Int.toNat) j o3 → ((0 : ℤ) ≤ b ∧ b < Int.ofNat (List.length (List.set a2 (Int.toNat j) o3))) ∧ (List.length (List.set (List.set a2 (Int.toNat j) o3) (Int.toNat b) t) = List.length (List.set a2 (Int.toNat j) o3) → getElem! (List.set (List.set a2 (Int.toNat j) o3) (Int.toNat b) t) ∘ Int.toNat = Function.update (getElem! (List.set a2 (Int.toNat j) o3) ∘ Int.toNat) b t → ((0 : ℤ) ≤ j ∧ j - (1 : ℤ) < j) ∧ ((0 : ℤ) ≤ j - (1 : ℤ) ∧ j - (1 : ℤ) ≤ i) ∧ List.Perm a (List.set (List.set a2 (Int.toNat j) o3) (Int.toNat b) t) ∧ sorted_sub1 (List.set (List.set a2 (Int.toNat j) o3) (Int.toNat b) t) (0 : ℤ) (j - (1 : ℤ)) ∧ sorted_sub1 (List.set (List.set a2 (Int.toNat j) o3) (Int.toNat b) t) (j - (1 : ℤ)) (i + (1 : ℤ)) ∧ (∀(k1 : ℤ) (k2 : ℤ), ((0 : ℤ) ≤ k1 ∧ k1 < j - (1 : ℤ)) ∧ j - (1 : ℤ) + (1 : ℤ) ≤ k2 ∧ k2 ≤ i → le ((List.set (List.set a2 (Int.toNat j) o3) (Int.toNat b) t)[Int.toNat k1]!) ((List.set (List.set a2 (Int.toNat j) o3) (Int.toNat b) t)[Int.toNat k2]!)))))) else List.Perm a a2 ∧ sorted_sub1 a2 (0 : ℤ) (i + (1 : ℤ)))))) ∧ (List.Perm a a1 ∧ sorted_sub1 a1 (0 : ℤ) (o1 + (1 : ℤ)) → sorted a1 ∧ List.Perm a a1))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → sorted a ∧ List.Perm a a)
  := sorry
end insertion_sort_naive_InsertionSortNaiveGen_sortqtvc
