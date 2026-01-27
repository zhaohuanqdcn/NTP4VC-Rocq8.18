theory stringCheck_StringCheck_concat_empty
  imports "NTP4Verif.NTP4Verif" "Why3STD.string_StringRealization"
begin
axiomatization where concat_assoc:   "concat (concat s1 s2) s3 = concat s1 (concat s2 s3)"
  for s1 :: "string"
  and s2 :: "string"
  and s3 :: "string"
theorem concat_empty:
  fixes s :: "string"
  shows "concat s '''' = concat '''' s"
  and "concat '''' s = s"
  sorry
end
