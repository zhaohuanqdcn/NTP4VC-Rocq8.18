theory amortization_Top_clientqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  elt
typedecl  queue
consts size :: "queue \<Rightarrow> int"
consts credits :: "queue \<Rightarrow> int"
axiomatization where queue'invariant'0:   "(0 :: int) \<le> size self"
  for self :: "queue"
axiomatization where queue'invariant'1:   "(0 :: int) \<le> credits self"
  for self :: "queue"
axiomatization where queue'invariant'2:   "credits self \<le> size self"
  for self :: "queue"
theorem client'vc:
  fixes n :: "int"
  fixes o1 :: "queue"
  fixes clock :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "size o1 = (0 :: int)"
  assumes fact2: "credits o1 = (0 :: int)"
  shows "let o2 :: int = n - (1 :: int) in ((0 :: int) \<le> o2 + (1 :: int) \<longrightarrow> ((size o1 = credits o1 \<and> credits o1 = (0 :: int)) \<and> clock = clock + (0 :: int)) \<and> (\<forall>(q :: queue) (clock1 :: int). (((0 :: int) \<le> credits q \<and> credits q \<le> o2) \<and> size q = credits q \<and> clock1 = clock + credits q \<longrightarrow> (\<forall>(o3 :: queue). size o3 = size q + (1 :: int) \<and> credits o3 = credits q + (1 :: int) \<longrightarrow> (size o3 = credits o3 \<and> credits o3 = credits q + (1 :: int)) \<and> clock1 + (1 :: int) = clock + (credits q + (1 :: int)))) \<and> ((size q = credits q \<and> credits q = o2 + (1 :: int)) \<and> clock1 = clock + (o2 + (1 :: int)) \<longrightarrow> (let o3 :: int = n - (1 :: int) in ((0 :: int) \<le> o3 + (1 :: int) \<longrightarrow> (size q = n - (0 :: int) \<and> clock1 = clock + credits q + (0 :: int)) \<and> (\<forall>(q1 :: queue) (clock2 :: int). (\<forall>(k :: int). ((0 :: int) \<le> k \<and> k \<le> o3) \<and> size q1 = n - k \<and> clock2 = clock + credits q1 + k \<longrightarrow> (0 :: int) < size q1 \<and> (\<forall>(clock3 :: int) (r :: queue). size r = size q1 - (1 :: int) \<and> credits r \<le> credits q1 \<and> clock3 = clock2 + (1 :: int) + credits r - credits q1 \<longrightarrow> size r = n - (k + (1 :: int)) \<and> clock3 = clock + credits r + (k + (1 :: int)))) \<and> (size q1 = n - (o3 + (1 :: int)) \<and> clock2 = clock + credits q1 + (o3 + (1 :: int)) \<longrightarrow> clock2 \<le> clock + (2 :: int) * n))) \<and> (o3 + (1 :: int) < (0 :: int) \<longrightarrow> clock1 \<le> clock + (2 :: int) * n))))) \<and> (o2 + (1 :: int) < (0 :: int) \<longrightarrow> (let o3 :: int = n - (1 :: int) in ((0 :: int) \<le> o3 + (1 :: int) \<longrightarrow> (size o1 = n - (0 :: int) \<and> clock = clock + credits o1 + (0 :: int)) \<and> (\<forall>(q :: queue) (clock1 :: int). (\<forall>(k :: int). ((0 :: int) \<le> k \<and> k \<le> o3) \<and> size q = n - k \<and> clock1 = clock + credits q + k \<longrightarrow> (0 :: int) < size q \<and> (\<forall>(clock2 :: int) (r :: queue). size r = size q - (1 :: int) \<and> credits r \<le> credits q \<and> clock2 = clock1 + (1 :: int) + credits r - credits q \<longrightarrow> size r = n - (k + (1 :: int)) \<and> clock2 = clock + credits r + (k + (1 :: int)))) \<and> (size q = n - (o3 + (1 :: int)) \<and> clock1 = clock + credits q + (o3 + (1 :: int)) \<longrightarrow> clock1 \<le> clock + (2 :: int) * n))) \<and> (o3 + (1 :: int) < (0 :: int) \<longrightarrow> clock \<le> clock + (2 :: int) * n)))"
  sorry
end
