theory fenwick_Fenwick_addqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Sum"
begin
datatype  fenwick = fenwick'mk (t: "int list") (leaves: "int")
definition valid :: "fenwick \<Rightarrow> _"
  where "valid f \<longleftrightarrow> (0 :: int) \<le> leaves f \<and> int (length (t f)) = (if leaves f = (0 :: int) then 0 :: int else (2 :: int) * leaves f - (1 :: int)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < leaves f - (1 :: int) \<longrightarrow> t f ! nat i = t f ! nat ((2 :: int) * i + (1 :: int)) + t f ! nat ((2 :: int) * i + (2 :: int)))" for f
definition get :: "fenwick \<Rightarrow> int \<Rightarrow> int"
  where "get f i = t f ! nat (i + leaves f - (1 :: int))" for f i
consts get_closure :: "fenwick \<Rightarrow> int \<Rightarrow> int"
axiomatization where get_closure_def:   "get_closure y y1 = get y y1"
  for y :: "fenwick"
  and y1 :: "int"
definition rget :: "fenwick \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int"
  where "rget f a b = sum (get_closure f) a b" for f a b
theorem add'vc:
  fixes l :: "int"
  fixes f :: "fenwick"
  fixes x :: "int"
  assumes fact0: "(0 :: int) \<le> l"
  assumes fact1: "l < leaves f"
  assumes fact2: "valid f"
  shows "\<not>(2 :: int) = (0 :: int)"
  and "let o1 :: int = int (length (t f)) cdiv (2 :: int) + l; o2 :: int list = t f in ((0 :: int) \<le> o1 \<and> o1 < int (length o2)) \<and> (let o3 :: int = o2 ! nat o1 + x; o4 :: int list = t f in ((0 :: int) \<le> o1 \<and> o1 < int (length o4)) \<and> (\<forall>(f1 :: fenwick). let o5 :: int list = t f1 in length (t f1) = length o4 \<longrightarrow> f1 = fenwick'mk (t f1) (leaves f) \<and> length (t f1) = length (t f) \<longrightarrow> nth o5 o nat = (nth o4 o nat)(o1 := o3) \<and> o5 = o4[nat o1 := o3] \<longrightarrow> (((0 :: int) \<le> o1 \<and> o1 < int (length (t f1))) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < leaves f1 - (1 :: int) \<longrightarrow> t f1 ! nat i = t f1 ! nat ((2 :: int) * i + (1 :: int)) + t f1 ! nat ((2 :: int) * i + (2 :: int)) - (if (2 :: int) * i + (1 :: int) \<le> o1 \<and> o1 \<le> (2 :: int) * i + (2 :: int) then x else (0 :: int)))) \<and> (\<forall>(lc :: int) (f2 :: fenwick). f2 = fenwick'mk (t f2) (leaves f1) \<and> length (t f2) = length (t f1) \<longrightarrow> ((0 :: int) \<le> lc \<and> lc < int (length (t f2))) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < leaves f2 - (1 :: int) \<longrightarrow> t f2 ! nat i = t f2 ! nat ((2 :: int) * i + (1 :: int)) + t f2 ! nat ((2 :: int) * i + (2 :: int)) - (if (2 :: int) * i + (1 :: int) \<le> lc \<and> lc \<le> (2 :: int) * i + (2 :: int) then x else (0 :: int))) \<and> (\<forall>(i :: int). leaves f2 - (1 :: int) \<le> i \<and> i < int (length (t f2)) \<longrightarrow> t f2 ! nat i = t f1 ! nat i) \<longrightarrow> (if \<not>lc = (0 :: int) then \<not>(2 :: int) = (0 :: int) \<and> (let o6 :: int list = t f2 in ((0 :: int) \<le> (lc - (1 :: int)) cdiv (2 :: int) \<and> (lc - (1 :: int)) cdiv (2 :: int) < int (length o6)) \<and> (let o7 :: int = o6 ! nat ((lc - (1 :: int)) cdiv (2 :: int)) + x; o8 :: int list = t f2 in ((0 :: int) \<le> (lc - (1 :: int)) cdiv (2 :: int) \<and> (lc - (1 :: int)) cdiv (2 :: int) < int (length o8)) \<and> (\<forall>(f3 :: fenwick). let o9 :: int list = t f3 in length (t f3) = length o8 \<longrightarrow> f3 = fenwick'mk (t f3) (leaves f2) \<and> length (t f3) = length (t f2) \<longrightarrow> nth o9 o nat = (nth o8 o nat)((lc - (1 :: int)) cdiv (2 :: int) := o7) \<and> o9 = o8[nat ((lc - (1 :: int)) cdiv (2 :: int)) := o7] \<longrightarrow> ((0 :: int) \<le> lc \<and> (lc - (1 :: int)) cdiv (2 :: int) < lc) \<and> ((0 :: int) \<le> (lc - (1 :: int)) cdiv (2 :: int) \<and> (lc - (1 :: int)) cdiv (2 :: int) < int (length (t f3))) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < leaves f3 - (1 :: int) \<longrightarrow> t f3 ! nat i = t f3 ! nat ((2 :: int) * i + (1 :: int)) + t f3 ! nat ((2 :: int) * i + (2 :: int)) - (if (2 :: int) * i + (1 :: int) \<le> (lc - (1 :: int)) cdiv (2 :: int) \<and> (lc - (1 :: int)) cdiv (2 :: int) \<le> (2 :: int) * i + (2 :: int) then x else (0 :: int))) \<and> (\<forall>(i :: int). leaves f3 - (1 :: int) \<le> i \<and> i < int (length (t f3)) \<longrightarrow> t f3 ! nat i = t f1 ! nat i)))) else valid f2 \<and> (\<forall>(i :: int). ((0 :: int) \<le> i \<and> i < leaves f2) \<and> \<not>i = l \<longrightarrow> get f2 i = get f i) \<and> get f2 l = get f l + x))))"
  sorry
end
