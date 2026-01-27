theory vstte12_combinators_Combinators_eqqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  "term" = S | K | App "term" "term"
theorem eq'vc:
  fixes y :: "term"
  fixes x :: "term"
  shows "case y of S \<Rightarrow> (case x of S \<Rightarrow> True | _ \<Rightarrow> True) | K \<Rightarrow> (case x of K \<Rightarrow> True | _ \<Rightarrow> True) | App x1 x2 \<Rightarrow> (case x of App x3 x4 \<Rightarrow> True | _ \<Rightarrow> True)"
  and "\<forall>(result :: bool). (case y of S \<Rightarrow> (case x of S \<Rightarrow> result = True | _ \<Rightarrow> result = False) | K \<Rightarrow> (case x of K \<Rightarrow> result = True | _ \<Rightarrow> result = False) | App x1 x2 \<Rightarrow> (case x of App x3 x4 \<Rightarrow> (if x3 = x1 then result = (if x4 = x2 then True else False) else result = False) | _ \<Rightarrow> result = False)) \<longrightarrow> result = True \<longleftrightarrow> x = y"
  sorry
end
