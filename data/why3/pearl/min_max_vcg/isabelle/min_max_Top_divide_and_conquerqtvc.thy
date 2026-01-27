theory min_max_Top_divide_and_conquerqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition is_min :: "int \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_min m a lo hi \<longleftrightarrow> (\<exists>(i :: int). (lo \<le> i \<and> i < hi \<and> hi \<le> int (length a)) \<and> a ! nat i = m) \<and> (\<forall>(i :: int). lo \<le> i \<and> i < hi \<longrightarrow> m \<le> a ! nat i)" for m a lo hi
definition is_max :: "int \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_max m a lo hi \<longleftrightarrow> (\<exists>(i :: int). (lo \<le> i \<and> i < hi \<and> hi \<le> int (length a)) \<and> a ! nat i = m) \<and> (\<forall>(i :: int). lo \<le> i \<and> i < hi \<longrightarrow> a ! nat i \<le> m)" for m a lo hi
theorem divide_and_conquer'vc:
  fixes lo :: "int"
  fixes hi :: "int"
  fixes a :: "int list"
  assumes fact0: "(0 :: int) \<le> lo"
  assumes fact1: "lo < hi"
  assumes fact2: "hi \<le> int (length a)"
  shows "let o1 :: int = hi - lo in (if o1 = (1 :: int) then (0 :: int) \<le> lo \<and> lo < int (length a) else if hi - lo = (2 :: int) then let o2 :: int = lo + (1 :: int) in ((0 :: int) \<le> o2 \<and> o2 < int (length a)) \<and> ((0 :: int) \<le> lo \<and> lo < int (length a)) \<and> (if a ! nat lo < a ! nat o2 then let o3 :: int = lo + (1 :: int) in ((0 :: int) \<le> o3 \<and> o3 < int (length a)) \<and> (0 :: int) \<le> lo \<and> lo < int (length a) else ((0 :: int) \<le> lo \<and> lo < int (length a)) \<and> (let o3 :: int = lo + (1 :: int) in (0 :: int) \<le> o3 \<and> o3 < int (length a))) else \<not>(2 :: int) = (0 :: int) \<and> (let mid :: int = lo + (hi - lo) cdiv (2 :: int) in (((0 :: int) \<le> hi - lo \<and> mid - lo < hi - lo) \<and> (0 :: int) \<le> lo \<and> lo < mid \<and> mid \<le> int (length a)) \<and> (\<forall>(x1 :: int) (y1 :: int). is_min x1 a lo mid \<and> is_max y1 a lo mid \<longrightarrow> ((0 :: int) \<le> hi - lo \<and> hi - mid < hi - lo) \<and> (0 :: int) \<le> mid \<and> mid < hi \<and> hi \<le> int (length a)))) \<and> (\<forall>(x :: int) (y :: int). (if o1 = (1 :: int) then x = a ! nat lo \<and> y = a ! nat lo else if hi - lo = (2 :: int) then if a ! nat lo < a ! nat (lo + (1 :: int)) then x = a ! nat lo \<and> y = a ! nat (lo + (1 :: int)) else x = a ! nat (lo + (1 :: int)) \<and> y = a ! nat lo else let mid :: int = lo + (hi - lo) cdiv (2 :: int) in \<exists>(x1 :: int) (y1 :: int). (is_min x1 a lo mid \<and> is_max y1 a lo mid) \<and> (\<exists>(x2 :: int) (y2 :: int). (is_min x2 a mid hi \<and> is_max y2 a mid hi) \<and> (if y2 < y1 then y = y1 else y = y2) \<and> (if x1 < x2 then x = x1 else x = x2))) \<longrightarrow> is_min x a lo hi \<and> is_max y a lo hi)"
  sorry
end
