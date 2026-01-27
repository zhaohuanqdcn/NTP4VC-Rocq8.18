import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import Why3.map.MapEq
import pearl.multiprecision.lib.lean.lemmas.Lemmas
import Why3.mach.int.Unsigned
import Why3.mach.c.C
import Why3.mach.c.UChar
import pearl.multiprecision.lib.lean.types.Config
import pearl.multiprecision.lib.lean.types.Types
import pearl.multiprecision.lib.lean.types.Int32Eq
import pearl.multiprecision.lib.lean.types.UInt64Eq
open Classical
open Lean4Why3
namespace stringlemmas_String_lemmas_in_base_concatqtvc
noncomputable def in_base (b : ℤ) (x : ℤ -> BitVec 8) (n : ℤ) (m : ℤ) := ∀(i : ℤ), n ≤ i ∧ i < m → (0 : ℤ) ≤ BitVec.toInt (x i) ∧ BitVec.toInt (x i) < b
theorem in_base_concat'vc (b : ℤ) (x : ℤ -> BitVec 8) (n : ℤ) (m : ℤ) (l : ℤ) (fact0 : in_base b x n m) (fact1 : in_base b x m l) : in_base b x n l
  := sorry
end stringlemmas_String_lemmas_in_base_concatqtvc
