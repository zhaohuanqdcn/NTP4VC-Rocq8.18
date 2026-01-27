import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strcat_Why3_ide_VCstrcat_post_3_goal0
theorem goal0 (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (t_3 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i : ℤ) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := A_Strlen.l_strlen t_2 a; let a_2 : Memory.addr := Memory.shift a x; let m : Memory.addr -> ℤ := Function.update t_3 a_2 (0 : ℤ); let x_1 : ℤ := A_Strlen.l_strlen t_3 a_1; let x_2 : ℤ := A_Strlen.l_strlen t_2 a_1; let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let a_4 : Memory.addr := Memory.shift a i; t_3 a_1 = (0 : ℤ) → t_2 a_2 = (0 : ℤ) → m (Memory.shift a_1 (0 : ℤ)) = (0 : ℤ) → A_Strlen.l_strlen m a = x → A_Strlen.l_strlen m a_1 = (0 : ℤ) → Memory.havoc t_1 t_2 a_2 ((1 : ℤ) + x_1) = t_3 → (0 : ℤ) ≤ i → i < x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → x + x_2 ≤ (18446744073709551615 : ℤ) → Memory.linked t → Memory.sconst t_2 → Memory.addr_le a_1 a_1 → A_Strlen.p_valid_str t t_2 a → A_Strlen.p_valid_str t t_2 a_1 → A_Strlen.p_valid_str t t_3 a_1 → Cint.is_uint64 x → Memory.addr_le a a_2 → Memory.addr_le a_1 (Memory.shift a_1 x_1) → Memory.addr_le a_2 a_2 → Memory.valid_rw t a_3 ((1 : ℤ) + x) → A_Strlen.p_valid_str t t_2 a_2 → Memory.valid_rw t a_3 ((1 : ℤ) + x + x_2) → A_Strlen.p_valid_str t m a → Memory.addr_le a_2 (Memory.shift a (x + x_1)) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < x → ¬t_2 (Memory.shift a i_1) = (0 : ℤ)) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < x → ¬t_3 (Memory.shift a i_1) = (0 : ℤ)) → (∀(i_1 : ℤ), let a_5 : Memory.addr := Memory.shift a i_1; (0 : ℤ) ≤ i_1 → i_1 < x → m a_5 = t_2 a_5) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < x → ¬m (Memory.shift a i_1) = (0 : ℤ)) → m a_4 = t_2 a_4
  := sorry
end strcat_Why3_ide_VCstrcat_post_3_goal0
