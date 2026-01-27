theory pqueue_test_Test_test0qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_NumOf" "Why3STD.pqueue_Pqueue"
begin
consts v1 :: "elt"
consts v2 :: "elt"
axiomatization where values'0:   "le v2 v1"
axiomatization where values'1:   "\<not>le v1 v2"
theorem test0'vc:
  shows "True"
  sorry
end
