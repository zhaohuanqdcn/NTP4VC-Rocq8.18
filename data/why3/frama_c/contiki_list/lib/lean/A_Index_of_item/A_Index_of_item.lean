import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
open Classical
open Lean4Why3
namespace A_Index_of_item
axiom l_index_of : (Memory.addr -> Memory.addr) -> Memory.addr -> Memory.addr -> ℤ -> ℤ -> ℤ
axiom Q_no_more_elements (up_0 : ℤ) (down_0 : ℤ) (mptr_0 : Memory.addr -> Memory.addr) (item_0 : Memory.addr) (array_0 : Memory.addr) (fact0 : up_0 ≤ down_0) (fact1 : (0 : ℤ) ≤ up_0) : l_index_of mptr_0 item_0 array_0 down_0 up_0 = up_0
axiom Q_found_item (mptr_0 : Memory.addr -> Memory.addr) (array_0 : Memory.addr) (down_0 : ℤ) (item_0 : Memory.addr) (up_0 : ℤ) (fact0 : mptr_0 (Memory.shift array_0 down_0) = item_0) (fact1 : (0 : ℤ) ≤ down_0) (fact2 : down_0 < up_0) : l_index_of mptr_0 item_0 array_0 down_0 up_0 = down_0
axiom Q_not_the_item (mptr_0 : Memory.addr -> Memory.addr) (array_0 : Memory.addr) (down_0 : ℤ) (item_0 : Memory.addr) (up_0 : ℤ) (fact0 : ¬mptr_0 (Memory.shift array_0 down_0) = item_0) (fact1 : (0 : ℤ) ≤ down_0) (fact2 : down_0 < up_0) : l_index_of mptr_0 item_0 array_0 ((1 : ℤ) + down_0) up_0 = l_index_of mptr_0 item_0 array_0 down_0 up_0
end A_Index_of_item
