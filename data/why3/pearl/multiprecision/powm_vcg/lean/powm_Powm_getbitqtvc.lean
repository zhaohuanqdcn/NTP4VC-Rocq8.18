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
namespace powm_Powm_getbitqtvc
noncomputable def redc (ur : ℤ) (u : ℤ) (n : ℤ) (m : ℤ) := ur % m = HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat n) * u % m
noncomputable def valueb (p : C.ptr (BitVec 64)) (nbits : ℤ) := if nbits < (0 : ℤ) then (0 : ℤ) else let i : ℤ := nbits / (64 : ℤ); Lemmas.value p i + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat i) * (BitVec.toUInt (C.pelts p (C.offset p + i)) % HPow.hPow (2 : ℤ) (Int.toNat (nbits - (64 : ℤ) * i)))
theorem getbit'vc (p : C.ptr (BitVec 64)) (pn : BitVec 32) (bi : BitVec 32) (fact0 : C.valid p (BitVec.toInt pn)) (fact1 : (1 : ℤ) ≤ BitVec.toInt bi) (fact2 : (BitVec.toInt bi + (63 : ℤ)) / (64 : ℤ) ≤ BitVec.toInt pn) : int'32_in_bounds (BitVec.toInt bi - (1 : ℤ)) ∧ (∀(o1 : BitVec 32), BitVec.toInt o1 = BitVec.toInt bi - (1 : ℤ) → (¬(64 : ℤ) = (0 : ℤ) ∧ int'32_in_bounds (Int.tdiv (BitVec.toInt o1) (64 : ℤ))) ∧ (∀(i : BitVec 32), BitVec.toInt i = Int.tdiv (BitVec.toInt o1) (64 : ℤ) → int'32_in_bounds (BitVec.toInt bi - (1 : ℤ)) ∧ (∀(o2 : BitVec 32), BitVec.toInt o2 = BitVec.toInt bi - (1 : ℤ) → (0 : ℤ) ≤ BitVec.toInt o2 ∧ (∀(o3 : BitVec 64), BitVec.toUInt o3 = BitVec.toInt o2 → (¬(64 : ℤ) = (0 : ℤ) ∧ uint'64_in_bounds (Int.tmod (BitVec.toUInt o3) (64 : ℤ))) ∧ (∀(mi : BitVec 64), BitVec.toUInt mi = Int.tmod (BitVec.toUInt o3) (64 : ℤ) → (C.min p ≤ C.offset p + BitVec.toInt i ∧ C.offset p + BitVec.toInt i < C.max p) ∧ int'32_in_bounds (BitVec.toInt i + (1 : ℤ)) ∧ (∀(o4 : BitVec 32), BitVec.toInt o4 = BitVec.toInt i + (1 : ℤ) → (C.min p ≤ C.offset p + BitVec.toInt o4 ∧ C.offset p + BitVec.toInt o4 ≤ C.max p) ∧ (∀(p' : C.ptr (BitVec 64)), C.offset p' = C.offset p + BitVec.toInt o4 ∧ C.plength p' = C.plength p ∧ C.pelts p' = C.pelts p ∧ C.data p' = C.data p ∧ C.min p' = C.min p ∧ C.max p' = C.max p ∧ C.zone1 p' = C.zone1 p ∧ C.writable p' = C.writable p → ((0 : ℤ) ≤ BitVec.toUInt mi ∧ BitVec.toUInt mi < (64 : ℤ)) ∧ (∀(lps : BitVec 64), BitVec.toUInt lps = BitVec.toUInt (C.pelts p (C.offset p + BitVec.toInt i)) / HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt mi)) → ¬HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt mi)) = (0 : ℤ) ∧ (¬(2 : ℤ) = (0 : ℤ) ∧ uint'64_in_bounds (Int.tmod (BitVec.toUInt lps) (2 : ℤ))) ∧ (∀(res : BitVec 64), BitVec.toUInt res = Int.tmod (BitVec.toUInt lps) (2 : ℤ) → ¬(2 : ℤ) = (0 : ℤ) ∧ (¬(2 : ℤ) = (0 : ℤ) ∧ uint'64_in_bounds (Int.tmod (BitVec.toUInt lps) (2 : ℤ))) ∧ (∀(result : BitVec 64), BitVec.toUInt result = Int.tmod (BitVec.toUInt lps) (2 : ℤ) → ((0 : ℤ) ≤ BitVec.toUInt result ∧ BitVec.toUInt result ≤ (1 : ℤ)) ∧ BitVec.toUInt result = Lemmas.value p (BitVec.toInt pn) / HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toInt bi - (1 : ℤ))) % (2 : ℤ) ∧ valueb p (BitVec.toInt bi) = valueb p (BitVec.toInt bi - (1 : ℤ)) + HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toInt bi - (1 : ℤ))) * BitVec.toUInt result))))))))))
  := sorry
end powm_Powm_getbitqtvc
