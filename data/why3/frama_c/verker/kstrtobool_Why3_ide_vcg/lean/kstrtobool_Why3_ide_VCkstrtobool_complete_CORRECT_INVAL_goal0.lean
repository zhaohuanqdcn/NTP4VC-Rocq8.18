import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.Axiomatic5.Axiomatic5
open Classical
open Lean4Why3
namespace kstrtobool_Why3_ide_VCkstrtobool_complete_CORRECT_INVAL_goal0
theorem goal0 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_sint8 (t_1 a_2) → Memory.addr.mk (0 : ℤ) (0 : ℤ) = a ∨ Memory.valid_rd t a_2 (2 : ℤ) → Memory.addr.mk (0 : ℤ) (0 : ℤ) = a ∨ ¬Axiomatic5.p_kstrtobool_fmt t_1 a ∨ ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a ∧ Axiomatic5.p_kstrtobool_fmt t_1 a
  := sorry
end kstrtobool_Why3_ide_VCkstrtobool_complete_CORRECT_INVAL_goal0
