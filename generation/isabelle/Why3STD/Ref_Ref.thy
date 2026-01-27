theory Ref_Ref
  imports "NTP4Verif.NTP4Verif"
begin
datatype 'a ref = ref'mk (contents: "'a")
end
