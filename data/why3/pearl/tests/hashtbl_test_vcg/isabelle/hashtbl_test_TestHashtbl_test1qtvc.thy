theory hashtbl_test_TestHashtbl_test1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.hashtbl_Hashtbl"
begin
consts k1 :: "key"
consts k2 :: "key"
consts k3 :: "key"
axiomatization where kdiff'0:   "\<not>k1 = k2"
axiomatization where kdiff'1:   "\<not>k1 = k3"
axiomatization where kdiff'2:   "\<not>k2 = k3"
theorem test1'vc:
  fixes h :: "bool t"
  assumes fact0: "\<forall>(k :: key). mixfix_lbrb h k = (Nil :: bool list)"
  shows "let o1 :: key = k1 in \<forall>(h1 :: bool t). mixfix_lbrb h1 o1 = Cons True (mixfix_lbrb h o1) \<and> (\<forall>(k' :: key). \<not>k' = o1 \<longrightarrow> mixfix_lbrb h1 k' = mixfix_lbrb h k') \<longrightarrow> \<not>mixfix_lbrb h1 k1 = (Nil :: bool list)"
  sorry
end
