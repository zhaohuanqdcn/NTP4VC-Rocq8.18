theory queue_two_lists_Correct_createqtrefnqtvc
  imports "NTP4Verif.NTP4Verif" "./queue_two_lists_Queue"
begin
theorem create'refn'vc:
  fixes result :: "'a t"
  assumes fact0: "seq result = ([] :: 'a list)"
  shows "seq result = ([] :: 'a list)"
  sorry
end
