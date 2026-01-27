import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strcpy_Why3_ide_VCstrcpy_assign_part7_goal13
theorem goal13 (a_3 : Memory.addr) (a_2 : Memory.addr) (a_1 : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_3; let x_1 : ℤ := Memory.addr.base a_2; let x_2 : ℤ := Memory.addr.offset a_1; let x_3 : ℤ := Memory.addr.offset a_2; let x_4 : ℤ := A_Strlen.l_strlen t_2 a_2; let a_4 : Memory.addr := Memory.shift a_3 (0 : ℤ); let x_5 : ℤ := (1 : ℤ) + A_Strlen.l_strlen t_3 a_2; ¬x = x_1 → x_2 + Memory.addr.offset a_3 = Memory.addr.offset a + x_3 → x_3 + x_4 = x_2 + A_Strlen.l_strlen t_2 a_1 → Memory.havoc t_1 t_3 a_4 ((1 : ℤ) + x_4) = t_2 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_3 → Memory.addr_le a_2 a_1 → Memory.addr_le a_3 a → ¬Memory.invalid t a (1 : ℤ) → A_Strlen.p_valid_str t t_2 a_1 → A_Strlen.p_valid_str t t_3 a_2 → Memory.addr_le a (Memory.shift a_3 x_4) → Memory.addr_le a_1 (Memory.shift a_2 x_4) → Memory.valid_rw t a_4 x_5 → (∀(i : ℤ), (0 : ℤ) ≤ i → i + x_3 < x_2 → t_2 (Memory.shift a_3 i) = t_2 (Memory.shift a_2 i)) → Memory.included a (1 : ℤ) a_4 x_5
  := sorry
end strcpy_Why3_ide_VCstrcpy_assign_part7_goal13
