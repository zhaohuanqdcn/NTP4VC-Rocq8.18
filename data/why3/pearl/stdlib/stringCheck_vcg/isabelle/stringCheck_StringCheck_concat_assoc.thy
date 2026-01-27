theory stringCheck_StringCheck_concat_assoc
  imports "NTP4Verif.NTP4Verif" "Why3STD.string_StringRealization"
begin
theorem concat_assoc:
  fixes s1 :: "string"
  fixes s2 :: "string"
  fixes s3 :: "string"
  shows "concat (concat s1 s2) s3 = concat s1 (concat s2 s3)"
  sorry
end
