theory fenwick_Fenwick_makeqtvc
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
theorem make'vc:
  fixes lv :: "int"
  assumes fact0: "(0 :: int) \<le> lv"
  shows "if lv = (0 :: int) then (0 :: int) \<le> (0 :: int) else (0 :: int) \<le> (2 :: int) * lv - (1 :: int)"
  and "\<forall>(o1 :: int list). (if lv = (0 :: int) then (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> o1 ! nat i = (0 :: int)) \<and> int (length o1) = (0 :: int) else let o2 :: int = (2 :: int) * lv - (1 :: int) in (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < o2 \<longrightarrow> o1 ! nat i = (0 :: int)) \<and> int (length o1) = o2) \<longrightarrow> (let result :: fenwick = fenwick'mk o1 lv in valid result \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < lv \<longrightarrow> get result i = (0 :: int)))"
  sorry
end
