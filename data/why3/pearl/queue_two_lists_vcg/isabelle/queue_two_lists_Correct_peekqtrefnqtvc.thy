theory queue_two_lists_Correct_peekqtrefnqtvc
  imports "NTP4Verif.NTP4Verif" "./queue_two_lists_Queue"
begin
theorem peek'refn'vc:
  fixes q :: "'a t"
  assumes fact0: "seq q = ([] :: 'a list)"
  shows "seq q = ([] :: 'a list)"
  sorry
end
