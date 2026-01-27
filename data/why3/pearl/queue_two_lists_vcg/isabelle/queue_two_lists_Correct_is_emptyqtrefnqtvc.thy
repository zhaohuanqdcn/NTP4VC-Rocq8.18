theory queue_two_lists_Correct_is_emptyqtrefnqtvc
  imports "NTP4Verif.NTP4Verif" "./queue_two_lists_Queue"
begin
theorem is_empty'refn'vc:
  fixes q :: "'a t"
  shows "seq q = ([] :: 'a list) \<longleftrightarrow> seq q = ([] :: 'a list)"
  sorry
end
