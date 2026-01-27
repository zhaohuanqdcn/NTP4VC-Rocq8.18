theory int_IntInf
  imports "NTP4Verif.NTP4Verif"
begin
datatype  t = Finite "int" | Infinite
definition add :: "t \<Rightarrow> t \<Rightarrow> t"
  where "add x y = (case x of Infinite \<Rightarrow> Infinite | Finite x1 \<Rightarrow> (case y of Infinite \<Rightarrow> Infinite | Finite y1 \<Rightarrow> Finite (x1 + y1)))" for x y
definition eq :: "t \<Rightarrow> t \<Rightarrow> _"
  where "eq x y \<longleftrightarrow> (case (x, y) of (Infinite, Infinite) \<Rightarrow> True | (Finite x1, Finite y1) \<Rightarrow> x1 = y1 | (_, _) \<Rightarrow> False)" for x y
definition lt :: "t \<Rightarrow> t \<Rightarrow> _"
  where "lt x y \<longleftrightarrow> (case x of Infinite \<Rightarrow> False | Finite x1 \<Rightarrow> (case y of Infinite \<Rightarrow> True | Finite y1 \<Rightarrow> x1 < y1))" for x y
definition le :: "t \<Rightarrow> t \<Rightarrow> _"
  where "le x y \<longleftrightarrow> lt x y \<or> eq x y" for x y
axiomatization where Refl:   "le x x"
  for x :: "t"
axiomatization where Trans:   "le x z"
 if "le x y"
 and "le y z"
  for x :: "t"
  and y :: "t"
  and z :: "t"
axiomatization where Antisymm:   "x = y"
 if "le x y"
 and "le y x"
  for x :: "t"
  and y :: "t"
axiomatization where Total:   "le x y \<or> le y x"
  for x :: "t"
  and y :: "t"
end
