theory balance_Roberval
  imports "NTP4Verif.NTP4Verif"
begin
datatype  outcome = Left | Equal | Right
typedecl  counter
consts v :: "counter \<Rightarrow> int"
end
