import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.remove_copy.lib.lean.A_Count.A_Count
import Why3.Cint.Cint
import frama_c.standard_algorithms.remove_copy.lib.lean.Compound.Compound
import frama_c.standard_algorithms.remove_copy.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace Axiomatic1
noncomputable def p_multisetretainrest_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m1_0 : ℤ) (m2_0 : ℤ) (b : Memory.addr) (n1_0 : ℤ) (n2_0 : ℤ) (v : ℤ) := ∀(i : ℤ), ¬i = v → Cint.is_sint32 i → A_Count.l_count_1' mint_1 a m1_0 m2_0 i = A_Count.l_count_1' mint_0 b n1_0 n2_0 i
end Axiomatic1
