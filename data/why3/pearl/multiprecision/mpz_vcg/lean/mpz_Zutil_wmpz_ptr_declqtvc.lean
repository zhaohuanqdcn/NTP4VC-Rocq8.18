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
namespace mpz_Zutil_wmpz_ptr_declqtvc
axiom mpz_mem : Type
axiom inhabited_axiom_mpz_mem : Inhabited mpz_mem
attribute [instance] inhabited_axiom_mpz_mem
axiom ptr : mpz_mem -> Z.mpz_ptr
axiom ok : mpz_mem -> Bool
theorem wmpz_ptr_decl'vc (mpz : Z.mpz_memo) (t : Z.mpz_ptr) (mpz1 : Z.mpz_memo) (memo : mpz_mem) (fact0 : Z.readers mpz t = -(2 : ℤ)) (fact1 : ∀(x : Z.mpz_ptr), ¬x = t → Z.mpz_unchanged x mpz1 mpz) (fact2 : Z.readers mpz1 t = (0 : ℤ)) (fact3 : Z.alloc mpz1 t = (0 : ℤ)) (fact4 : Z.abs_size mpz1 t = (0 : ℤ)) (fact5 : ptr memo = t) (fact6 : ok memo = true) : t = ptr memo ∧ ok memo = true ∧ Z.readers mpz1 t = (0 : ℤ) ∧ Z.alloc mpz1 t = (0 : ℤ) ∧ Z.abs_size mpz1 t = (0 : ℤ) ∧ Z.readers mpz t = -(2 : ℤ) ∧ (∀(x : Z.mpz_ptr), ¬x = t → Z.mpz_unchanged x mpz1 mpz)
  := sorry
end mpz_Zutil_wmpz_ptr_declqtvc
