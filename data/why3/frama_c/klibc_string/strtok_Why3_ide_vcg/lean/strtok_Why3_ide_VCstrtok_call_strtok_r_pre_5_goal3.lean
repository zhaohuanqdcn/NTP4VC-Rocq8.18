import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strtok_Why3_ide_VCstrtok_call_strtok_r_pre_5_goal3
theorem goal3 (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ)) (fact3 : Memory.linked t) (fact4 : Memory.sconst t_1) : Memory.separated (Memory.shift a (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_1 a) (Memory.shift a_2 (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_1 a_2)
  := sorry
end strtok_Why3_ide_VCstrtok_call_strtok_r_pre_5_goal3
