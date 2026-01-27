import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import Why3.map.MapEq
import Why3.mach.c.C
import Why3.mach.int.Unsigned
import pearl.multiprecision.lib.lean.types.Config
import pearl.multiprecision.lib.lean.types.Types
import pearl.multiprecision.lib.lean.types.Int32Eq
import pearl.multiprecision.lib.lean.types.UInt64Eq
import pearl.multiprecision.lib.lean.lemmas.Lemmas
import pearl.multiprecision.lib.lean.compare.Compare
import pearl.multiprecision.lib.lean.valuation.Valuation
import pearl.multiprecision.lib.lean.util.Util
import pearl.multiprecision.lib.lean.ptralias.Alias
import pearl.multiprecision.lib.lean.util.UtilOld
import pearl.multiprecision.lib.lean.add.Add
import pearl.multiprecision.lib.lean.add.AddOld
import pearl.multiprecision.lib.lean.sub.SubOld
import pearl.multiprecision.lib.lean.mul.Mul
import pearl.multiprecision.lib.lean.mul.Mul_basecase
import pearl.multiprecision.lib.lean.logical.LogicalUtil
import pearl.multiprecision.lib.lean.logical.Logical
import pearl.multiprecision.lib.lean.logical.LogicalOld
import pearl.multiprecision.lib.lean.div.Div
import pearl.multiprecision.lib.lean.toom.Toom
import pearl.multiprecision.lib.lean.add_1.Add_1
import pearl.multiprecision.lib.lean.sub_1.Sub_1
open Classical
open Lean4Why3
namespace powm_Powm_valueb_monqtvc
noncomputable def redc (ur : ℤ) (u : ℤ) (n : ℤ) (m : ℤ) := ur % m = HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat n) * u % m
noncomputable def valueb (p : C.ptr (BitVec 64)) (nbits : ℤ) := if nbits < (0 : ℤ) then (0 : ℤ) else let i : ℤ := nbits / (64 : ℤ); Lemmas.value p i + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat i) * (BitVec.toUInt (C.pelts p (C.offset p + i)) % HPow.hPow (2 : ℤ) (Int.toNat (nbits - (64 : ℤ) * i)))
theorem valueb_mon'vc (bi1 : BitVec 32) (bi2 : BitVec 32) (p : C.ptr (BitVec 64)) (pn : BitVec 32) (fact0 : (0 : ℤ) ≤ BitVec.toInt bi1) (fact1 : BitVec.toInt bi1 ≤ BitVec.toInt bi2) (fact2 : C.valid p (BitVec.toInt pn)) (fact3 : (BitVec.toInt bi2 + (63 : ℤ)) / (64 : ℤ) ≤ BitVec.toInt pn) : valueb p (BitVec.toInt bi1) ≤ valueb p (BitVec.toInt bi2)
  := sorry
end powm_Powm_valueb_monqtvc
