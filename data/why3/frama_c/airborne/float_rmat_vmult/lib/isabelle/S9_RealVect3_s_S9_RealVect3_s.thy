theory S9_RealVect3_s_S9_RealVect3_s
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed"
begin
datatype  s9_realvect3_s = s9_realvect3_s'mk (f9_realvect3_s_x: "real") (f9_realvect3_s_y: "real") (f9_realvect3_s_z: "real")
definition eqs9_realvect3_s :: "s9_realvect3_s \<Rightarrow> s9_realvect3_s \<Rightarrow> _"
  where "eqs9_realvect3_s s s_1 \<longleftrightarrow> f9_realvect3_s_x s_1 = f9_realvect3_s_x s \<and> f9_realvect3_s_y s_1 = f9_realvect3_s_y s \<and> f9_realvect3_s_z s_1 = f9_realvect3_s_z s" for s s_1
end
