theory WellFounded_WellFounded
  imports "NTP4Verif.NTP4Verif"
begin
inductive acc :: "('a \<Rightarrow> 'a \<Rightarrow> bool) \<Rightarrow> 'a \<Rightarrow> bool" where
   acc_x: "\<forall>(y :: 'a). r y x = True \<longrightarrow> acc r y \<Longrightarrow> acc r x" for r :: "'a \<Rightarrow> 'a \<Rightarrow> bool" and x :: "'a"
definition well_founded :: "('a \<Rightarrow> 'a \<Rightarrow> bool) \<Rightarrow> _"
  where "well_founded r \<longleftrightarrow> (\<forall>(x :: 'a). acc r x)" for r
end
