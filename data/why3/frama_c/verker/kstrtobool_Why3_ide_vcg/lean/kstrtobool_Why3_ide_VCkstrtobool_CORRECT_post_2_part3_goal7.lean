import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.Axiomatic5.Axiomatic5
open Classical
open Lean4Why3
namespace kstrtobool_Why3_ide_VCkstrtobool_CORRECT_post_2_part3_goal7
theorem goal7 (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_2 (Memory.shift a (1 : ℤ)); let x_1 : ℤ := t_1 a_1; let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let x_2 : ℤ := t_2 a_2; ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → ¬x = (70 : ℤ) → ¬x = (78 : ℤ) → ¬x = (102 : ℤ) → ¬x = (110 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint8 x_1 → Axiomatic5.p_kstrtobool_fmt_false t_2 a → Axiomatic5.p_kstrtobool_fmt t_2 a → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_sint8 x_2 → Cint.is_sint8 x → Memory.valid_rd t a_2 (2 : ℤ) → x_2 = (79 : ℤ) ∨ x_2 = (111 : ℤ) → x_1 = (0 : ℤ)
  := sorry
end kstrtobool_Why3_ide_VCkstrtobool_CORRECT_post_2_part3_goal7
