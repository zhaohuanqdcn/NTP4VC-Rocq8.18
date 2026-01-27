import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import Why3.map.MapEq
import pearl.multiprecision.lib.lean.stringlemmas.String_lemmas
import pearl.multiprecision.lib.lean.lemmas.Lemmas
import Why3.mach.int.Unsigned
import Why3.mach.c.C
import Why3.mach.c.String
import Why3.mach.c.UChar
import pearl.multiprecision.lib.lean.types.Config
import pearl.multiprecision.lib.lean.types.Types
import pearl.multiprecision.lib.lean.types.Int32Eq
import pearl.multiprecision.lib.lean.types.UInt64Eq
import pearl.multiprecision.lib.lean.stringlemmas.Conversions
open Classical
open Lean4Why3
namespace stringlemmas_String_value_abs_value_sub_text_frameqtvc
axiom abs_value_sub_text : ℤ -> (ℤ -> BitVec 8) -> ℤ -> ℤ -> ℤ
axiom abs_value_sub_text'def (n : ℤ) (m : ℤ) (b : ℤ) (s : ℤ -> BitVec 8) : if n < m then abs_value_sub_text b s n m = Conversions.text_to_num b (s (m - (1 : ℤ))) + b * abs_value_sub_text b s n (m - (1 : ℤ)) else abs_value_sub_text b s n m = (0 : ℤ)
noncomputable def abs_value_text (b : ℤ) (s : ℤ -> BitVec 8) (ofs : ℤ) := abs_value_sub_text b s ofs (ofs + String.strlen s ofs)
noncomputable def value_text (b : ℤ) (s : ℤ -> BitVec 8) (ofs : ℤ) := if s ofs = ([45] : List (BitVec 8))[(0 : ℕ)]! then -abs_value_text b s (ofs + (1 : ℤ)) else abs_value_text b s ofs
noncomputable def text_in_base (b : ℤ) (t : ℤ -> BitVec 8) (n : ℤ) (m : ℤ) := ∀(i : ℤ), n ≤ i ∧ i < m → (0 : ℤ) ≤ Conversions.text_to_num b (t i) ∧ Conversions.text_to_num b (t i) < b
noncomputable def string_in_base (b : ℤ) (s : ℤ -> BitVec 8) (ofs : ℤ) := text_in_base b s ofs (ofs + String.strlen s ofs) ∧ (0 : ℤ) < String.strlen s ofs ∨ s ofs = ([45] : List (BitVec 8))[(0 : ℕ)]! ∧ text_in_base b s (ofs + (1 : ℤ)) (ofs + String.strlen s ofs) ∧ (1 : ℤ) < String.strlen s ofs
theorem abs_value_sub_text_frame'vc (n : ℤ) (m : ℤ) (x : ℤ -> BitVec 8) (y : ℤ -> BitVec 8) (b : ℤ) (fact0 : ∀(i : ℤ), n ≤ i ∧ i < m → x i = y i) : abs_value_sub_text b x n m = abs_value_sub_text b y n m
  := sorry
end stringlemmas_String_value_abs_value_sub_text_frameqtvc
