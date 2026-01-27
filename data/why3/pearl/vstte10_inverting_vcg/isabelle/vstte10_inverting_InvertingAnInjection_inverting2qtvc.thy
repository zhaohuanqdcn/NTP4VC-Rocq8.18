theory vstte10_inverting_InvertingAnInjection_inverting2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.map_MapInjection"
begin
definition injective :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "injective a n \<longleftrightarrow> map_MapInjection.injective (nth a o nat) n" for a n
definition surjective :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "surjective a n \<longleftrightarrow> map_MapInjection.surjective (nth a o nat) n" for a n
definition range :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "range a n \<longleftrightarrow> map_MapInjection.range (nth a o nat) n" for a n
theorem inverting2'vc:
  fixes a :: "int list"
  assumes fact0: "injective a (int (length a))"
  assumes fact1: "range a (int (length a))"
  shows "(0 :: int) \<le> int (length a)"
  and "\<forall>(b :: int list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length a) \<longrightarrow> b ! nat i = (0 :: int)) \<and> length b = length a \<longrightarrow> (let o1 :: int = int (length a) - (1 :: int) in ((0 :: int) \<le> o1 + (1 :: int) \<longrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < (0 :: int) \<longrightarrow> b ! nat (a ! nat j) = j) \<and> (\<forall>(b1 :: int list). length b1 = length b \<longrightarrow> (\<forall>(i :: int). ((0 :: int) \<le> i \<and> i \<le> o1) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> b1 ! nat (a ! nat j) = j) \<longrightarrow> ((0 :: int) \<le> i \<and> i < int (length a)) \<and> (let o2 :: int = a ! nat i in ((0 :: int) \<le> o2 \<and> o2 < int (length b1)) \<and> (length (b1[nat o2 := i]) = length b1 \<longrightarrow> nth (b1[nat o2 := i]) o nat = (nth b1 o nat)(o2 := i) \<longrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i + (1 :: int) \<longrightarrow> b1[nat o2 := i] ! nat (a ! nat j) = j)))) \<and> ((\<forall>(j :: int). (0 :: int) \<le> j \<and> j < o1 + (1 :: int) \<longrightarrow> b1 ! nat (a ! nat j) = j) \<longrightarrow> length b1 = length a \<and> injective b1 (int (length a)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length a) \<longrightarrow> b1 ! nat (a ! nat i) = i)))) \<and> (o1 + (1 :: int) < (0 :: int) \<longrightarrow> length b = length a \<and> injective b (int (length a)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length a) \<longrightarrow> b ! nat (a ! nat i) = i)))"
  sorry
end
