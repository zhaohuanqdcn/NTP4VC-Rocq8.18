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
namespace mpz_Zutil_mpz_ptr_swapqtvc
axiom mpz_mem : Type
axiom inhabited_axiom_mpz_mem : Inhabited mpz_mem
attribute [instance] inhabited_axiom_mpz_mem
axiom ptr : mpz_mem -> Z.mpz_ptr
axiom ok : mpz_mem -> Bool
theorem mpz_ptr_swap'vc (mpz : Z.mpz_memo) (x : Z.mpz_ptr) (y : Z.mpz_ptr) (fact0 : Z.readers mpz x = (0 : ℤ)) (fact1 : Z.readers mpz y = (0 : ℤ)) : Z.readers mpz y = (0 : ℤ) ∧ Z.readers mpz x = (0 : ℤ)
  := sorry
end mpz_Zutil_mpz_ptr_swapqtvc
