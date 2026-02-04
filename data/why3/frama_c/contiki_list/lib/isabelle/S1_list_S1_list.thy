theory S1_list_S1_list
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed" "Why3STD.Memory_Memory"
begin
datatype  s1_list = s1_list'mk (f1_list_next: "addr") (f1_list_x: "real") (f1_list_y: "real") (f1_list_z: "real")
definition eqs1_list :: "s1_list \<Rightarrow> s1_list \<Rightarrow> _"
  where "eqs1_list s s_1 \<longleftrightarrow> f1_list_next s_1 = f1_list_next s \<and> f1_list_x s_1 = f1_list_x s \<and> f1_list_y s_1 = f1_list_y s \<and> f1_list_z s_1 = f1_list_z s" for s s_1
end
