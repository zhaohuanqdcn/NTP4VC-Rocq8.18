theory ieee_float_RoundingMode
  imports "NTP4Verif.NTP4Verif"
begin
datatype  mode = RNE | RNA | RTP | RTN | RTZ
definition to_nearest :: "mode \<Rightarrow> _"
  where "to_nearest m \<longleftrightarrow> m = RNE \<or> m = RNA" for m
end
