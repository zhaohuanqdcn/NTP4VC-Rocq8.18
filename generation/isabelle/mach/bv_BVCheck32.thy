theory bv_BVCheck32
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
axiomatization where not_greater_than_64:   "(32 :: int) \<le> (64 :: int)"
end
