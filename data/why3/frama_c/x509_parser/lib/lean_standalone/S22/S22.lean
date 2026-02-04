namespace S22
structure s22 where
  f22_empty_subject : ℤ
  f22_san_empty : ℤ
  f22_san_critical : ℤ
  f22_ca_true : ℤ
  f22_bc_critical : ℤ
  f22_has_ski : ℤ
  f22_has_keyusage : ℤ
  f22_keycertsign_set : ℤ
  f22_crlsign_set : ℤ
  f22_pathlenconstraint_set : ℤ
  f22_has_name_constraints : ℤ
  f22_has_crldp : ℤ
  f22_one_crldp_has_all_reasons : ℤ
  f22_aki_has_keyidentifier : ℤ
  f22_self_signed : ℤ
axiom inhabited_axiom_s22 : Inhabited s22
attribute [instance] inhabited_axiom_s22
end S22
