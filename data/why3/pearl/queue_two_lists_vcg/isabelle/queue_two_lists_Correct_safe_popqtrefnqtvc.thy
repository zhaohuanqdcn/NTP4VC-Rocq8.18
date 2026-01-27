theory queue_two_lists_Correct_safe_popqtrefnqtvc
  imports "NTP4Verif.NTP4Verif" "./queue_two_lists_Queue"
begin
theorem safe_pop'refn'vc:
  fixes q :: "'a t"
  assumes fact0: "\<not>seq q = ([] :: 'a list)"
  shows "\<not>seq q = ([] :: 'a list)"
  sorry
end
