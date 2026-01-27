import Why3.Base
import Why3.string.StringRealization
open Classical
open Lean4Why3
namespace stringCheck_StringCheck_le_ref
axiom concat_assoc (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (s3 : List (BitVec 8)) : StringRealization.concat (StringRealization.concat s1 s2) s3 = StringRealization.concat s1 (StringRealization.concat s2 s3)
axiom concat_empty (s : List (BitVec 8)) : StringRealization.concat s ([] : List (BitVec 8)) = StringRealization.concat ([] : List (BitVec 8)) s ∧ StringRealization.concat ([] : List (BitVec 8)) s = s
axiom length_empty : StringRealization.length ([] : List (BitVec 8)) = (0 : ℤ)
axiom length_concat (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) : StringRealization.length (StringRealization.concat s1 s2) = StringRealization.length s1 + StringRealization.length s2
axiom lt_empty (s : List (BitVec 8)) (fact0 : ¬s = ([] : List (BitVec 8))) : StringRealization.lt ([] : List (BitVec 8)) s
axiom lt_not_com (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (fact0 : StringRealization.lt s1 s2) : ¬StringRealization.lt s2 s1
axiom lt_ref (s1 : List (BitVec 8)) : ¬StringRealization.lt s1 s1
axiom lt_trans (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (s3 : List (BitVec 8)) (fact0 : StringRealization.lt s1 s2) (fact1 : StringRealization.lt s2 s3) : StringRealization.lt s1 s3
axiom le_empty (s : List (BitVec 8)) : StringRealization.le ([] : List (BitVec 8)) s
theorem le_ref (s1 : List (BitVec 8)) : StringRealization.le s1 s1
  := sorry
end stringCheck_StringCheck_le_ref
