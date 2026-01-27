import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace insertion_sort_InsertionSortGen_insertion_sortqtvc
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
theorem insertion_sort'vc (a : List elt) : let o1 : ℤ := Int.ofNat (List.length a) - (1 : ℤ); ((1 : ℤ) ≤ o1 + (1 : ℤ) → (sorted_sub1 a (0 : ℤ) (1 : ℤ) ∧ List.Perm a a) ∧ (∀(a1 : List elt), List.length a1 = List.length a → (∀(i : ℤ), ((1 : ℤ) ≤ i ∧ i ≤ o1) ∧ sorted_sub1 a1 (0 : ℤ) i ∧ List.Perm a a1 → ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a1)) ∧ (let v : elt := a1[Int.toNat i]!; (((0 : ℤ) ≤ i ∧ i ≤ i) ∧ List.Perm a (List.set a1 (Int.toNat i) v) ∧ (∀(k1 : ℤ) (k2 : ℤ), (0 : ℤ) ≤ k1 ∧ k1 ≤ k2 ∧ k2 ≤ i → ¬k1 = i → ¬k2 = i → le (a1[Int.toNat k1]!) (a1[Int.toNat k2]!)) ∧ (∀(k : ℤ), i + (1 : ℤ) ≤ k ∧ k ≤ i → le v (a1[Int.toNat k]!))) ∧ (∀(j : ℤ) (a2 : List elt), List.length a2 = List.length a1 → ((0 : ℤ) ≤ j ∧ j ≤ i) ∧ List.Perm a (List.set a2 (Int.toNat j) v) ∧ (∀(k1 : ℤ) (k2 : ℤ), (0 : ℤ) ≤ k1 ∧ k1 ≤ k2 ∧ k2 ≤ i → ¬k1 = j → ¬k2 = j → le (a2[Int.toNat k1]!) (a2[Int.toNat k2]!)) ∧ (∀(k : ℤ), j + (1 : ℤ) ≤ k ∧ k ≤ i → le v (a2[Int.toNat k]!)) → ((0 : ℤ) < j → (let o2 : ℤ := j - (1 : ℤ); (0 : ℤ) ≤ o2 ∧ o2 < Int.ofNat (List.length a2))) ∧ (∀(o2 : Bool), (if (0 : ℤ) < j then o2 = (if le (a2[Int.toNat (j - (1 : ℤ))]!) v then false else true) else o2 = false) → (if o2 = true then let o3 : ℤ := j - (1 : ℤ); ((0 : ℤ) ≤ o3 ∧ o3 < Int.ofNat (List.length a2)) ∧ (let o4 : elt := a2[Int.toNat o3]!; ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a2)) ∧ (List.length (List.set a2 (Int.toNat j) o4) = List.length a2 → getElem! (List.set a2 (Int.toNat j) o4) ∘ Int.toNat = Function.update (getElem! a2 ∘ Int.toNat) j o4 → ((0 : ℤ) ≤ j ∧ j - (1 : ℤ) < j) ∧ ((0 : ℤ) ≤ j - (1 : ℤ) ∧ j - (1 : ℤ) ≤ i) ∧ List.Perm a (List.set (List.set a2 (Int.toNat j) o4) (Int.toNat (j - (1 : ℤ))) v) ∧ (∀(k1 : ℤ) (k2 : ℤ), (0 : ℤ) ≤ k1 ∧ k1 ≤ k2 ∧ k2 ≤ i → ¬k1 = j - (1 : ℤ) → ¬k2 = j - (1 : ℤ) → le ((List.set a2 (Int.toNat j) o4)[Int.toNat k1]!) ((List.set a2 (Int.toNat j) o4)[Int.toNat k2]!)) ∧ (∀(k : ℤ), j - (1 : ℤ) + (1 : ℤ) ≤ k ∧ k ≤ i → le v ((List.set a2 (Int.toNat j) o4)[Int.toNat k]!)))) else ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a2)) ∧ (List.length (List.set a2 (Int.toNat j) v) = List.length a2 → getElem! (List.set a2 (Int.toNat j) v) ∘ Int.toNat = Function.update (getElem! a2 ∘ Int.toNat) j v → sorted_sub1 (List.set a2 (Int.toNat j) v) (0 : ℤ) (i + (1 : ℤ)) ∧ List.Perm a (List.set a2 (Int.toNat j) v))))))) ∧ (sorted_sub1 a1 (0 : ℤ) (o1 + (1 : ℤ)) ∧ List.Perm a a1 → sorted a1 ∧ List.Perm a a1))) ∧ (o1 + (1 : ℤ) < (1 : ℤ) → sorted a ∧ List.Perm a a)
  := sorry
end insertion_sort_InsertionSortGen_insertion_sortqtvc
