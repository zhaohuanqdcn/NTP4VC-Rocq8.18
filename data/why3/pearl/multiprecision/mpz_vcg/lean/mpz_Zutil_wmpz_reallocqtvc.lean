import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import Why3.map.MapEq
import pearl.multiprecision.lib.lean.mpz.Z
import Why3.mach.int.Unsigned
import Why3.mach.c.C
import pearl.multiprecision.lib.lean.types.Config
import pearl.multiprecision.lib.lean.types.Types
import pearl.multiprecision.lib.lean.types.Int32Eq
import pearl.multiprecision.lib.lean.types.UInt64Eq
import pearl.multiprecision.lib.lean.lemmas.Lemmas
open Classical
open Lean4Why3
namespace mpz_Zutil_wmpz_reallocqtvc
axiom mpz_mem : Type
axiom inhabited_axiom_mpz_mem : Inhabited mpz_mem
attribute [instance] inhabited_axiom_mpz_mem
axiom ptr : mpz_mem -> Z.mpz_ptr
axiom ok : mpz_mem -> Bool
theorem wmpz_realloc'vc (mpz : Z.mpz_memo) (x : Z.mpz_ptr) (sz : BitVec 32) (fact0 : Z.readers mpz x = (0 : ℤ)) (fact1 : (1 : ℤ) ≤ Z.alloc mpz x) : -(2 : ℤ) < Z.readers mpz x ∧ (∀(o1 : BitVec 32), BitVec.toInt o1 = Z.alloc mpz x → (if BitVec.toInt o1 < BitVec.toInt sz then ((1 : ℤ) ≤ BitVec.toInt sz ∧ Z.readers mpz x = (0 : ℤ) ∧ (1 : ℤ) ≤ Z.alloc mpz x) ∧ (∀(mpz1 : Z.mpz_memo), Z.sgn mpz1 = Z.sgn mpz → (∀(result : C.ptr (BitVec 64)), (∀(y : Z.mpz_ptr), ¬y = x → Z.mpz_unchanged y mpz1 mpz) ∧ Z.readers mpz1 x = -(1 : ℤ) ∧ Z.alloc mpz1 x = BitVec.toInt sz ∧ Z.abs_value_of mpz1 x = Lemmas.value result (Z.abs_size mpz1 x) ∧ Z.zones mpz1 x = C.zone1 result ∧ C.offset result = (0 : ℤ) ∧ C.plength result = BitVec.toInt sz ∧ C.min result = (0 : ℤ) ∧ C.max result = BitVec.toInt sz ∧ C.writable result = true ∧ (if Z.abs_size mpz x ≤ BitVec.toInt sz then Z.abs_size mpz1 x = Z.abs_size mpz x ∧ Lemmas.value result (Z.abs_size mpz x) = Z.abs_value_of mpz x else Z.abs_size mpz1 x = (0 : ℤ)) → (∀(y : Z.mpz_ptr), ¬y = x → Z.mpz_unchanged y mpz1 mpz) ∧ Z.readers mpz1 x = -(1 : ℤ) ∧ Z.abs_value_of mpz1 x = Lemmas.value result (Z.abs_size mpz1 x) ∧ Z.zones mpz1 x = C.zone1 result ∧ C.offset result = (0 : ℤ) ∧ C.plength result = Z.alloc mpz1 x ∧ C.min result = (0 : ℤ) ∧ C.max result = C.plength result ∧ C.writable result = true ∧ Z.abs_size mpz1 x = Z.abs_size mpz x ∧ Lemmas.value result (Z.abs_size mpz x) = Z.abs_value_of mpz x ∧ (if Z.alloc mpz x < BitVec.toInt sz then Z.alloc mpz1 x = BitVec.toInt sz else Z.alloc mpz1 x = Z.alloc mpz x))) else Z.readers mpz x = (0 : ℤ) ∧ (∀(mpz1 : Z.mpz_memo), Z.abs_value_of mpz1 = Z.abs_value_of mpz ∧ Z.alloc mpz1 = Z.alloc mpz ∧ Z.abs_size mpz1 = Z.abs_size mpz ∧ Z.sgn mpz1 = Z.sgn mpz ∧ Z.zones mpz1 = Z.zones mpz → (∀(result : C.ptr (BitVec 64)), Z.readers mpz1 x = -(1 : ℤ) ∧ (∀(y : Z.mpz_ptr), ¬x = y → Z.readers mpz1 y = Z.readers mpz y) ∧ Lemmas.value result (Z.abs_size mpz1 x) = Z.abs_value_of mpz1 x ∧ C.plength result = Z.alloc mpz1 x ∧ C.offset result = (0 : ℤ) ∧ C.min result = (0 : ℤ) ∧ C.max result = C.plength result ∧ C.writable result = true ∧ C.zone1 result = Z.zones mpz1 x → (∀(y : Z.mpz_ptr), ¬y = x → Z.mpz_unchanged y mpz1 mpz) ∧ Z.readers mpz1 x = -(1 : ℤ) ∧ Z.abs_value_of mpz1 x = Lemmas.value result (Z.abs_size mpz1 x) ∧ Z.zones mpz1 x = C.zone1 result ∧ C.offset result = (0 : ℤ) ∧ C.plength result = Z.alloc mpz1 x ∧ C.min result = (0 : ℤ) ∧ C.max result = C.plength result ∧ C.writable result = true ∧ Z.abs_size mpz1 x = Z.abs_size mpz x ∧ Lemmas.value result (Z.abs_size mpz x) = Z.abs_value_of mpz x ∧ (if Z.alloc mpz x < BitVec.toInt sz then Z.alloc mpz1 x = BitVec.toInt sz else Z.alloc mpz1 x = Z.alloc mpz x)))))
  := sorry
end mpz_Zutil_wmpz_reallocqtvc
