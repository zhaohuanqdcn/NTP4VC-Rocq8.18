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
namespace verifythis_fm2012_LRS_SuffixArray_lcpqtvc
noncomputable def permutation (m : ℤ -> ℤ) (u : ℤ) := MapInjection.range m u ∧ MapInjection.injective m u
axiom suffixArray : Type
axiom inhabited_axiom_suffixArray : Inhabited suffixArray
attribute [instance] inhabited_axiom_suffixArray
axiom values : suffixArray -> List ℤ
axiom suffixes : suffixArray -> List ℤ
axiom suffixArray'invariant (self : suffixArray) : List.length (values self) = List.length (suffixes self) ∧ permutation (getElem! (suffixes self) ∘ Int.toNat) (Int.ofNat (List.length (suffixes self))) ∧ SuffixSort.sorted (values self) (suffixes self)
noncomputable def suffixArray'eq (a : suffixArray) (b : suffixArray) := values a = values b ∧ suffixes a = suffixes b
axiom suffixArray'inj (a : suffixArray) (b : suffixArray) (fact0 : suffixArray'eq a b) : a = b
theorem lcp'vc (i : ℤ) (s : suffixArray) (fact0 : (0 : ℤ) < i) (fact1 : i < Int.ofNat (List.length (values s))) : let o1 : ℤ := i - (1 : ℤ); let o2 : List ℤ := suffixes s; ((0 : ℤ) ≤ o1 ∧ o1 < Int.ofNat (List.length o2)) ∧ (let o3 : ℤ := o2[Int.toNat o1]!; let o4 : List ℤ := suffixes s; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o4)) ∧ (let o5 : ℤ := o4[Int.toNat i]!; let o6 : List ℤ := values s; (((0 : ℤ) ≤ o5 ∧ o5 ≤ Int.ofNat (List.length o6)) ∧ (0 : ℤ) ≤ o3 ∧ o3 ≤ Int.ofNat (List.length o6)) ∧ (∀(result : ℤ), LCP.is_longest_common_prefix o6 o5 o3 result → LCP.is_longest_common_prefix (values s) ((suffixes s)[Int.toNat (i - (1 : ℤ))]!) ((suffixes s)[Int.toNat i]!) result)))
  := sorry
end verifythis_fm2012_LRS_SuffixArray_lcpqtvc
