import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strlcpy_Why3_ide_VCstrlcpy_assert_goal2
theorem goal2 (a_1 : Memory.addr) (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (i : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := A_Strlen.l_strlen t_2 a; let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_2 i_1; ¬i = (0 : ℤ) → ¬x = x_1 → t_2 (Memory.shift a x_2) = (0 : ℤ) → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint64 i → Cint.is_uint64 i_1 → A_Strlen.p_valid_str t t_2 a → Cint.is_uint64 x_2 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1 → Memory.valid_rw t a_2 i → Memory.valid_rw t a_2 i_1 → (if i ≤ x_2 then Cint.to_uint64 (i - (1 : ℤ)) = i_1 else x_2 = i_1) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < x_2 → ¬t_2 (Memory.shift a i_3) = (0 : ℤ)) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i_1 → a_3 (Memory.shift a_1 i_3) = a_3 (Memory.shift a i_3)) → a_3 (Memory.shift a_1 i_2) = a_3 (Memory.shift a i_2)
  := sorry
end strlcpy_Why3_ide_VCstrlcpy_assert_goal2
