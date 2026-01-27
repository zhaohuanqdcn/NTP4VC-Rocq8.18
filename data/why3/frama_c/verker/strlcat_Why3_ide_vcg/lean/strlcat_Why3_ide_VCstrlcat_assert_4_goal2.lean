import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strlcat_Why3_ide_VCstrlcat_assert_4_goal2
theorem goal2 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := A_Strlen.l_strlen t_1 a; let x_1 : ℤ := A_Strlen.l_strlen t_1 a_1; let a_2 : Memory.addr := Memory.shift a_1 x_1; let x_2 : ℤ := Cint.to_uint64 (i - x_1); t_1 (Memory.shift a x) = (0 : ℤ) → t_1 a_2 = (0 : ℤ) → x_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → x_2 ≤ x → x + x_1 ≤ (18446744073709551615 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → Cint.is_uint64 x → Cint.is_uint64 x_1 → Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + i) → A_Strlen.p_valid_str t t_1 a_2 → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < x → ¬t_1 (Memory.shift a i_1) = (0 : ℤ)) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < x_1 → ¬t_1 (Memory.shift a_1 i_1) = (0 : ℤ)) → Cint.to_uint64 (x_2 - (1 : ℤ)) < x_2
  := sorry
end strlcat_Why3_ide_VCstrlcat_assert_4_goal2
