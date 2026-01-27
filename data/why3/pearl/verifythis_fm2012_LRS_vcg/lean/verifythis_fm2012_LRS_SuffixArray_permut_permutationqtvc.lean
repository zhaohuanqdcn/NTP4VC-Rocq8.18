import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.map.MapInjection
import pearl.verifythis_fm2012_LRS_vcg.lean.verifythis_fm2012_LRS.LCP
import pearl.verifythis_fm2012_LRS_vcg.lean.verifythis_fm2012_LRS.SuffixSort
open Classical
open Lean4Why3
namespace verifythis_fm2012_LRS_SuffixArray_permut_permutationqtvc
noncomputable def permutation (m : ℤ -> ℤ) (u : ℤ) := MapInjection.range m u ∧ MapInjection.injective m u
axiom suffixArray : Type
axiom inhabited_axiom_suffixArray : Inhabited suffixArray
attribute [instance] inhabited_axiom_suffixArray
axiom values : suffixArray -> List ℤ
axiom suffixes : suffixArray -> List ℤ
axiom suffixArray'invariant (self : suffixArray) : List.length (values self) = List.length (suffixes self) ∧ permutation (getElem! (suffixes self) ∘ Int.toNat) (Int.ofNat (List.length (suffixes self))) ∧ SuffixSort.sorted (values self) (suffixes self)
noncomputable def suffixArray'eq (a : suffixArray) (b : suffixArray) := values a = values b ∧ suffixes a = suffixes b
axiom suffixArray'inj (a : suffixArray) (b : suffixArray) (fact0 : suffixArray'eq a b) : a = b
theorem permut_permutation'vc (a1 : List ℤ) (a2 : List ℤ) (fact0 : List.Perm a1 a2) (fact1 : permutation (getElem! a1 ∘ Int.toNat) (Int.ofNat (List.length a1))) : permutation (getElem! a2 ∘ Int.toNat) (Int.ofNat (List.length a2))
  := sorry
end verifythis_fm2012_LRS_SuffixArray_permut_permutationqtvc
