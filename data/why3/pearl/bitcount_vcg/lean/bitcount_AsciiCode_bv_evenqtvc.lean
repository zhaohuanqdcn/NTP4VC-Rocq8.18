import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import pearl.bitcount_vcg.lean.bitcount.BitCounting32
import Why3.mach.bv.BVCheck32
open Classical
open Lean4Why3
namespace bitcount_AsciiCode_bv_evenqtvc
noncomputable def validAscii (b : BitVec 32) := Even (BitCounting32.count_logic b)
theorem bv_even'vc (b : BitVec 32) : Even (BitVec.toUInt b) = (¬b[(0 : ℕ)]! = true)
  := sorry
end bitcount_AsciiCode_bv_evenqtvc
