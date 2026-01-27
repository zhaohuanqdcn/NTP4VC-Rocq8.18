import Why3.Base
import Why3.string.StringRealization
open Classical
open Lean4Why3
namespace stringCheck_StringCheck_substring_smaller_x
axiom concat_assoc (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (s3 : List (BitVec 8)) : StringRealization.concat (StringRealization.concat s1 s2) s3 = StringRealization.concat s1 (StringRealization.concat s2 s3)
axiom concat_empty (s : List (BitVec 8)) : StringRealization.concat s ([] : List (BitVec 8)) = StringRealization.concat ([] : List (BitVec 8)) s ∧ StringRealization.concat ([] : List (BitVec 8)) s = s
axiom length_empty : StringRealization.length ([] : List (BitVec 8)) = (0 : ℤ)
axiom length_concat (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) : StringRealization.length (StringRealization.concat s1 s2) = StringRealization.length s1 + StringRealization.length s2
axiom lt_empty (s : List (BitVec 8)) (fact0 : ¬s = ([] : List (BitVec 8))) : StringRealization.lt ([] : List (BitVec 8)) s
axiom lt_not_com (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (fact0 : StringRealization.lt s1 s2) : ¬StringRealization.lt s2 s1
axiom lt_ref (s1 : List (BitVec 8)) : ¬StringRealization.lt s1 s1
axiom lt_trans (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (s3 : List (BitVec 8)) (fact0 : StringRealization.lt s1 s2) (fact1 : StringRealization.lt s2 s3) : StringRealization.lt s1 s3
axiom le_empty (s : List (BitVec 8)) : StringRealization.le ([] : List (BitVec 8)) s
axiom le_ref (s1 : List (BitVec 8)) : StringRealization.le s1 s1
axiom lt_le (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (fact0 : StringRealization.lt s1 s2) : StringRealization.le s1 s2
axiom lt_le_eq (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (fact0 : StringRealization.le s1 s2) : StringRealization.lt s1 s2 ∨ s1 = s2
axiom le_trans (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (s3 : List (BitVec 8)) (fact0 : StringRealization.le s1 s2) (fact1 : StringRealization.le s2 s3) : StringRealization.le s1 s3
axiom at_out_of_range (i : ℤ) (s : List (BitVec 8)) (fact0 : i < (0 : ℤ) ∨ StringRealization.length s ≤ i) : StringRealization.s_at s i = ([] : List (BitVec 8))
axiom at_empty (i : ℤ) : StringRealization.s_at ([] : List (BitVec 8)) i = ([] : List (BitVec 8))
axiom at_length (s : List (BitVec 8)) (i : ℤ) : if (0 : ℤ) ≤ i ∧ i < StringRealization.length s then StringRealization.length (StringRealization.s_at s i) = (1 : ℤ) else StringRealization.length (StringRealization.s_at s i) = (0 : ℤ)
axiom concat_at (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) : ∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i < StringRealization.length s1 → StringRealization.s_at (StringRealization.concat s1 s2) i = StringRealization.s_at s1 i) ∧ (StringRealization.length s1 ≤ i ∧ i < StringRealization.length (StringRealization.concat s1 s2) → StringRealization.s_at (StringRealization.concat s1 s2) i = StringRealization.s_at s2 (i - StringRealization.length s1))
axiom substring_out_of_range (i : ℤ) (s : List (BitVec 8)) (x : ℤ) (fact0 : i < (0 : ℤ) ∨ StringRealization.length s ≤ i) : StringRealization.substring s i x = ([] : List (BitVec 8))
axiom substring_of_length_zero_or_less (x : ℤ) (s : List (BitVec 8)) (i : ℤ) (fact0 : x ≤ (0 : ℤ)) : StringRealization.substring s i x = ([] : List (BitVec 8))
axiom substring_of_empty (i : ℤ) (x : ℤ) : StringRealization.substring ([] : List (BitVec 8)) i x = ([] : List (BitVec 8))
axiom substring_smaller (s : List (BitVec 8)) (i : ℤ) (x : ℤ) : StringRealization.length (StringRealization.substring s i x) ≤ StringRealization.length s
theorem substring_smaller_x (x : ℤ) (s : List (BitVec 8)) (i : ℤ) (fact0 : (0 : ℤ) ≤ x) : StringRealization.length (StringRealization.substring s i x) ≤ x
  := sorry
end stringCheck_StringCheck_substring_smaller_x
