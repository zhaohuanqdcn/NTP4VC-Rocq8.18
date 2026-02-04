namespace Compare
noncomputable def compare_int (x : ℤ) (y : ℤ) := if x < y then -(1 : ℤ) else if x = y then (0 : ℤ) else (1 : ℤ)
end Compare
namespace Valuation
axiom valuation : ℤ -> ℤ -> ℤ
axiom valuation'def (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : if Int.tmod n p = (0 : ℤ) then valuation n p = valuation (Int.tdiv n p) p + (1 : ℤ) else valuation n p = (0 : ℤ)
axiom valuation'spec'0 (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : (0 : ℤ) ≤ valuation n p
axiom valuation'spec (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : HPow.hPow p (Int.toNat (valuation n p)) ∣  n
end Valuation
namespace Alias
axiom mem : Type
axiom inhabited_axiom_mem : Inhabited mem
attribute [instance] inhabited_axiom_mem
axiom zr : mem -> C.zone
axiom zx : mem -> C.zone
axiom zy : mem -> C.zone
axiom mr : mem -> BitVec 32
axiom mx : mem -> BitVec 32
axiom my : mem -> BitVec 32
axiom lr : mem -> BitVec 32
axiom lx : mem -> BitVec 32
axiom ly : mem -> BitVec 32
axiom ok : mem -> Bool
noncomputable def identical (p1 : C.ptr (BitVec 64)) (p2 : C.ptr (BitVec 64)) := C.data p1 = C.data p2 ∧ C.offset p1 = C.offset p2 ∧ C.min p1 = C.min p2 ∧ C.max p1 = C.max p2 ∧ C.zone1 p1 = C.zone1 p2
end Alias
namespace Util
end Util
namespace UtilOld
end UtilOld
namespace Add
end Add
namespace AddOld
end AddOld
namespace SubOld
end SubOld
namespace Mul
end Mul
namespace Mul_basecase
end Mul_basecase
namespace LogicalUtil
end LogicalUtil
namespace Logical
end Logical
namespace LogicalOld
end LogicalOld
namespace Div
noncomputable def reciprocal (v : BitVec 64) (d : BitVec 64) := BitVec.toUInt v = (((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) - (1 : ℤ)) / BitVec.toUInt d - ((18446744073709551615 : ℤ) + (1 : ℤ))
noncomputable def reciprocal_3by2 (v : BitVec 64) (dh : BitVec 64) (dl : BitVec 64) := BitVec.toUInt v = (((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) - (1 : ℤ)) / (BitVec.toUInt dl + ((18446744073709551615 : ℤ) + (1 : ℤ)) * BitVec.toUInt dh) - ((18446744073709551615 : ℤ) + (1 : ℤ))
noncomputable def normalized (x : C.ptr (BitVec 64)) (sz : BitVec 32) := C.valid x (BitVec.toInt sz) ∧ ((18446744073709551615 : ℤ) + (1 : ℤ)) / (2 : ℤ) ≤ BitVec.toUInt (C.pelts x (C.offset x + BitVec.toInt sz - (1 : ℤ)))
end Div
namespace Add_1
end Add_1
namespace Sub_1
end Sub_1
namespace Toom
end Toom
namespace Powm
noncomputable def redc (ur : ℤ) (u : ℤ) (n : ℤ) (m : ℤ) := ur % m = HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat n) * u % m
noncomputable def valueb (p : C.ptr (BitVec 64)) (nbits : ℤ) := if nbits < (0 : ℤ) then (0 : ℤ) else let i : ℤ := nbits / (64 : ℤ); Lemmas.value p i + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat i) * (BitVec.toUInt (C.pelts p (C.offset p + i)) % HPow.hPow (2 : ℤ) (Int.toNat (nbits - (64 : ℤ) * i)))
end Powm
