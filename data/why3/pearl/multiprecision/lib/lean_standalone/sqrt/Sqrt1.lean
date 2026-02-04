namespace Fxp
noncomputable def pow2 (k : ℤ) := HPow.hPow (2 : ℝ) (Int.to_Real k)
noncomputable def trunc_at (x : ℝ) (k : ℤ) := Int.to_Real (Truncate.floor (x * pow2 (-k))) * pow2 k
axiom fxp : Type
axiom inhabited_axiom_fxp : Inhabited fxp
attribute [instance] inhabited_axiom_fxp
axiom ival : fxp -> BitVec 64
axiom rval : fxp -> ℝ
axiom iexp : fxp -> ℤ
axiom fxp'invariant (self : fxp) : rval self = trunc_at (rval self) (iexp self) ∧ BitVec.toUInt (ival self) = Truncate.floor (rval self * pow2 (-iexp self)) % ((18446744073709551615 : ℤ) + (1 : ℤ))
noncomputable def fxp'eq (a : fxp) (b : fxp) := ival a = ival b ∧ rval a = rval b ∧ iexp a = iexp b
axiom fxp'inj (a : fxp) (b : fxp) (fact0 : fxp'eq a b) : a = b
end Fxp
namespace Sqrt1
end Sqrt1
