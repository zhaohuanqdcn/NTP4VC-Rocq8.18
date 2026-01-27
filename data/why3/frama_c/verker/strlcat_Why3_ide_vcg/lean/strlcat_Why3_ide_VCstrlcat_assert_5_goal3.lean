import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strlcat_Why3_ide_VCstrlcat_assert_5_goal3
theorem goal3 (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (i_2 : ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := A_Strlen.l_strlen t_2 a; let x_1 : ℤ := A_Strlen.l_strlen t_2 a_1; let a_2 : Memory.addr := Memory.shift a_1 x_1; let x_2 : ℤ := Cint.to_uint64 (i_2 - x_1); let a_3 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_2 i; t_2 (Memory.shift a x) = (0 : ℤ) → t_2 a_2 = (0 : ℤ) → (0 : ℤ) ≤ i_1 → i_1 < i → x_1 < i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i < x_2 → x + x_1 ≤ (18446744073709551615 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint64 i → Cint.is_uint64 i_2 → A_Strlen.p_valid_str t t_2 a → A_Strlen.p_valid_str t t_2 a_1 → Cint.is_uint64 x → Cint.is_uint64 x_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + i_2) → Memory.valid_rw t a_2 i → A_Strlen.p_valid_str t t_2 a_2 → (if x_2 ≤ x then Cint.to_uint64 (x_2 - (1 : ℤ)) = i else x = i) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < x → ¬t_2 (Memory.shift a i_3) = (0 : ℤ)) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < x_1 → ¬t_2 (Memory.shift a_1 i_3) = (0 : ℤ)) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i → a_3 (Memory.shift a_1 (i_3 + x_1)) = a_3 (Memory.shift a i_3)) → a_3 (Memory.shift a_1 (i_1 + x_1)) = a_3 (Memory.shift a i_1)
  := sorry
end strlcat_Why3_ide_VCstrlcat_assert_5_goal3
