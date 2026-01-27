import Why3.Base
import pearl.string_search_vcg.lean.string_search.Spec
import pearl.string_search_vcg.lean.string_search.Occurs
import Why3.ocaml.Exceptions
open Classical
open Lean4Why3
namespace string_search_BadShiftTable_bad_shift_tableqtvc
axiom t : Type -> Type
axiom inhabited_axiom_t {χ : Type} [Inhabited χ] : Inhabited (t χ)
attribute [instance] inhabited_axiom_t
axiom to_fmap :  {χ : Type} -> [Inhabited χ] -> t χ -> Finmap (fun (_ : (BitVec 8)) => χ)
theorem bad_shift_table'vc (o1 : t (BitVec 63)) (fact0 : to_fmap o1 = (∅ : Finmap (fun (_ : (BitVec 8)) => BitVec 63))) : (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length ([] : List (BitVec 8))) → ([] : List (BitVec 8))[Int.toNat j]! ∈ to_fmap o1) ∧ ((∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length ([] : List (BitVec 8))) → ([] : List (BitVec 8))[Int.toNat j]! ∈ to_fmap o1) → (∀(c : BitVec 8), c ∈ to_fmap o1 → (1 : ℤ) ≤ BitVec.toInt (Finmap.lookup! (to_fmap o1) c) ∧ BitVec.toInt (Finmap.lookup! (to_fmap o1) c) ≤ Int.ofNat (List.length ([] : List (BitVec 8))) + (1 : ℤ)) ∧ ((∀(c : BitVec 8), c ∈ to_fmap o1 → (1 : ℤ) ≤ BitVec.toInt (Finmap.lookup! (to_fmap o1) c) ∧ BitVec.toInt (Finmap.lookup! (to_fmap o1) c) ≤ Int.ofNat (List.length ([] : List (BitVec 8))) + (1 : ℤ)) → (∀(c : BitVec 8), c ∈ to_fmap o1 → (∀(j : ℤ), (1 : ℤ) ≤ j ∧ j < BitVec.toInt (Finmap.lookup! (to_fmap o1) c) → ¬([] : List (BitVec 8))[Int.toNat (Int.ofNat (List.length ([] : List (BitVec 8))) - j)]! = c))))
  := sorry
end string_search_BadShiftTable_bad_shift_tableqtvc
