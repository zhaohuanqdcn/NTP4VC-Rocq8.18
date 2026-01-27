import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
open Classical
open Lean4Why3
namespace space_saving_Top_incrementqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom dummy : elt
axiom minimum : List ℤ -> ℤ
axiom minimum'spec'0 (a : List ℤ) (fact0 : (0 : ℤ) < Int.ofNat (List.length a)) : (0 : ℤ) ≤ minimum a ∧ minimum a < Int.ofNat (List.length a)
axiom minimum'spec (a : List ℤ) (i : ℤ) (fact0 : (0 : ℤ) < Int.ofNat (List.length a)) (fact1 : (0 : ℤ) ≤ i) (fact2 : i < Int.ofNat (List.length a)) : a[Int.toNat (minimum a)]! ≤ a[Int.toNat i]!
noncomputable def occurs (v : elt) (a : List elt) := ∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ v = a[Int.toNat i]!
theorem increment'vc (i : ℤ) (c : List ℤ) (n : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < Int.ofNat (List.length c)) (fact2 : List.sum (List.drop (0 : ℕ) (List.take (List.length c - (0 : ℕ)) c)) = n - (1 : ℤ)) : (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length c) ∧ (let o1 : ℤ := getElem! c (Int.toNat i) + (1 : ℤ); ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length c)) ∧ (List.length (List.set c (Int.toNat i) o1) = List.length c → getElem! (List.set c (Int.toNat i) o1) ∘ Int.toNat = Function.update (getElem! c ∘ Int.toNat) i o1 → (List.set c (Int.toNat i) o1)[Int.toNat i]! = getElem! c (Int.toNat i) + (1 : ℤ) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length c) → ¬j = i → (List.set c (Int.toNat i) o1)[Int.toNat j]! = getElem! c (Int.toNat j)) ∧ List.sum (List.drop (0 : ℕ) (List.take (List.length c - (0 : ℕ)) (List.set c (Int.toNat i) o1))) = n))
  := sorry
end space_saving_Top_incrementqtvc
