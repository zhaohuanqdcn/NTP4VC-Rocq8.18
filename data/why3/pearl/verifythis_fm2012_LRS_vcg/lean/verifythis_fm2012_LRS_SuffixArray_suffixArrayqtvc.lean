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
namespace verifythis_fm2012_LRS_SuffixArray_suffixArrayqtvc
noncomputable def permutation (m : ℤ -> ℤ) (u : ℤ) := MapInjection.range m u ∧ MapInjection.injective m u
theorem suffixArray'vc : (0 : ℤ) ≤ (0 : ℤ) ∧ (∀(o1 : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → o1[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length o1) = (0 : ℤ) → (0 : ℤ) ≤ (0 : ℤ) ∧ (∀(o2 : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → o2[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length o2) = (0 : ℤ) → List.length o2 = List.length o1 ∧ permutation (getElem! o1 ∘ Int.toNat) (Int.ofNat (List.length o1)) ∧ SuffixSort.sorted o2 o1))
  := sorry
end verifythis_fm2012_LRS_SuffixArray_suffixArrayqtvc
