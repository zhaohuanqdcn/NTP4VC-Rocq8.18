theory max_matrix_HashTable
  imports "NTP4Verif.NTP4Verif"
begin
typedecl ('a, 'b) t
consts contents :: "('a, 'b) t \<Rightarrow> 'a \<Rightarrow> 'b option"
definition mixfix_lbrb :: "('a, 'b) t \<Rightarrow> 'a \<Rightarrow> 'b option"
  where "mixfix_lbrb h k = contents h k" for h k
end
