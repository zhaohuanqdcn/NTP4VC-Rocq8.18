theory split_string_SplitString_concatqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  char
typedecl  string'
theorem concat'vc:
  fixes ss :: "char list list"
  fixes sep :: "char"
  assumes fact0: "(1 :: int) \<le> int (length ss)"
  assumes fact1: "\<not>int (length ss) = (1 :: int)"
  shows "let o1 :: char list = ss ! nat (int (length ss) - (1 :: int)); o2 :: char list = Cons sep o1 in int (length o2) = (1 :: int) + int (length o1) \<and> o2 ! (0 :: nat) = sep \<and> (\<forall>(i :: int). (0 :: int) < i \<and> i \<le> int (length o1) \<longrightarrow> o2 ! nat i = o1 ! nat (i - (1 :: int))) \<longrightarrow> (let o3 :: int = int (length ss) - (1 :: int) in ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> o3 \<and> o3 \<le> int (length ss)) \<and> (let o4 :: char list list = drop (0 :: nat) (take (nat o3 - (0 :: nat)) ss) in int (length o4) = o3 - (0 :: int) \<and> (\<forall>(k :: int). (0 :: int) \<le> k \<and> k < o3 - (0 :: int) \<longrightarrow> o4 ! nat k = ss ! nat ((0 :: int) + k)) \<longrightarrow> ((0 :: int) \<le> int (length ss) \<and> length o4 < length ss) \<and> (1 :: int) \<le> int (length o4)))"
  sorry
end
