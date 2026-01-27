import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strtok_Why3_ide_VCstrtok_call_strtok_r_pre_4_goal2
theorem goal2 (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ)) (fact3 : Memory.linked t) (fact4 : Memory.sconst t_1) : Memory.addr.mk (0 : ℤ) (0 : ℤ) = a ∨ (∃(i : ℤ), Axiomatic.p_length_of_str_is t t_1 a i)
  := sorry
end strtok_Why3_ide_VCstrtok_call_strtok_r_pre_4_goal2
