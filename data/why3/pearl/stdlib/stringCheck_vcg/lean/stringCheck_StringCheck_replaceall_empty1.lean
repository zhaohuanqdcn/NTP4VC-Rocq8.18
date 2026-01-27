import Why3.Base
import Why3.string.StringRealization
open Classical
open Lean4Why3
namespace stringCheck_StringCheck_replaceall_empty1
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
axiom substring_smaller_x (x : ℤ) (s : List (BitVec 8)) (i : ℤ) (fact0 : (0 : ℤ) ≤ x) : StringRealization.length (StringRealization.substring s i x) ≤ x
axiom substring_length (x : ℤ) (i : ℤ) (s : List (BitVec 8)) (fact0 : (0 : ℤ) ≤ x) (fact1 : (0 : ℤ) ≤ i) (fact2 : i < StringRealization.length s) : if StringRealization.length s < i + x then StringRealization.length (StringRealization.substring s i x) = StringRealization.length s - i else StringRealization.length (StringRealization.substring s i x) = x
axiom substring_at (s : List (BitVec 8)) (i : ℤ) : StringRealization.s_at s i = StringRealization.substring s i (1 : ℤ)
axiom substring_substring (ofs : ℤ) (s : List (BitVec 8)) (len : ℤ) (ofs' : ℤ) (len' : ℤ) (fact0 : (0 : ℤ) ≤ ofs) (fact1 : ofs ≤ StringRealization.length s) (fact2 : (0 : ℤ) ≤ len) (fact3 : ofs + len ≤ StringRealization.length s) (fact4 : (0 : ℤ) ≤ ofs') (fact5 : ofs' ≤ len) (fact6 : (0 : ℤ) ≤ len') (fact7 : ofs' + len' ≤ len) : StringRealization.substring (StringRealization.substring s ofs len) ofs' len' = StringRealization.substring s (ofs + ofs') len'
axiom concat_substring (ofs : ℤ) (s : List (BitVec 8)) (len : ℤ) (len' : ℤ) (fact0 : (0 : ℤ) ≤ ofs) (fact1 : ofs ≤ StringRealization.length s) (fact2 : (0 : ℤ) ≤ len) (fact3 : ofs + len ≤ StringRealization.length s) (fact4 : (0 : ℤ) ≤ len') (fact5 : (0 : ℤ) ≤ ofs + len + len') (fact6 : ofs + len + len' ≤ StringRealization.length s) : StringRealization.concat (StringRealization.substring s ofs len) (StringRealization.substring s (ofs + len) len') = StringRealization.substring s ofs (len + len')
axiom prefixof_substring (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) : StringRealization.prefixof s1 s2 = (s1 = StringRealization.substring s2 (0 : ℤ) (StringRealization.length s1))
axiom prefixof_concat (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) : StringRealization.prefixof s1 (StringRealization.concat s1 s2)
axiom prefixof_empty (s2 : List (BitVec 8)) : StringRealization.prefixof ([] : List (BitVec 8)) s2
axiom prefixof_empty2 (s1 : List (BitVec 8)) (fact0 : ¬s1 = ([] : List (BitVec 8))) : ¬StringRealization.prefixof s1 ([] : List (BitVec 8))
axiom suffixof_substring (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) : StringRealization.suffixof s1 s2 = (s1 = StringRealization.substring s2 (StringRealization.length s2 - StringRealization.length s1) (StringRealization.length s1))
axiom suffixof_concat (s2 : List (BitVec 8)) (s1 : List (BitVec 8)) : StringRealization.suffixof s2 (StringRealization.concat s1 s2)
axiom suffixof_empty (s2 : List (BitVec 8)) : StringRealization.suffixof ([] : List (BitVec 8)) s2
axiom suffixof_empty2 (s1 : List (BitVec 8)) (fact0 : ¬s1 = ([] : List (BitVec 8))) : ¬StringRealization.suffixof s1 ([] : List (BitVec 8))
axiom contains_prefixof (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (fact0 : StringRealization.prefixof s1 s2) : StringRealization.contains s2 s1
axiom contains_suffixof (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (fact0 : StringRealization.suffixof s1 s2) : StringRealization.contains s2 s1
axiom contains_empty (s2 : List (BitVec 8)) : StringRealization.contains ([] : List (BitVec 8)) s2 = (s2 = ([] : List (BitVec 8)))
axiom contains_empty2 (s1 : List (BitVec 8)) : StringRealization.contains s1 ([] : List (BitVec 8))
axiom contains_substring (s1 : List (BitVec 8)) (i : ℤ) (s2 : List (BitVec 8)) (fact0 : StringRealization.substring s1 i (StringRealization.length s2) = s2) : StringRealization.contains s1 s2
axiom contains_concat (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) : StringRealization.contains (StringRealization.concat s1 s2) s1 ∧ StringRealization.contains (StringRealization.concat s1 s2) s2
axiom contains_at (s1 : List (BitVec 8)) (i : ℤ) (s2 : List (BitVec 8)) (fact0 : StringRealization.s_at s1 i = s2) : StringRealization.contains s1 s2
axiom indexof_empty (i : ℤ) (s : List (BitVec 8)) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ StringRealization.length s) : StringRealization.indexof s ([] : List (BitVec 8)) i = i
axiom indexof_empty1 (s : List (BitVec 8)) (i : ℤ) : StringRealization.indexof ([] : List (BitVec 8)) s i = -(1 : ℤ) ∨ s = ([] : List (BitVec 8)) ∧ i = StringRealization.indexof ([] : List (BitVec 8)) s i ∧ StringRealization.indexof ([] : List (BitVec 8)) s i = (0 : ℤ)
axiom indexof_contains (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) : StringRealization.contains s1 s2 → ((0 : ℤ) ≤ StringRealization.indexof s1 s2 (0 : ℤ) ∧ StringRealization.indexof s1 s2 (0 : ℤ) ≤ StringRealization.length s1) ∧ StringRealization.substring s1 (StringRealization.indexof s1 s2 (0 : ℤ)) (StringRealization.length s2) = s2
axiom contains_indexof (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (i : ℤ) (fact0 : (0 : ℤ) ≤ StringRealization.indexof s1 s2 i) : StringRealization.contains s1 s2
axiom not_contains_indexof (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (i : ℤ) (fact0 : ¬StringRealization.contains s1 s2) : StringRealization.indexof s1 s2 i = -(1 : ℤ)
axiom substring_indexof (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (i : ℤ) : (0 : ℤ) ≤ StringRealization.indexof s1 s2 i → StringRealization.substring s1 (StringRealization.indexof s1 s2 i) (StringRealization.length s2) = s2
axiom indexof_out_of_range (i : ℤ) (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (fact0 : ¬((0 : ℤ) ≤ i ∧ i ≤ StringRealization.length s1)) : StringRealization.indexof s1 s2 i = -(1 : ℤ)
axiom indexof_in_range (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (i : ℤ) : (0 : ℤ) ≤ i ∧ i ≤ StringRealization.length s1 → StringRealization.indexof s1 s2 i = -(1 : ℤ) ∨ i ≤ StringRealization.indexof s1 s2 i ∧ StringRealization.indexof s1 s2 i ≤ StringRealization.length s1
axiom indexof_contains_substring (i : ℤ) (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ StringRealization.length s1) (fact2 : StringRealization.contains (StringRealization.substring s1 i (StringRealization.length s1 - i)) s2) : i ≤ StringRealization.indexof s1 s2 i ∧ StringRealization.indexof s1 s2 i ≤ StringRealization.length s1
axiom replace_empty (s1 : List (BitVec 8)) (s3 : List (BitVec 8)) : StringRealization.replace s1 ([] : List (BitVec 8)) s3 = StringRealization.concat s3 s1
axiom replace_not_contains (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (s3 : List (BitVec 8)) (fact0 : ¬StringRealization.contains s1 s2) : StringRealization.replace s1 s2 s3 = s1
axiom replace_empty2 (s2 : List (BitVec 8)) (s3 : List (BitVec 8)) : if s2 = ([] : List (BitVec 8)) then StringRealization.replace ([] : List (BitVec 8)) s2 s3 = s3 else StringRealization.replace ([] : List (BitVec 8)) s2 s3 = ([] : List (BitVec 8))
axiom replace_substring_indexof (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (s3 : List (BitVec 8)) : StringRealization.replace s1 s2 s3 = (if StringRealization.indexof s1 s2 (0 : ℤ) < (0 : ℤ) then s1 else StringRealization.concat (StringRealization.concat (StringRealization.substring s1 (0 : ℤ) (StringRealization.indexof s1 s2 (0 : ℤ))) s3) (StringRealization.substring s1 (StringRealization.indexof s1 s2 (0 : ℤ) + StringRealization.length s2) (StringRealization.length s1 - StringRealization.indexof s1 s2 (0 : ℤ) - StringRealization.length s2)))
theorem replaceall_empty1 (s1 : List (BitVec 8)) (s3 : List (BitVec 8)) : StringRealization.replaceall s1 ([] : List (BitVec 8)) s3 = s1
  := sorry
end stringCheck_StringCheck_replaceall_empty1
