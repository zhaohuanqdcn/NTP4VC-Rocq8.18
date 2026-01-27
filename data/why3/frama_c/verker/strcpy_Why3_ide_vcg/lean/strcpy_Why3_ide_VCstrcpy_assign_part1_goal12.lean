import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strcpy_Why3_ide_VCstrcpy_assign_part1_goal12
theorem goal12 (a_1 : Memory.addr) (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let x_2 : ℤ := A_Strlen.l_strlen t_2 a_1; let x_3 : ℤ := (1 : ℤ) + x_2; let x_4 : ℤ := A_Strlen.l_strlen t_3 a_1; ¬x = x_1 → Memory.havoc t_1 t_3 a_2 x_3 = t_2 → (0 : ℤ) ≤ x_2 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_3 → A_Strlen.p_valid_str t t_3 a_1 → Memory.valid_rw t a_2 ((1 : ℤ) + x_4) → ¬Memory.invalid t a_2 x_3 → x_2 ≤ x_4
  := sorry
end strcpy_Why3_ide_VCstrcpy_assign_part1_goal12
