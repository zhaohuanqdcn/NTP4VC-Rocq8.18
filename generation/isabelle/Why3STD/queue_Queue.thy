theory queue_Queue
  imports "NTP4Verif.NTP4Verif"
begin
typedecl 'a t
consts seq :: "'a t \<Rightarrow> 'a list"
end
