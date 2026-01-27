import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strcat_Why3_ide_VCstrcat_call_strchr_pre_goal3
theorem goal3 (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_3 : ℤ) (i_1 : ℤ) (i_2 : ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := A_Length.l_length t_1 a; let x_1 : ℤ := A_Length.l_length t_1 a_1; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Axiomatic.p_length_of_str_is t t_1 a i → Axiomatic.p_length_of_str_is t t_1 a i_3 → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Axiomatic.p_length_of_str_is t t_1 a_1 i_2 → Memory.valid_rw t a_2 (x + x_1) → Memory.separated a_2 ((1 : ℤ) + x_1) (Memory.shift a (0 : ℤ)) ((1 : ℤ) + x) → (∃(i_4 : ℤ), Axiomatic.p_length_of_str_is t t_1 a_1 i_4)
  := sorry
end strcat_Why3_ide_VCstrcat_call_strchr_pre_goal3
