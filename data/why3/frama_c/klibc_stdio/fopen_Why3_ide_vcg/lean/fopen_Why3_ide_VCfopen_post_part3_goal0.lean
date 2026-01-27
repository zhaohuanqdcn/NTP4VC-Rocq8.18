import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.Globals.Globals
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace fopen_Why3_ide_VCfopen_post_part3_goal0
theorem goal0 (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (a_3 : Memory.addr) (t : ℤ -> ℤ) (a_5 : Memory.addr) (a_6 : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t_2 : Memory.addr -> ℤ) (i : ℤ) (i_3 : ℤ) (i_4 : ℤ) (i_1 : ℤ) (i_2 : ℤ) (a : Memory.addr) (a_4 : Memory.addr) : let a_7 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := t_1 (Memory.shift a_7 (0 : ℤ)); let x_1 : ℤ := t_1 (Memory.shift a_2 (10 : ℤ)); let x_2 : ℤ := t_1 (Memory.shift a_3 (10 : ℤ)); let m : ℤ -> ℤ := Function.update t (38235 : ℤ) (1 : ℤ); ¬a_7 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → t_1 (Memory.addr.mk (38235 : ℤ) (0 : ℤ)) = (438 : ℤ) → Memory.region (Memory.addr.base a_5) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_6) ≤ (0 : ℤ) → (0 : ℤ) ≤ x → Memory.framed t_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 x_1 → Cint.is_uint32 x_2 → Axiomatic.p_length_of_str_is t t_2 a_5 i → Axiomatic.p_length_of_str_is t t_2 a_5 i_3 → Axiomatic.p_length_of_str_is t t_2 a_5 i_4 → Axiomatic.p_length_of_str_is t t_2 a_6 i_1 → Axiomatic.p_length_of_str_is t t_2 a_6 i_2 → Axiomatic3.p_valid_io_file_pvt m t_3 t_1 a → Cint.is_sint32 x → x_1 = (1 : ℤ) ∨ x_2 = (2 : ℤ) → Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_5 ∨ (∃(i_5 : ℤ), Axiomatic.p_length_of_str_is m t_2 a_5 i_5) → Axiomatic3.p_valid_file m t_1 a_7 ∧ Axiomatic3.p_valid_io_file_pvt m t_3 t_1 a_4
  := sorry
end fopen_Why3_ide_VCfopen_post_part3_goal0
