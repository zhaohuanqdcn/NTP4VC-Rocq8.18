import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic1.Axiomatic1
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strsep_Why3_ide_VCstrsep_found_post_5_part2_goal11
theorem goal11 (t_2 : Memory.addr -> Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i_4 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (i_3 : ℤ) : let a_2 : Memory.addr := t_2 a; let x : ℤ := A_Length.l_length t_1 a_2; let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x_1 : ℤ := (1 : ℤ) + A_Length.l_length t_1 a_1; let a_4 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x_2 : ℤ := (1 : ℤ) + x; ¬a_2 = a → (0 : ℤ) ≤ i_4 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_4 < x → Memory.framed t_2 → Memory.linked t → Memory.sconst t_1 → Memory.valid_rw t a (1 : ℤ) → Cint.is_sint8 (t_1 a_2) → Memory.valid_rw t a_2 (1 : ℤ) → Axiomatic.p_length_of_str_is t t_1 a_1 i → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Axiomatic.p_length_of_str_is t t_1 a_1 i_2 → Axiomatic.p_length_of_str_is t t_1 a_2 i_3 → Cint.is_sint8 (t_1 (Memory.shift a_2 (-(1 : ℤ)))) → Axiomatic1.p_char_in_str t_1 a_1 (t_1 (Memory.shift a_2 i_4)) → Memory.separated a (1 : ℤ) a_3 x_1 → Memory.separated a_2 (1 : ℤ) a_3 x_1 → Memory.separated a (1 : ℤ) a_4 x_2 → Memory.separated a_4 x_2 a_3 x_1 → Memory.separated a_2 (1 : ℤ) a_4 x_2 → Memory.addr_lt a_2 (Memory.shift a_2 x)
  := sorry
end strsep_Why3_ide_VCstrsep_found_post_5_part2_goal11
