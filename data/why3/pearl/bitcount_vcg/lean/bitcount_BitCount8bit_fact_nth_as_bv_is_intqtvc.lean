import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.int.NumOf
open Classical
open Lean4Why3
namespace bitcount_BitCount8bit_fact_nth_as_bv_is_intqtvc
noncomputable def nth_as_bv (a : BitVec 8) (i : BitVec 8) := if a[BitVec.toNat i]! = true then (1 : BitVec 8) else (0 : BitVec 8)
noncomputable def nth_as_int (a : BitVec 8) (i : ℤ) := if a[Int.toNat i]! = true then (1 : ℤ) else (0 : ℤ)
theorem nth_as_bv_is_int'vc (a : BitVec 8) (i : BitVec 8) : BitVec.toUInt (nth_as_bv a i) = nth_as_int a (BitVec.toUInt i)
  := sorry
end bitcount_BitCount8bit_fact_nth_as_bv_is_intqtvc
