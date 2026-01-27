import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strcat_Why3_ide_VCstrcat_assign_normal_part04_goal24
theorem goal24 (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (t_3 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := A_Strlen.l_strlen t_2 a; let a_2 : Memory.addr := Memory.shift a x; let x_1 : ℤ := A_Strlen.l_strlen t_3 a_1; let x_2 : ℤ := (1 : ℤ) + x_1; let x_3 : ℤ := A_Strlen.l_strlen t_2 a_1; t_2 a_2 = (0 : ℤ) → Memory.havoc t_1 t_2 a_2 x_2 = t_3 → (0 : ℤ) ≤ x_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → x + x_3 ≤ (18446744073709551615 : ℤ) → Memory.linked t → Memory.sconst t_2 → A_Strlen.p_valid_str t t_2 a → A_Strlen.p_valid_str t t_2 a_1 → Cint.is_uint64 x → Memory.addr_le a a_2 → Memory.addr_le a_2 a_2 → ¬Memory.invalid t a_2 x_2 → A_Strlen.p_valid_str t t_2 a_2 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) ((1 : ℤ) + x + x_3) → (∀(i : ℤ), (0 : ℤ) ≤ i → i < x → ¬t_2 (Memory.shift a i) = (0 : ℤ)) → x_1 ≤ x_3
  := sorry
end strcat_Why3_ide_VCstrcat_assign_normal_part04_goal24
