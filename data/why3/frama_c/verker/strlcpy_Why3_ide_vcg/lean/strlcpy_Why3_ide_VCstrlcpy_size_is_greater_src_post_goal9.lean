import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strlcpy_Why3_ide_VCstrlcpy_size_is_greater_src_post_goal9
theorem goal9 (a_1 : Memory.addr) (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (i_2 : ℤ) (i_3 : ℤ) (t_4 : Memory.addr -> ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (p : Bool) (i : ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := A_Strlen.l_strlen t_2 a; let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr -> ℤ := Memory.havoc t_1 t_3 a_2 i_2; let a_4 : Memory.addr -> ℤ := Function.update a_3 (Memory.shift a_1 i_2) (0 : ℤ); ¬x = x_1 → t_2 (Memory.shift a x_2) = (0 : ℤ) → (0 : ℤ) ≤ i_3 → i_3 < A_Strlen.l_strlen t_4 a → x_2 < i_1 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint64 i_1 → Cint.is_uint64 i_2 → A_Strlen.p_valid_str t t_2 a → Cint.is_uint64 x_2 → Memory.valid_rw t a_2 i_1 → (if i_1 = (0 : ℤ) then t_4 = t_2 else p = false ∧ i_2 = i ∧ t_3 = t_2 ∧ A_Strlen.l_strlen t_3 a = i_2 ∧ a_4 = t_4 ∧ A_Strlen.l_strlen a_4 a_1 = i_2 ∧ Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_2 ∧ Memory.valid_rw t a_2 i_2 ∧ A_Strlen.p_valid_str t a_4 a_1 ∧ (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 < i_2 → a_3 (Memory.shift a_1 i_4) = a_3 (Memory.shift a i_4))) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 < x_2 → ¬t_2 (Memory.shift a i_4) = (0 : ℤ)) → t_4 (Memory.shift a_1 i_3) = t_4 (Memory.shift a i_3)
  := sorry
end strlcpy_Why3_ide_VCstrlcpy_size_is_greater_src_post_goal9
