import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.contiki_memb.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace A_OccArray
axiom l_occ_a : (Memory.addr -> ℤ) -> ℤ -> Memory.addr -> ℤ -> ℤ -> ℤ
axiom Q_end_occ_a (to_0 : ℤ) (from_0 : ℤ) (mchar_0 : Memory.addr -> ℤ) (e : ℤ) (t : Memory.addr) (fact0 : to_0 ≤ from_0) : l_occ_a mchar_0 e t from_0 to_0 = (0 : ℤ)
axiom Q_iter_occ_a_true (to_0 : ℤ) (mchar_0 : Memory.addr -> ℤ) (t : Memory.addr) (e : ℤ) (from_0 : ℤ) : mchar_0 (Memory.shift t (to_0 - (1 : ℤ))) = e → from_0 < to_0 → (1 : ℤ) + l_occ_a mchar_0 e t from_0 (to_0 - (1 : ℤ)) = l_occ_a mchar_0 e t from_0 to_0
axiom Q_iter_occ_a_false (to_0 : ℤ) (mchar_0 : Memory.addr -> ℤ) (t : Memory.addr) (e : ℤ) (from_0 : ℤ) : ¬mchar_0 (Memory.shift t (to_0 - (1 : ℤ))) = e → from_0 < to_0 → l_occ_a mchar_0 e t from_0 (to_0 - (1 : ℤ)) = l_occ_a mchar_0 e t from_0 to_0
end A_OccArray
