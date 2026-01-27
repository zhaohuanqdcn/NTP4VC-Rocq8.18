theory int_Div2
  imports "NTP4Verif.NTP4Verif"
begin
axiomatization where div2:   "\<exists>(y :: int). x = (2 :: int) * y \<or> x = (2 :: int) * y + (1 :: int)"
  for x :: "int"
end
