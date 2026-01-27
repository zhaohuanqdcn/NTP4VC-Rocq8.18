theory queue_two_lists_Queue_tqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem t'vc:
  shows "\<exists>(front :: 'a list) (rear :: 'a list) (seq :: 'a list). int (length seq) = int (length front) + int (length rear) \<and> ((0 :: int) < int (length front) \<longrightarrow> (0 :: int) < int (length rear)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length seq) \<longrightarrow> seq ! nat i = (let n :: int = int (length rear) in if i < n then rear ! nat i else front ! nat (int (length front) - (1 :: int) - (i - n))))"
  sorry
end
