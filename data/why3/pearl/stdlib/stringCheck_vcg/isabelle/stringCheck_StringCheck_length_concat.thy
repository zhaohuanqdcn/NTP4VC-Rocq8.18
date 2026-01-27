theory stringCheck_StringCheck_length_concat
  imports "NTP4Verif.NTP4Verif" "Why3STD.string_StringRealization"
begin
axiomatization where concat_assoc:   "concat (concat s1 s2) s3 = concat s1 (concat s2 s3)"
  for s1 :: "string"
  and s2 :: "string"
  and s3 :: "string"
axiomatization where concat_empty'0:   "concat s '''' = concat '''' s"
  for s :: "string"
axiomatization where concat_empty'1:   "concat '''' s = s"
  for s :: "string"
axiomatization where length_empty:   "string_StringRealization.length '''' = (0 :: int)"
theorem length_concat:
  fixes s1 :: "string"
  fixes s2 :: "string"
  shows "string_StringRealization.length (concat s1 s2) = string_StringRealization.length s1 + string_StringRealization.length s2"
  sorry
end
