theory queue_two_lists_Correct_copyqtrefnqtvc
  imports "NTP4Verif.NTP4Verif" "./queue_two_lists_Queue"
begin
theorem copy'refn'vc:
  fixes result :: "'a t"
  fixes q :: "'a t"
  assumes fact0: "seq result = seq q"
  shows "seq result = seq q"
  sorry
end
