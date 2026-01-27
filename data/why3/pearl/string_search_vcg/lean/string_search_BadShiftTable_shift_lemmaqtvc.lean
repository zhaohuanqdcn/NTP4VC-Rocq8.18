import Why3.Base
import pearl.string_search_vcg.lean.string_search.Spec
import pearl.string_search_vcg.lean.string_search.Occurs
import Why3.ocaml.Exceptions
open Classical
open Lean4Why3
namespace string_search_BadShiftTable_shift_lemmaqtvc
axiom t : Type -> Type
axiom inhabited_axiom_t {χ : Type} [Inhabited χ] : Inhabited (t χ)
attribute [instance] inhabited_axiom_t
axiom to_fmap :  {χ : Type} -> [Inhabited χ] -> t χ -> Finmap (fun (_ : (BitVec 8)) => χ)
axiom bad_shift_table : Type
axiom inhabited_axiom_bad_shift_table : Inhabited bad_shift_table
attribute [instance] inhabited_axiom_bad_shift_table
axiom pat : bad_shift_table -> List (BitVec 8)
axiom sht : bad_shift_table -> t (BitVec 63)
axiom bad_shift_table'invariant (self : bad_shift_table) : (∀(j : ℤ) (c : BitVec 8), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length (pat self)) → c = (pat self)[Int.toNat j]! → c ∈ to_fmap (sht self)) ∧ (∀(c : BitVec 8), c ∈ to_fmap (sht self) → (1 : ℤ) ≤ BitVec.toInt (Finmap.lookup! (to_fmap (sht self)) c) ∧ BitVec.toInt (Finmap.lookup! (to_fmap (sht self)) c) ≤ Int.ofNat (List.length (pat self)) + (1 : ℤ)) ∧ (∀(c : BitVec 8), c ∈ to_fmap (sht self) → (∀(j : ℤ), (1 : ℤ) ≤ j ∧ j < BitVec.toInt (Finmap.lookup! (to_fmap (sht self)) c) → ¬(pat self)[Int.toNat (Int.ofNat (List.length (pat self)) - j)]! = c))
noncomputable def bad_shift_table'eq (a : bad_shift_table) (b : bad_shift_table) := pat a = pat b ∧ sht a = sht b
axiom bad_shift_table'inj (a : bad_shift_table) (b : bad_shift_table) (fact0 : bad_shift_table'eq a b) : a = b
theorem shift_lemma'vc (i : BitVec 63) (text : List (BitVec 8)) (bst : bad_shift_table) (j : ℤ) (fact0 : (0 : ℤ) ≤ BitVec.toInt i) (fact1 : BitVec.toInt i ≤ Int.ofNat (List.length text) - Int.ofNat (List.length (pat bst))) (fact2 : text[Int.toNat (BitVec.toInt i + Int.ofNat (List.length (pat bst)))]! ∈ to_fmap (sht bst)) (fact3 : BitVec.toInt i < j) (fact4 : j < BitVec.toInt i + BitVec.toInt (Option.the (Finmap.lookup (text[Int.toNat (BitVec.toInt i + Int.ofNat (List.length (pat bst)))]!) (to_fmap (sht bst))))) (fact5 : j ≤ Int.ofNat (List.length text) - Int.ofNat (List.length (pat bst))) : ¬List.drop (Int.toNat j) (List.take (List.length (pat bst) - Int.toNat j) text) = pat bst
  := sorry
end string_search_BadShiftTable_shift_lemmaqtvc
