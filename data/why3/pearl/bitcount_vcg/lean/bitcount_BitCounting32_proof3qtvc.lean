import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.int.NumOf
open Classical
open Lean4Why3
namespace bitcount_BitCounting32_proof3qtvc
noncomputable def step0 (n : BitVec 32) (x1 : BitVec 32) := x1 = n - ((n >>> BitVec.toNat (1 : BitVec 32)) &&& (1431655765 : BitVec 32))
noncomputable def step1 (x1 : BitVec 32) (x2 : BitVec 32) := x2 = (x1 &&& (858993459 : BitVec 32)) + ((x1 >>> BitVec.toNat (2 : BitVec 32)) &&& (858993459 : BitVec 32))
noncomputable def step2 (x2 : BitVec 32) (x3 : BitVec 32) := x3 = x2 + (x2 >>> BitVec.toNat (4 : BitVec 32)) &&& (252645135 : BitVec 32)
noncomputable def step3 (x3 : BitVec 32) (x4 : BitVec 32) := x4 = x3 + (x3 >>> BitVec.toNat (8 : BitVec 32))
axiom nth_closure : BitVec 32 -> ℤ -> Bool
axiom nth_closure_def (y : BitVec 32) (y1 : ℤ) : nth_closure y y1 = y[Int.toNat y1]!
theorem proof3'vc (i : ℤ) (n : BitVec 32) (x1 : BitVec 32) (x2 : BitVec 32) (x3 : BitVec 32) (x4 : BitVec 32) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (2 : ℤ)) (fact2 : step0 n x1) (fact3 : step1 x1 x2) (fact4 : step2 x2 x3) (fact5 : step3 x3 x4) : BitVec.toUInt ((x4 >>> Int.toNat ((16 : ℤ) * i)) &&& (31 : BitVec 32)) = NumOf.numof (nth_closure n) ((16 : ℤ) * i) ((16 : ℤ) * i + (16 : ℤ))
  := sorry
end bitcount_BitCounting32_proof3qtvc
