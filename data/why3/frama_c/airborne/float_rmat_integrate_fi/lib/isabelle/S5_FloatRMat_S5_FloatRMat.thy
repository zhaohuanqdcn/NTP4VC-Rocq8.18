theory S5_FloatRMat_S5_FloatRMat
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed"
begin
datatype  s5_floatrmat = s5_floatrmat'mk (f5_floatrmat_m: "int \<Rightarrow> real")
end
