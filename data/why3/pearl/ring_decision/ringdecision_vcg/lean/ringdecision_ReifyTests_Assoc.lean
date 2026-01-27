import Why3.Base
open Classical
open Lean4Why3
namespace ringdecision_ReifyTests_Assoc
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
theorem Assoc2 (x : ℤ) (y : ℤ) (z : ℤ) : x + y + z = x + (y + z)
  := sorry
end ringdecision_ReifyTests_Assoc
