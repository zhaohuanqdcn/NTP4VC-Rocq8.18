theory vstte10_aqueue_AmortizedQueue_queueqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem queue'vc:
  shows "let rear :: 'a list = (Nil :: 'a list) in int (length (Nil :: 'a list)) = (0 :: int) \<and> int (length rear) \<le> (0 :: int) \<and> int (length rear) = (0 :: int)"
  sorry
end
