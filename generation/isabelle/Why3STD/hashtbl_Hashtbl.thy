theory hashtbl_Hashtbl
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  key
typedecl 'a t
consts contents :: "'a t \<Rightarrow> key \<Rightarrow> 'a list"
definition mixfix_lbrb :: "'a t \<Rightarrow> key \<Rightarrow> 'a list"
  where "mixfix_lbrb h k = contents h k" for h k
end
