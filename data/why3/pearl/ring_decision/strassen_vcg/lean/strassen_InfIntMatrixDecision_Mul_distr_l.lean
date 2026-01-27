import Why3.Base
import Why3.int.Sum
import pearl.ring_decision.lib.lean.strassen.Sum_extended
import pearl.ring_decision.lib.lean.strassen.MaxFun
import pearl.ring_decision.lib.lean.strassen.InfIntMatrix
open Classical
open Lean4Why3
namespace strassen_InfIntMatrixDecision_Mul_distr_l
axiom Assoc (x : ℤ) (y : ℤ) (z : ℤ) : x + y + z = x + (y + z)
axiom Unit_def_l (x : ℤ) : (0 : ℤ) + x = x
axiom Unit_def_r (x : ℤ) : x + (0 : ℤ) = x
axiom Inv_def_l (x : ℤ) : -x + x = (0 : ℤ)
axiom Inv_def_r (x : ℤ) : x + -x = (0 : ℤ)
axiom Comm (x : ℤ) (y : ℤ) : x + y = y + x
axiom Assoc1 (x : ℤ) (y : ℤ) (z : ℤ) : x * y * z = x * (y * z)
axiom Mul_distr_l (x : ℤ) (y : ℤ) (z : ℤ) : x * (y + z) = x * y + x * z
axiom Mul_distr_r (y : ℤ) (z : ℤ) (x : ℤ) : (y + z) * x = y * x + z * x
axiom Comm1 (x : ℤ) (y : ℤ) : x * y = y * x
axiom Unitary (x : ℤ) : (1 : ℤ) * x = x
axiom NonTrivialRing : ¬(0 : ℤ) = (1 : ℤ)
theorem Mul_distr_l1 (x : InfIntMatrix.mat) (y : InfIntMatrix.mat) (z : InfIntMatrix.mat) : InfIntMatrix.mul x (InfIntMatrix.add y z) = InfIntMatrix.add (InfIntMatrix.mul x y) (InfIntMatrix.mul x z)
  := sorry
end strassen_InfIntMatrixDecision_Mul_distr_l
