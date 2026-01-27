theory array_Inversions
  imports "NTP4Verif.NTP4Verif" int_NumOf int_Sum map_MapExchange
begin
definition inversion :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "inversion a i j \<longleftrightarrow> a ! nat j < a ! nat i" for a i j
consts inversion_closure :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> bool"
axiomatization where inversion_closure_def:   "inversion_closure y y1 y2 = True \<longleftrightarrow> inversion y y1 y2"
  for y :: "int list"
  and y1 :: "int"
  and y2 :: "int"
definition inversions_for :: "int list \<Rightarrow> int \<Rightarrow> int"
  where "inversions_for a i = numof (inversion_closure a i) i (int (length a))" for a i
consts inversions_for_closure :: "int list \<Rightarrow> int \<Rightarrow> int"
axiomatization where inversions_for_closure_def:   "inversions_for_closure y y1 = inversions_for y y1"
  for y :: "int list"
  and y1 :: "int"
definition inversions :: "int list \<Rightarrow> int"
  where "inversions a = sum (inversions_for_closure a) (0 :: int) (int (length a))" for a
axiomatization where exchange_inversion:   "inversions a2 < inversions a1"
 if "(0 :: int) \<le> i0"
 and "i0 < int (length a1) - (1 :: int)"
 and "a1 ! nat (i0 + (1 :: int)) < a1 ! nat i0"
 and "list_exchange a1 a2 i0 (i0 + (1 :: int))"
  for i0 :: "int"
  and a1 :: "int list"
  and a2 :: "int list"
end
