import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.int.NumOf
open Classical
open Lean4Why3
namespace bitcount_BitCounting32_proof0qtvc
noncomputable def step0 (n : BitVec 32) (x1 : BitVec 32) := x1 = n - ((n >>> BitVec.toNat (1 : BitVec 32)) &&& (1431655765 : BitVec 32))
axiom nth_closure : BitVec 32 -> ℤ -> Bool
axiom nth_closure_def (y : BitVec 32) (y1 : ℤ) : nth_closure y y1 = y[Int.toNat y1]!
theorem proof0'vc (i : ℤ) (n : BitVec 32) (x1 : BitVec 32) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (16 : ℤ)) (fact2 : step0 n x1) : BitVec.toUInt ((x1 >>> Int.toNat ((2 : ℤ) * i)) &&& (3 : BitVec 32)) = NumOf.numof (nth_closure n) ((2 : ℤ) * i) ((2 : ℤ) * i + (2 : ℤ))
  := sorry
end bitcount_BitCounting32_proof0qtvc
