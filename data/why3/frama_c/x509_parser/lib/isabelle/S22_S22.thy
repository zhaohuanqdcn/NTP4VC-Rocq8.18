theory S22_S22
  imports "NTP4Verif.NTP4Verif" "Why3STD.Qed_Qed"
begin
datatype  s22 = s22'mk (f22_empty_subject: "int") (f22_san_empty: "int") (f22_san_critical: "int") (f22_ca_true: "int") (f22_bc_critical: "int") (f22_has_ski: "int") (f22_has_keyusage: "int") (f22_keycertsign_set: "int") (f22_crlsign_set: "int") (f22_pathlenconstraint_set: "int") (f22_has_name_constraints: "int") (f22_has_crldp: "int") (f22_one_crldp_has_all_reasons: "int") (f22_aki_has_keyidentifier: "int") (f22_self_signed: "int")
end
