import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import pearl.bitcount_vcg.lean.bitcount.BitCounting32
import Why3.mach.bv.BVCheck32
open Classical
open Lean4Why3
namespace bitcount_Hamming_symmetricqtvc
noncomputable def nth_diff (a : BitVec 32) (b : BitVec 32) (i : ℤ) := ¬a[Int.toNat i]! = b[Int.toNat i]!
axiom nth_diff_closure : BitVec 32 -> BitVec 32 -> ℤ -> Bool
axiom nth_diff_closure_def (y : BitVec 32) (y1 : BitVec 32) (y2 : ℤ) : (nth_diff_closure y y1 y2 = true) = nth_diff y y1 y2
noncomputable def hammingD_logic (a : BitVec 32) (b : BitVec 32) := NumOf.numof (nth_diff_closure a b) (0 : ℤ) (32 : ℤ)
theorem symmetric'vc (a : BitVec 32) (b : BitVec 32) : hammingD_logic a b = hammingD_logic b a
  := sorry
end bitcount_Hamming_symmetricqtvc
