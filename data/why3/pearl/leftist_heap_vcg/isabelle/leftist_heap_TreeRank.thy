theory leftist_heap_TreeRank
  imports "NTP4Verif.NTP4Verif"
begin
datatype 'a tree = E | N "int" "'a tree" "'a" "'a tree"
end
