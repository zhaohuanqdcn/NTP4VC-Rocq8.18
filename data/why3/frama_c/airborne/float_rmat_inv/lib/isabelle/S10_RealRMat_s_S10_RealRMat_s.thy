theory S10_RealRMat_s_S10_RealRMat_s
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed"
begin
datatype  s10_realrmat_s = s10_realrmat_s'mk (f10_realrmat_s_a00: "real") (f10_realrmat_s_a01: "real") (f10_realrmat_s_a02: "real") (f10_realrmat_s_a10: "real") (f10_realrmat_s_a11: "real") (f10_realrmat_s_a12: "real") (f10_realrmat_s_a20: "real") (f10_realrmat_s_a21: "real") (f10_realrmat_s_a22: "real")
definition eqs10_realrmat_s :: "s10_realrmat_s \<Rightarrow> s10_realrmat_s \<Rightarrow> _"
  where "eqs10_realrmat_s s s_1 \<longleftrightarrow> f10_realrmat_s_a00 s_1 = f10_realrmat_s_a00 s \<and> f10_realrmat_s_a01 s_1 = f10_realrmat_s_a01 s \<and> f10_realrmat_s_a02 s_1 = f10_realrmat_s_a02 s \<and> f10_realrmat_s_a10 s_1 = f10_realrmat_s_a10 s \<and> f10_realrmat_s_a11 s_1 = f10_realrmat_s_a11 s \<and> f10_realrmat_s_a12 s_1 = f10_realrmat_s_a12 s \<and> f10_realrmat_s_a20 s_1 = f10_realrmat_s_a20 s \<and> f10_realrmat_s_a21 s_1 = f10_realrmat_s_a21 s \<and> f10_realrmat_s_a22 s_1 = f10_realrmat_s_a22 s" for s s_1
end
