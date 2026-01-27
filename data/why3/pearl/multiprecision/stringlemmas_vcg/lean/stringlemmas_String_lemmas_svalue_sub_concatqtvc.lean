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
namespace stringlemmas_String_lemmas_svalue_sub_concatqtvc
noncomputable def in_base (b : ℤ) (x : ℤ -> BitVec 8) (n : ℤ) (m : ℤ) := ∀(i : ℤ), n ≤ i ∧ i < m → (0 : ℤ) ≤ BitVec.toInt (x i) ∧ BitVec.toInt (x i) < b
axiom svalue_le_sub : ℤ -> (ℤ -> BitVec 8) -> ℤ -> ℤ -> ℤ
axiom svalue_le_sub'def (n : ℤ) (m : ℤ) (b : ℤ) (x : ℤ -> BitVec 8) : if n < m then svalue_le_sub b x n m = BitVec.toInt (x n) + b * svalue_le_sub b x (n + (1 : ℤ)) m else svalue_le_sub b x n m = (0 : ℤ)
noncomputable def string_in_base (b : ℤ) (p : C.ptr (BitVec 8)) := in_base b (C.pelts p) (C.min p) (C.max p)
noncomputable def svalue_le (b : ℤ) (x : C.ptr (BitVec 8)) (sz : ℤ) := svalue_le_sub b (C.pelts x) (C.offset x) (C.offset x + sz)
axiom svalue_sub : ℤ -> (ℤ -> BitVec 8) -> ℤ -> ℤ -> ℤ
axiom svalue_sub'def (n : ℤ) (m : ℤ) (b : ℤ) (x : ℤ -> BitVec 8) : if n < m then svalue_sub b x n m = BitVec.toInt (x (m - (1 : ℤ))) + b * svalue_sub b x n (m - (1 : ℤ)) else svalue_sub b x n m = (0 : ℤ)
theorem svalue_sub_concat'vc (n : ℤ) (m : ℤ) (l : ℤ) (b : ℤ) (x : ℤ -> BitVec 8) (fact0 : n ≤ m) (fact1 : m ≤ l) (fact2 : in_base b x n l) (fact3 : (2 : ℤ) ≤ b) (fact4 : b ≤ (256 : ℤ)) : svalue_sub b x n l = svalue_sub b x m l + HPow.hPow b (Int.toNat (l - m)) * svalue_sub b x n m
  := sorry
end stringlemmas_String_lemmas_svalue_sub_concatqtvc
