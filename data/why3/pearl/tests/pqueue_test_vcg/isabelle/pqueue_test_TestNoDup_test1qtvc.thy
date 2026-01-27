theory pqueue_test_TestNoDup_test1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.pqueue_PqueueNoDup"
begin
consts v1 :: "elt"
consts v2 :: "elt"
axiomatization where values'0:   "le v2 v1"
axiomatization where values'1:   "\<not>le v1 v2"
theorem test1'vc:
  shows "True"
  sorry
end
