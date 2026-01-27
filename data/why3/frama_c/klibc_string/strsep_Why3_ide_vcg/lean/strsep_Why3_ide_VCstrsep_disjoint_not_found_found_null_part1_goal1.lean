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
namespace strsep_Why3_ide_VCstrsep_disjoint_not_found_found_null_part1_goal1
theorem goal1 (t_2 : Memory.addr -> Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) : let a_2 : Memory.addr := t_2 a; let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := (1 : ℤ) + A_Length.l_length t_1 a_1; let a_4 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x_1 : ℤ := A_Length.l_length t_1 a_2; let x_2 : ℤ := (1 : ℤ) + x_1; ¬a_2 = a → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Memory.sconst t_1 → Memory.valid_rw t a (1 : ℤ) → Axiomatic.p_length_of_str_is t t_1 a_1 i → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Memory.separated a (1 : ℤ) a_3 x → Memory.separated a_2 (1 : ℤ) a_3 x → Memory.separated a (1 : ℤ) a_4 x_2 → Memory.separated a_4 x_2 a_3 x → Memory.separated a_2 (1 : ℤ) a_4 x_2 → a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) ∨ Memory.valid_rw t a_2 (1 : ℤ) → a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) ∨ (∃(i_2 : ℤ), Axiomatic.p_length_of_str_is t t_1 a_2 i_2) → ¬a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) ∨ ¬Memory.valid_rw t a_2 (1 : ℤ) ∨ (∀(i_2 : ℤ), ¬Axiomatic.p_length_of_str_is t t_1 a_1 i_2) ∨ (∀(i_2 : ℤ), ¬Axiomatic.p_length_of_str_is t t_1 a_2 i_2) ∨ (∀(i_2 : ℤ), i_2 < (0 : ℤ) ∨ x_1 ≤ i_2 ∨ ¬Axiomatic1.p_char_in_str t_1 a_1 (t_1 (Memory.shift a_2 i_2)))
  := sorry
end strsep_Why3_ide_VCstrsep_disjoint_not_found_found_null_part1_goal1
