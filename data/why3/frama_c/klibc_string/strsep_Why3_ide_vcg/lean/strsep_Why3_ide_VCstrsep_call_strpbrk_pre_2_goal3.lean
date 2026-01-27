import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strsep_Why3_ide_VCstrsep_call_strpbrk_pre_2_goal3
theorem goal3 (t_2 : Memory.addr -> Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) : let a_2 : Memory.addr := t_2 a; let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := (1 : ℤ) + A_Length.l_length t_1 a_1; let a_4 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x_1 : ℤ := (1 : ℤ) + A_Length.l_length t_1 a_2; ¬a_2 = a → ¬a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Memory.sconst t_1 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_2 (1 : ℤ) → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Axiomatic.p_length_of_str_is t t_1 a_1 i_2 → Axiomatic.p_length_of_str_is t t_1 a_2 i → Memory.separated a (1 : ℤ) a_3 x → Memory.separated a_2 (1 : ℤ) a_3 x → Memory.separated a (1 : ℤ) a_4 x_1 → Memory.separated a_4 x_1 a_3 x → Memory.separated a_2 (1 : ℤ) a_4 x_1 → (∃(i_3 : ℤ), Axiomatic.p_length_of_str_is t t_1 a_1 i_3)
  := sorry
end strsep_Why3_ide_VCstrsep_call_strpbrk_pre_2_goal3
