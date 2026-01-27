theory arm_M_insertion_sortqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition inv :: "int list \<Rightarrow> _"
  where "inv a \<longleftrightarrow> a ! (0 :: nat) = (0 :: int) \<and> int (length a) = (11 :: int) \<and> (\<forall>(k :: int). (1 :: int) \<le> k \<and> k \<le> (10 :: int) \<longrightarrow> (0 :: int) < a ! nat k)" for a
theorem insertion_sort'vc:
  fixes a :: "int list"
  assumes fact0: "inv a"
  shows "(2 :: int) \<le> (2 :: int)"
  and "(2 :: int) \<le> (11 :: int)"
  and "inv a"
  and "(0 :: int) = (2 :: int) - (2 :: int)"
  and "(2 :: int) * (0 :: int) \<le> ((2 :: int) - (2 :: int)) * ((2 :: int) - (1 :: int))"
  and "\<forall>(i :: int) (loop2 :: int) (a1 :: int list). length a1 = length a \<longrightarrow> ((2 :: int) \<le> i \<and> i \<le> (11 :: int)) \<and> inv a1 \<and> (2 :: int) * loop2 \<le> (i - (2 :: int)) * (i - (1 :: int)) \<longrightarrow> (if i \<le> (10 :: int) then (((1 :: int) \<le> i \<and> i \<le> i) \<and> inv a1 \<and> (2 :: int) * loop2 \<le> (i - (2 :: int)) * (i - (1 :: int)) + (2 :: int) * (i - i)) \<and> (\<forall>(j :: int) (loop21 :: int) (a2 :: int list). length a2 = length a1 \<longrightarrow> ((1 :: int) \<le> j \<and> j \<le> i) \<and> inv a2 \<and> (2 :: int) * loop21 \<le> (i - (2 :: int)) * (i - (1 :: int)) + (2 :: int) * (i - j) \<longrightarrow> (let o1 :: int = j - (1 :: int) in ((0 :: int) \<le> o1 \<and> o1 < int (length a2)) \<and> ((0 :: int) \<le> j \<and> j < int (length a2)) \<and> (if a2 ! nat j < a2 ! nat o1 then ((0 :: int) \<le> j \<and> j < int (length a2)) \<and> (let temp :: int = a2 ! nat j; o2 :: int = j - (1 :: int) in ((0 :: int) \<le> o2 \<and> o2 < int (length a2)) \<and> (let o3 :: int = a2 ! nat o2 in ((0 :: int) \<le> j \<and> j < int (length a2)) \<and> (length (a2[nat j := o3]) = length a2 \<longrightarrow> nth (a2[nat j := o3]) o nat = (nth a2 o nat)(j := o3) \<longrightarrow> (let o4 :: int = j - (1 :: int) in ((0 :: int) \<le> o4 \<and> o4 < int (length (a2[nat j := o3]))) \<and> (length (a2[nat o4 := temp, nat j := o3]) = length (a2[nat j := o3]) \<longrightarrow> nth (a2[nat o4 := temp, nat j := o3]) o nat = (nth (a2[nat j := o3]) o nat)(o4 := temp) \<longrightarrow> ((0 :: int) \<le> j \<and> j - (1 :: int) < j) \<and> ((1 :: int) \<le> j - (1 :: int) \<and> j - (1 :: int) \<le> i) \<and> inv (a2[nat o4 := temp, nat j := o3]) \<and> (2 :: int) * (loop21 + (1 :: int)) \<le> (i - (2 :: int)) * (i - (1 :: int)) + (2 :: int) * (i - (j - (1 :: int)))))))) else ((0 :: int) \<le> (10 :: int) - i \<and> (10 :: int) - (i + (1 :: int)) < (10 :: int) - i) \<and> ((2 :: int) \<le> i + (1 :: int) \<and> i + (1 :: int) \<le> (11 :: int)) \<and> inv a2 \<and> i - (2 :: int) + (1 :: int) = i + (1 :: int) - (2 :: int) \<and> (2 :: int) * loop21 \<le> (i + (1 :: int) - (2 :: int)) * (i + (1 :: int) - (1 :: int))))) else i - (2 :: int) = (9 :: int) \<and> loop2 \<le> (45 :: int))"
  sorry
end
