import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.make_heap.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.make_heap.lib.lean.Compound.Compound
import frama_c.standard_algorithms.make_heap.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace Axiomatic1
noncomputable def p_multisetunchanged_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (first_0 : ℤ) (last_0 : ℤ) := ∀(i : ℤ), Cint.is_sint32 i → A_Count.l_count_1' mint_1 a first_0 last_0 i = A_Count.l_count_1' mint_0 a first_0 last_0 i
end Axiomatic1
