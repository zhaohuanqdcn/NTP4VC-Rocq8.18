import Why3.Base
import Why3.string.StringRealization
open Classical
open Lean4Why3
namespace stringCheck_StringCheck_concat_empty
axiom concat_assoc (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) (s3 : List (BitVec 8)) : StringRealization.concat (StringRealization.concat s1 s2) s3 = StringRealization.concat s1 (StringRealization.concat s2 s3)
theorem concat_empty (s : List (BitVec 8)) : StringRealization.concat s ([] : List (BitVec 8)) = StringRealization.concat ([] : List (BitVec 8)) s ∧ StringRealization.concat ([] : List (BitVec 8)) s = s
  := sorry
end stringCheck_StringCheck_concat_empty
