import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.map.MapInjection
import pearl.verifythis_fm2012_LRS_vcg.lean.verifythis_fm2012_LRS.LCP
open Classical
open Lean4Why3
namespace verifythis_fm2012_LRS_SuffixSort_lcp_same_indexqtvc
noncomputable def lt (a : List ℤ) (x : ℤ) (y : ℤ) := let n : ℤ := Int.ofNat (List.length a); ((0 : ℤ) ≤ x ∧ x ≤ n) ∧ ((0 : ℤ) ≤ y ∧ y ≤ n) ∧ (∃(l : ℤ), LCP.is_common_prefix a x y l ∧ y + l < n ∧ (x + l = n ∨ a[Int.toNat (x + l)]! < a[Int.toNat (y + l)]!))
noncomputable def range (a : List ℤ) := MapInjection.range (getElem! a ∘ Int.toNat) (Int.ofNat (List.length a))
noncomputable def le (a : List ℤ) (x : ℤ) (y : ℤ) := x = y ∨ lt a x y
theorem lcp_same_index'vc (x : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : x ≤ Int.ofNat (List.length a)) : LCP.is_longest_common_prefix a x x (Int.ofNat (List.length a) - x)
  := sorry
end verifythis_fm2012_LRS_SuffixSort_lcp_same_indexqtvc
