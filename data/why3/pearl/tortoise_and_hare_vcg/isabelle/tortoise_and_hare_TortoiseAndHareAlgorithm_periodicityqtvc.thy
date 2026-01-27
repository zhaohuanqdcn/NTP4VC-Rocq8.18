theory tortoise_and_hare_TortoiseAndHareAlgorithm_periodicityqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Iter" "Why3STD.pigeon_Pigeonhole"
begin
consts f :: "int \<Rightarrow> int"
consts m :: "int"
axiomatization where m_positive:   "(0 :: int) < m"
axiomatization where f_range'0:   "(0 :: int) \<le> f x"
 if "(0 :: int) \<le> x"
 and "x < m"
  for x :: "int"
axiomatization where f_range'1:   "f x < m"
 if "(0 :: int) \<le> x"
 and "x < m"
  for x :: "int"
consts x0 :: "int"
axiomatization where x0'def'0:   "(0 :: int) \<le> x0"
axiomatization where x0'def'1:   "x0 < m"
consts f_closure :: "int \<Rightarrow> int"
axiomatization where f_closure_def:   "f_closure y = f y"
  for y :: "int"
definition x :: "int \<Rightarrow> int"
  where "x i = iter f_closure i x0" for i
consts get_closure :: "'a list \<Rightarrow> int \<Rightarrow> 'a"
axiomatization where get_closure_def:   "get_closure y y1 = y ! nat y1"
  for y :: "'a list"
  and y1 :: "int"
theorem periodicity'vc:
  shows "let o1 :: int = x0; o2 :: int list = [o1] in int (length o2) = (1 :: int) \<and> o2 ! (0 :: nat) = o1 \<longrightarrow> (let o3 :: int = m in ((1 :: int) \<le> o3 + (1 :: int) \<longrightarrow> ((((1 :: int) \<le> int (length o2) \<and> int (length o2) = (1 :: int) \<and> (1 :: int) \<le> m) \<and> x0 = o2 ! nat (int (length o2) - (1 :: int))) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length o2) \<longrightarrow> o2 ! nat i = x i) \<and> distinct o2) \<and> (\<forall>(cur :: int) (s :: int list). (((1 :: int) \<le> int (length s) \<and> int (length s) \<le> o3) \<and> (((1 :: int) \<le> int (length s) \<and> int (length s) \<le> m) \<and> cur = s ! nat (int (length s) - (1 :: int))) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length s) \<longrightarrow> s ! nat i = x i) \<and> distinct s \<longrightarrow> (let o4 :: int = int (length s) - (1 :: int) in ((0 :: int) \<le> o4 + (1 :: int) \<longrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> \<not>s ! nat i = f cur) \<and> (\<forall>(mu :: int). ((0 :: int) \<le> mu \<and> mu \<le> o4) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < mu \<longrightarrow> \<not>s ! nat i = f cur) \<longrightarrow> (if f cur = s ! nat mu then let o5 :: int = int (length s) - mu in (((0 :: int) \<le> mu \<and> mu < m) \<and> ((1 :: int) \<le> o5 \<and> o5 \<le> m) \<and> mu + o5 \<le> m \<and> x (mu + o5) = x mu) \<and> (\<forall>(i :: int) (j :: int). (0 :: int) \<le> i \<and> i < j \<and> j < mu + o5 \<longrightarrow> \<not>x i = x j) else \<forall>(i :: int). (0 :: int) \<le> i \<and> i < mu + (1 :: int) \<longrightarrow> \<not>s ! nat i = f cur)) \<and> ((\<forall>(i :: int). (0 :: int) \<le> i \<and> i < o4 + (1 :: int) \<longrightarrow> \<not>s ! nat i = f cur) \<longrightarrow> (let o5 :: int list = s @ [f cur] in int (length o5) = (1 :: int) + int (length s) \<and> o5 ! length s = f cur \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length s) \<longrightarrow> o5 ! nat i = s ! nat i) \<longrightarrow> (int (length s) = m \<longrightarrow> (let o6 :: int \<Rightarrow> int = get_closure o5; o7 :: int = m; o8 :: int = m + (1 :: int) in ((0 :: int) \<le> o7 \<and> o7 < o8) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < o8 \<longrightarrow> (0 :: int) \<le> o6 i \<and> o6 i < o7))) \<and> ((int (length s) = m \<longrightarrow> (let o6 :: int \<Rightarrow> int = get_closure o5 in \<exists>(i1 :: int) (i2 :: int). ((0 :: int) \<le> i1 \<and> i1 < i2 \<and> i2 < m + (1 :: int)) \<and> o6 i1 = o6 i2)) \<longrightarrow> (((1 :: int) \<le> int (length o5) \<and> int (length o5) = int (length s) + (1 :: int) \<and> int (length s) + (1 :: int) \<le> m) \<and> f cur = o5 ! nat (int (length o5) - (1 :: int))) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length o5) \<longrightarrow> o5 ! nat i = x i) \<and> distinct o5)))) \<and> (o4 + (1 :: int) < (0 :: int) \<longrightarrow> (let o5 :: int list = s @ [f cur] in int (length o5) = (1 :: int) + int (length s) \<and> o5 ! length s = f cur \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length s) \<longrightarrow> o5 ! nat i = s ! nat i) \<longrightarrow> (int (length s) = m \<longrightarrow> (let o6 :: int \<Rightarrow> int = get_closure o5; o7 :: int = m; o8 :: int = m + (1 :: int) in ((0 :: int) \<le> o7 \<and> o7 < o8) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < o8 \<longrightarrow> (0 :: int) \<le> o6 i \<and> o6 i < o7))) \<and> ((int (length s) = m \<longrightarrow> (let o6 :: int \<Rightarrow> int = get_closure o5 in \<exists>(i1 :: int) (i2 :: int). ((0 :: int) \<le> i1 \<and> i1 < i2 \<and> i2 < m + (1 :: int)) \<and> o6 i1 = o6 i2)) \<longrightarrow> (((1 :: int) \<le> int (length o5) \<and> int (length o5) = int (length s) + (1 :: int) \<and> int (length s) + (1 :: int) \<le> m) \<and> f cur = o5 ! nat (int (length o5) - (1 :: int))) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length o5) \<longrightarrow> o5 ! nat i = x i) \<and> distinct o5))))) \<and> \<not>((((1 :: int) \<le> int (length s) \<and> int (length s) = o3 + (1 :: int) \<and> o3 + (1 :: int) \<le> m) \<and> cur = s ! nat (int (length s) - (1 :: int))) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length s) \<longrightarrow> s ! nat i = x i) \<and> distinct s))) \<and> \<not>o3 + (1 :: int) < (1 :: int))"
  sorry
end
