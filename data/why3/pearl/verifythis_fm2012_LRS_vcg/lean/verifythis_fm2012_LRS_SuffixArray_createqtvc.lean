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
namespace verifythis_fm2012_LRS_SuffixArray_createqtvc
noncomputable def permutation (m : ℤ -> ℤ) (u : ℤ) := MapInjection.range m u ∧ MapInjection.injective m u
axiom suffixArray : Type
axiom inhabited_axiom_suffixArray : Inhabited suffixArray
attribute [instance] inhabited_axiom_suffixArray
axiom values : suffixArray -> List ℤ
axiom suffixes : suffixArray -> List ℤ
axiom suffixArray'invariant (self : suffixArray) : List.length (values self) = List.length (suffixes self) ∧ permutation (getElem! (suffixes self) ∘ Int.toNat) (Int.ofNat (List.length (suffixes self))) ∧ SuffixSort.sorted (values self) (suffixes self)
noncomputable def suffixArray'eq (a : suffixArray) (b : suffixArray) := values a = values b ∧ suffixes a = suffixes b
axiom suffixArray'inj (a : suffixArray) (b : suffixArray) (fact0 : suffixArray'eq a b) : a = b
theorem create'vc (a : List ℤ) : let n : ℤ := Int.ofNat (List.length a); (0 : ℤ) ≤ n ∧ (∀(suf : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → suf[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length suf) = n → (let o1 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → suf[Int.toNat j]! = j) ∧ (∀(suf1 : List ℤ), List.length suf1 = List.length suf → (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → suf1[Int.toNat j]! = j) → ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length suf1)) ∧ (List.length (List.set suf1 (Int.toNat i) i) = List.length suf1 → getElem! (List.set suf1 (Int.toNat i) i) ∘ Int.toNat = Function.update (getElem! suf1 ∘ Int.toNat) i i → (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i + (1 : ℤ) → (List.set suf1 (Int.toNat i) i)[Int.toNat j]! = j))) ∧ ((∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < o1 + (1 : ℤ) → suf1[Int.toNat j]! = j) → (List.length suf1 = List.length a ∧ SuffixSort.range suf1) ∧ (∀(suf2 : List ℤ), List.length suf2 = List.length suf1 → SuffixSort.sorted a suf2 ∧ List.Perm suf1 suf2 → (List.length a = List.length suf2 ∧ permutation (getElem! suf2 ∘ Int.toNat) (Int.ofNat (List.length suf2)) ∧ SuffixSort.sorted a suf2) ∧ (∀(result : suffixArray), values result = a ∧ suffixes result = suf2 → values result = a))))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → (List.length suf = List.length a ∧ SuffixSort.range suf) ∧ (∀(suf1 : List ℤ), List.length suf1 = List.length suf → SuffixSort.sorted a suf1 ∧ List.Perm suf suf1 → (List.length a = List.length suf1 ∧ permutation (getElem! suf1 ∘ Int.toNat) (Int.ofNat (List.length suf1)) ∧ SuffixSort.sorted a suf1) ∧ (∀(result : suffixArray), values result = a ∧ suffixes result = suf1 → values result = a)))))
  := sorry
end verifythis_fm2012_LRS_SuffixArray_createqtvc
