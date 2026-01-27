import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.MapEq
import Why3.map.MapExchange
import Why3.map.MapPermut
import Why3.map.MapInjection
import pearl.verifythis_fm2012_LRS_vcg.lean.verifythis_fm2012_LRS.LCP
import pearl.verifythis_fm2012_LRS_vcg.lean.verifythis_fm2012_LRS.SuffixSort
import pearl.verifythis_fm2012_LRS_vcg.lean.verifythis_fm2012_LRS.SuffixArray
open Classical
open Lean4Why3
namespace verifythis_fm2012_LRS_LRS_lcp_symqtvc
theorem lcp_sym'vc (x : ℤ) (a : List ℤ) (y : ℤ) (l : ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : x ≤ Int.ofNat (List.length a)) (fact2 : (0 : ℤ) ≤ y) (fact3 : y ≤ Int.ofNat (List.length a)) (fact4 : LCP.is_longest_common_prefix a x y l) : LCP.is_longest_common_prefix a y x l
  := sorry
end verifythis_fm2012_LRS_LRS_lcp_symqtvc
