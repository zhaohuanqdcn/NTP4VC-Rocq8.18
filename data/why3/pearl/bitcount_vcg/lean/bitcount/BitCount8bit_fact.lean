import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.int.NumOf
open Classical
open Lean4Why3
namespace BitCount8bit_fact
noncomputable def nth_as_bv (a : BitVec 8) (i : BitVec 8) := if a[BitVec.toNat i]! = true then (1 : BitVec 8) else (0 : BitVec 8)
noncomputable def nth_as_int (a : BitVec 8) (i : ℤ) := if a[Int.toNat i]! = true then (1 : ℤ) else (0 : ℤ)
end BitCount8bit_fact
