import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.Axiomatic5.Axiomatic5
open Classical
open Lean4Why3
namespace kstrtobool_Why3_ide_VCkstrtobool_INVAL_post_part5_goal13
theorem goal13 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := t_1 a_2; let x_1 : ℤ := t_1 (Memory.shift a (1 : ℤ)); ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → ¬Axiomatic5.p_kstrtobool_fmt t_1 a → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_sint8 x → Cint.is_sint8 x_1 → Memory.valid_rd t a_2 (2 : ℤ) → x = (79 : ℤ) ∨ x = (111 : ℤ) → ¬(x_1 = (70 : ℤ) ∨ x_1 = (102 : ℤ))
  := sorry
end kstrtobool_Why3_ide_VCkstrtobool_INVAL_post_part5_goal13
