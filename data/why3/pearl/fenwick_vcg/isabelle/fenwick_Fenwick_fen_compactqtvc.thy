theory fenwick_Fenwick_fen_compactqtvc
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
consts mixfix_lbrb_closure :: "'a list \<Rightarrow> int \<Rightarrow> 'a"
axiomatization where mixfix_lbrb_closure_def:   "mixfix_lbrb_closure y y1 = y ! nat y1"
  for y :: "'a list"
  and y1 :: "int"
theorem fen_compact'vc:
  fixes a :: "int"
  fixes b :: "int"
  fixes f :: "fenwick"
  assumes fact0: "(0 :: int) \<le> a"
  assumes fact1: "a \<le> b"
  assumes fact2: "(2 :: int) * b < int (length (t f))"
  assumes fact3: "valid f"
  shows "sum (mixfix_lbrb_closure (t f)) a b = sum (mixfix_lbrb_closure (t f)) ((2 :: int) * a + (1 :: int)) ((2 :: int) * b + (1 :: int))"
  sorry
end
