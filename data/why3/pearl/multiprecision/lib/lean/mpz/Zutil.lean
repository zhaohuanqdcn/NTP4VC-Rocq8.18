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
namespace Zutil
axiom mpz_mem : Type
axiom inhabited_axiom_mpz_mem : Inhabited mpz_mem
attribute [instance] inhabited_axiom_mpz_mem
axiom ptr : mpz_mem -> Z.mpz_ptr
axiom ok : mpz_mem -> Bool
end Zutil
