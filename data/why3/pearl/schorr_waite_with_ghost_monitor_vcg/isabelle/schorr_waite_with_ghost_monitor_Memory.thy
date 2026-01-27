theory schorr_waite_with_ghost_monitor_Memory
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  loc
consts null :: "loc"
typedecl  memory
consts left1 :: "memory \<Rightarrow> loc \<Rightarrow> loc"
consts right1 :: "memory \<Rightarrow> loc \<Rightarrow> loc"
consts mark :: "memory \<Rightarrow> loc \<Rightarrow> bool"
consts color :: "memory \<Rightarrow> loc \<Rightarrow> bool"
definition update :: "(loc \<Rightarrow> 'a) \<Rightarrow> (loc \<Rightarrow> 'a) \<Rightarrow> loc \<Rightarrow> 'a \<Rightarrow> _"
  where "update m1 m2 l v \<longleftrightarrow> m1 l = v \<and> (\<forall>(x :: loc). \<not>x = l \<longrightarrow> m1 x = m2 x)" for m1 m2 l v
end
