import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.adjacent_difference_inv.lib.lean.Compound.Compound
import frama_c.standard_algorithms.adjacent_difference_inv.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace A_AccumulateAxiomatic
axiom l_accumulate_1' : (Memory.addr -> ℤ) -> Memory.addr -> ℤ -> ℤ -> ℤ
axiom Q_TL_Accumulate_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (init_0 : ℤ) : Cint.is_sint32 (l_accumulate_1' mint_0 a n init_0)
axiom Q_AccumulateEmpty (n : ℤ) (init_0 : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (fact0 : n ≤ (0 : ℤ)) (fact1 : Cint.is_sint32 init_0) : l_accumulate_1' mint_0 a n init_0 = init_0
axiom Q_AccumulateNext (n : ℤ) (init_0 : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) : (0 : ℤ) < n → Cint.is_sint32 init_0 → mint_0 (Memory.shift a (n - (1 : ℤ))) + l_accumulate_1' mint_0 a (n - (1 : ℤ)) init_0 = l_accumulate_1' mint_0 a n init_0
axiom Q_AccumulateRead (init_0 : ℤ) (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (fact0 : Cint.is_sint32 init_0) (fact1 : Axiomatic.p_unchanged_1' mint_0 mint_1 a (0 : ℤ) n) : l_accumulate_1' mint_1 a n init_0 = l_accumulate_1' mint_0 a n init_0
end A_AccumulateAxiomatic
