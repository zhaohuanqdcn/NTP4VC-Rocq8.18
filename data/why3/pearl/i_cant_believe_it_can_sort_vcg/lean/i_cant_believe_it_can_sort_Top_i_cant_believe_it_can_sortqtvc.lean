import Why3.Base
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
open Classical
open Lean4Why3
namespace i_cant_believe_it_can_sort_Top_i_cant_believe_it_can_sortqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
noncomputable def sorted_sub (a : List elt) (l : ℤ) (u : ℤ) := ∀(i1 : ℤ) (i2 : ℤ), l ≤ i1 ∧ i1 < i2 ∧ i2 < u → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
noncomputable def sorted (a : List elt) := ∀(i1 : ℤ) (i2 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 < Int.ofNat (List.length a) → le (a[Int.toNat i1]!) (a[Int.toNat i2]!)
noncomputable def max_array (a : List elt) (lo : ℤ) (hi : ℤ) (i : ℤ) := ∀(j : ℤ), lo ≤ j ∧ j < hi → le (a[Int.toNat j]!) (a[Int.toNat i]!)
theorem i_cant_believe_it_can_sort'vc (a : List elt) : let n : ℤ := Int.ofNat (List.length a); let o1 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → (List.Perm a a ∧ sorted_sub a (0 : ℤ) ((0 : ℤ) - (1 : ℤ))) ∧ (∀(a1 : List elt), List.length a1 = List.length a → (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ List.Perm a a1 ∧ sorted_sub a1 (0 : ℤ) (i - (1 : ℤ)) ∧ (i = (0 : ℤ) ∨ max_array a1 (0 : ℤ) n (i - (1 : ℤ))) → (let o2 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ o2 + (1 : ℤ) → (List.Perm a a1 ∧ max_array a1 (0 : ℤ) (0 : ℤ) i ∧ (i = (0 : ℤ) ∨ (if (0 : ℤ) < i then max_array a1 (0 : ℤ) n (i - (1 : ℤ)) else max_array a1 (0 : ℤ) n i)) ∧ (if (0 : ℤ) < i then sorted_sub a1 (0 : ℤ) (i - (1 : ℤ)) else sorted_sub a1 (0 : ℤ) i)) ∧ (∀(a2 : List elt), List.length a2 = List.length a1 → (∀(j : ℤ), ((0 : ℤ) ≤ j ∧ j ≤ o2) ∧ List.Perm a a2 ∧ max_array a2 (0 : ℤ) j i ∧ (i = (0 : ℤ) ∨ (if j < i then max_array a2 (0 : ℤ) n (i - (1 : ℤ)) else max_array a2 (0 : ℤ) n i)) ∧ (if j < i then sorted_sub a2 (0 : ℤ) (i - (1 : ℤ)) else sorted_sub a2 (0 : ℤ) i) → ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a2)) ∧ (let o3 : elt := a2[Int.toNat j]!; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a2)) ∧ (let o4 : elt := a2[Int.toNat i]!; if le o4 o3 ∧ ¬o4 = o3 then (((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a2)) ∧ (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a2)) ∧ (∀(a3 : List elt), List.length a3 = List.length a2 → Lean4Why3.arrayExchange a2 a3 i j → List.Perm a a3 ∧ max_array a3 (0 : ℤ) (j + (1 : ℤ)) i ∧ (i = (0 : ℤ) ∨ (if j + (1 : ℤ) < i then max_array a3 (0 : ℤ) n (i - (1 : ℤ)) else max_array a3 (0 : ℤ) n i)) ∧ (if j + (1 : ℤ) < i then sorted_sub a3 (0 : ℤ) (i - (1 : ℤ)) else sorted_sub a3 (0 : ℤ) i)) else List.Perm a a2 ∧ max_array a2 (0 : ℤ) (j + (1 : ℤ)) i ∧ (i = (0 : ℤ) ∨ (if j + (1 : ℤ) < i then max_array a2 (0 : ℤ) n (i - (1 : ℤ)) else max_array a2 (0 : ℤ) n i)) ∧ (if j + (1 : ℤ) < i then sorted_sub a2 (0 : ℤ) (i - (1 : ℤ)) else sorted_sub a2 (0 : ℤ) i)))) ∧ (List.Perm a a2 ∧ max_array a2 (0 : ℤ) (o2 + (1 : ℤ)) i ∧ (i = (0 : ℤ) ∨ (if o2 + (1 : ℤ) < i then max_array a2 (0 : ℤ) n (i - (1 : ℤ)) else max_array a2 (0 : ℤ) n i)) ∧ (if o2 + (1 : ℤ) < i then sorted_sub a2 (0 : ℤ) (i - (1 : ℤ)) else sorted_sub a2 (0 : ℤ) i) → List.Perm a a2 ∧ sorted_sub a2 (0 : ℤ) (i + (1 : ℤ) - (1 : ℤ)) ∧ (i + (1 : ℤ) = (0 : ℤ) ∨ max_array a2 (0 : ℤ) n (i + (1 : ℤ) - (1 : ℤ)))))) ∧ (o2 + (1 : ℤ) < (0 : ℤ) → List.Perm a a1 ∧ sorted_sub a1 (0 : ℤ) (i + (1 : ℤ) - (1 : ℤ)) ∧ (i + (1 : ℤ) = (0 : ℤ) ∨ max_array a1 (0 : ℤ) n (i + (1 : ℤ) - (1 : ℤ)))))) ∧ (List.Perm a a1 ∧ sorted_sub a1 (0 : ℤ) (o1 + (1 : ℤ) - (1 : ℤ)) ∧ (o1 + (1 : ℤ) = (0 : ℤ) ∨ max_array a1 (0 : ℤ) n (o1 + (1 : ℤ) - (1 : ℤ))) → List.Perm a a1 ∧ sorted a1))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → List.Perm a a ∧ sorted a)
  := sorry
end i_cant_believe_it_can_sort_Top_i_cant_believe_it_can_sortqtvc
