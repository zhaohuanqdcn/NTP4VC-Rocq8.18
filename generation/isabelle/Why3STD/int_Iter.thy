theory int_Iter
  imports "NTP4Verif.NTP4Verif"
begin
consts iter :: "('a \<Rightarrow> 'a) \<Rightarrow> int \<Rightarrow> 'a \<Rightarrow> 'a"
axiomatization where iter'def:   "if k = (0 :: int) then iter f k x = x else iter f k x = iter f (k - (1 :: int)) (f x)"
 if "(0 :: int) \<le> k"
  for k :: "int"
  and f :: "'a \<Rightarrow> 'a"
  and x :: "'a"
axiomatization where iter_1:   "iter f (1 :: int) x = f x"
  for f :: "'a \<Rightarrow> 'a"
  and x :: "'a"
axiomatization where iter_s:   "iter f k x = f (iter f (k - (1 :: int)) x)"
 if "(0 :: int) < k"
  for k :: "int"
  and f :: "'a \<Rightarrow> 'a"
  and x :: "'a"
end
