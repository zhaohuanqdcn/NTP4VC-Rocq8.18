theory S11_RealQuat_s_S11_RealQuat_s
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed"
begin
datatype  s11_realquat_s = s11_realquat_s'mk (f11_realquat_s_qi: "real") (f11_realquat_s_qx: "real") (f11_realquat_s_qy: "real") (f11_realquat_s_qz: "real")
definition eqs11_realquat_s :: "s11_realquat_s \<Rightarrow> s11_realquat_s \<Rightarrow> _"
  where "eqs11_realquat_s s s_1 \<longleftrightarrow> f11_realquat_s_qi s_1 = f11_realquat_s_qi s \<and> f11_realquat_s_qx s_1 = f11_realquat_s_qx s \<and> f11_realquat_s_qy s_1 = f11_realquat_s_qy s \<and> f11_realquat_s_qz s_1 = f11_realquat_s_qz s" for s s_1
end
