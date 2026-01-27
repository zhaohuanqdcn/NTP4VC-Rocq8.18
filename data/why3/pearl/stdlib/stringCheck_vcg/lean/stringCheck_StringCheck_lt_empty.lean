import Why3.Base
import Why3.string.StringRealization
open Classical
open Lean4Why3
namespace stringCheck_StringCheck_lt_empty
axiom concat_assoc (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (s3 : List (BitVec 8)) : StringRealization.concat (StringRealization.concat s1 s2) s3 = StringRealization.concat s1 (StringRealization.concat s2 s3)
axiom concat_empty (s : List (BitVec 8)) : StringRealization.concat s ([] : List (BitVec 8)) = StringRealization.concat ([] : List (BitVec 8)) s ∧ StringRealization.concat ([] : List (BitVec 8)) s = s
axiom length_empty : StringRealization.length ([] : List (BitVec 8)) = (0 : ℤ)
axiom length_concat (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) : StringRealization.length (StringRealization.concat s1 s2) = StringRealization.length s1 + StringRealization.length s2
theorem lt_empty (s : List (BitVec 8)) (fact0 : ¬s = ([] : List (BitVec 8))) : StringRealization.lt ([] : List (BitVec 8)) s
  := sorry
end stringCheck_StringCheck_lt_empty
