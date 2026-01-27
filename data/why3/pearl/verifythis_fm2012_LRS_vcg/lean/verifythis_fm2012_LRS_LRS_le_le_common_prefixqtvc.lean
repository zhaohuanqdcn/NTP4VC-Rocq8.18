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
namespace verifythis_fm2012_LRS_LRS_le_le_common_prefixqtvc
theorem le_le_common_prefix'vc (a : List ℤ) (x : ℤ) (y : ℤ) (z : ℤ) (l : ℤ) (fact0 : SuffixSort.le a x y) (fact1 : SuffixSort.le a y z) (fact2 : LCP.is_common_prefix a x z l) : LCP.is_common_prefix a y z l
  := sorry
end verifythis_fm2012_LRS_LRS_le_le_common_prefixqtvc
