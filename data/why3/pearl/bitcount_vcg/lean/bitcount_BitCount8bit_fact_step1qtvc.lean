import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.int.NumOf
open Classical
open Lean4Why3
namespace bitcount_BitCount8bit_fact_step1qtvc
noncomputable def nth_as_bv (a : BitVec 8) (i : BitVec 8) := if a[BitVec.toNat i]! = true then (1 : BitVec 8) else (0 : BitVec 8)
noncomputable def nth_as_int (a : BitVec 8) (i : ℤ) := if a[Int.toNat i]! = true then (1 : ℤ) else (0 : ℤ)
axiom nth_closure : BitVec 8 -> ℤ -> Bool
axiom nth_closure_def (y : BitVec 8) (y1 : ℤ) : nth_closure y y1 = y[Int.toNat y1]!
theorem step1'vc (i : ℤ) (n : BitVec 8) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (4 : ℤ)) : BitVec.toUInt ((n - ((n >>> BitVec.toNat (1 : BitVec 8)) &&& (85 : BitVec 8)) >>> Int.toNat ((2 : ℤ) * i)) &&& (3 : BitVec 8)) = NumOf.numof (nth_closure n) ((2 : ℤ) * i) ((2 : ℤ) * i + (2 : ℤ)) ∧ (n - ((n >>> BitVec.toNat (1 : BitVec 8)) &&& (85 : BitVec 8)) >>> Int.toNat ((2 : ℤ) * i)) &&& (3 : BitVec 8) ≤ (2 : BitVec 8)
  := sorry
end bitcount_BitCount8bit_fact_step1qtvc
