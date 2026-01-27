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
namespace stringlemmas_String_lemmas_svalue_le_concatqtvc
noncomputable def in_base (b : ℤ) (x : ℤ -> BitVec 8) (n : ℤ) (m : ℤ) := ∀(i : ℤ), n ≤ i ∧ i < m → (0 : ℤ) ≤ BitVec.toInt (x i) ∧ BitVec.toInt (x i) < b
axiom svalue_le_sub : ℤ -> (ℤ -> BitVec 8) -> ℤ -> ℤ -> ℤ
axiom svalue_le_sub'def (n : ℤ) (m : ℤ) (b : ℤ) (x : ℤ -> BitVec 8) : if n < m then svalue_le_sub b x n m = BitVec.toInt (x n) + b * svalue_le_sub b x (n + (1 : ℤ)) m else svalue_le_sub b x n m = (0 : ℤ)
noncomputable def string_in_base (b : ℤ) (p : C.ptr (BitVec 8)) := in_base b (C.pelts p) (C.min p) (C.max p)
noncomputable def svalue_le (b : ℤ) (x : C.ptr (BitVec 8)) (sz : ℤ) := svalue_le_sub b (C.pelts x) (C.offset x) (C.offset x + sz)
theorem svalue_le_concat'vc (n : BitVec 32) (m : BitVec 32) (b : ℤ) (x : C.ptr (BitVec 8)) (fact0 : (0 : ℤ) ≤ BitVec.toInt n) (fact1 : BitVec.toInt n ≤ BitVec.toInt m) (fact2 : in_base b (C.pelts x) (C.offset x) (C.offset x + BitVec.toInt m)) (fact3 : (2 : ℤ) ≤ b) (fact4 : b ≤ (256 : ℤ)) : svalue_le b x (BitVec.toInt m) = svalue_le b x (BitVec.toInt n) + HPow.hPow b (Int.toNat (BitVec.toInt n)) * svalue_le_sub b (C.pelts x) (C.offset x + BitVec.toInt n) (C.offset x + BitVec.toInt m)
  := sorry
end stringlemmas_String_lemmas_svalue_le_concatqtvc
