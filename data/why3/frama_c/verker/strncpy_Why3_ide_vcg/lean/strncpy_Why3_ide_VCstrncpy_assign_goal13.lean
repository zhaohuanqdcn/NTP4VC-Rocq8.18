import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
open Classical
open Lean4Why3
namespace strncpy_Why3_ide_VCstrncpy_assign_goal13
theorem goal13 (a_1 : Memory.addr) (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (i_1 : ℤ) (t_3 : Memory.addr -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x_2 : ℤ := A_Strnlen.l_strnlen t_2 a i_1; let x_3 : ℤ := (1 : ℤ) + x_2; let x_4 : ℤ := A_Strnlen.l_strnlen t_3 a i; ¬x = x_1 → Memory.havoc t_1 t_3 a_2 x_3 = t_2 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (0 : ℤ) ≤ x_2 → Memory.linked t → Memory.sconst t_3 → Cint.is_uint64 i → Cint.is_uint64 i_1 → A_Strlen.p_valid_str t t_3 a → A_Strnlen.p_valid_strn t t_3 a i → Memory.valid_rw t a_2 ((1 : ℤ) + x_4) → ¬Memory.invalid t a_2 x_3 → x_2 ≤ x_4
  := sorry
end strncpy_Why3_ide_VCstrncpy_assign_goal13
