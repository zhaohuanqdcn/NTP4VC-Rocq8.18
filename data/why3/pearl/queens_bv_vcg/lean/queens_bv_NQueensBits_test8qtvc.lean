import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import pearl.queens_bv_vcg.lean.queens_bv.S
import pearl.queens_bv_vcg.lean.queens_bv.Solution
import pearl.queens_bv_vcg.lean.queens_bv.BitsSpec
open Classical
open Lean4Why3
namespace queens_bv_NQueensBits_test8qtvc
theorem test8'vc (fact0 : Solution.n = (8 : ℤ)) : let o1 : BitVec 32 := BitVec.ofInt 32 (8 : ℤ); BitVec.toUInt o1 = Solution.n ∧ o1 ≤ w32_size_bv
  := sorry
end queens_bv_NQueensBits_test8qtvc
