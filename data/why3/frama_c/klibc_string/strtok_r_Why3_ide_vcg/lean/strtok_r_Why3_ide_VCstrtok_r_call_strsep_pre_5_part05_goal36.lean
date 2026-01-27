import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strtok_r_Why3_ide_VCstrtok_r_call_strsep_pre_5_part05_goal36
theorem goal36 (a_1 : Memory.addr) (t_2 : Memory.addr -> ℤ) (a_4 : Memory.addr) (t_5 : Memory.addr -> Memory.addr) (a_3 : Memory.addr) (t_3 : Memory.addr -> ℤ) (a_2 : Memory.addr) (t_4 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (a : Memory.addr) (t_1 : ℤ -> ℤ) (a_5 : Memory.addr) : let a_6 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := (1 : ℤ) + A_Length.l_length t_2 a_1; let a_7 : Memory.addr := Memory.shift a_4 (0 : ℤ); let x_1 : ℤ := (1 : ℤ) + A_Length.l_length t_2 a_4; let a_8 : Memory.addr := t_5 a_3; let a_9 : Memory.addr := Memory.shift a_1 (A_Length.l_length t_3 a_1); ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_4) ≤ (0 : ℤ) → Memory.framed t_4 → Memory.linked t → Memory.sconst t_2 → Memory.valid_rw t a_2 (1 : ℤ) → Memory.valid_rw t (t_4 a_2) (1 : ℤ) → Axiomatic.p_length_of_str_is t t_2 a_1 i → Axiomatic.p_length_of_str_is t t_2 a_4 i_1 → Axiomatic.p_length_of_str_is t t_2 a_4 i_2 → Memory.separated a_2 (1 : ℤ) a_6 x → Memory.separated a_2 (1 : ℤ) a_7 x_1 → Memory.separated a_6 x a_7 x_1 → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → Memory.addr.base a_8 = Memory.addr.base a) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → Memory.valid_rw t_1 a_3 (1 : ℤ)) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → Memory.addr_le a_1 a ∧ Memory.addr_le a a_9) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → Memory.addr_le a_1 a_8 ∧ Memory.addr_le a_8 a_9) → Memory.separated (Memory.shift a_8 (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_3 a_8) (Memory.shift a_5 (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_3 a_5)
  := sorry
end strtok_r_Why3_ide_VCstrtok_r_call_strsep_pre_5_part05_goal36
