import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_StrCmp.A_StrCmp
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace strcmp_Why3_ide_VCstrcmp_loop_inv_3_preserved_goal5
theorem goal5 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_2 : Memory.addr) (a_3 : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 a; let x_1 : ℤ := Cint.to_uint8 x; let x_2 : ℤ := t_1 a_2; let x_3 : ℤ := Memory.addr.offset a_2; let x_4 : ℤ := Memory.addr.offset a_3; let x_5 : ℤ := A_Strlen.l_strlen t_1 a_3; let x_6 : ℤ := x_3 - x_4; let x_7 : ℤ := t_1 (Memory.shift a_3 x_6); let x_8 : ℤ := t_1 (Memory.shift a_1 x_6); let a_4 : Memory.addr := Memory.shift a_1 (A_Strlen.l_strlen t_1 a_1); let a_5 : Memory.addr := Memory.shift a (1 : ℤ); ¬x_1 = (0 : ℤ) → Cint.to_uint8 x_2 = x_1 → A_StrCmp.l_strcmp t_1 a_3 a_1 = A_StrCmp.l_strcmp t_1 a_2 a → Memory.addr.offset a_1 + x_3 = Memory.addr.offset a + x_4 → x_4 + x_5 = x_3 + A_Strlen.l_strlen t_1 a_2 → x_7 = x_8 → (∀(i : ℤ), (0 : ℤ) ≤ i → i ≤ x_5 → Cint.to_uint8 (t_1 (Memory.shift a_3 i)) = Cint.to_uint8 (t_1 (Memory.shift a_1 i))) = (∀(i : ℤ), (0 : ℤ) ≤ i → i ≤ x_5 → t_1 (Memory.shift a_3 i) = t_1 (Memory.shift a_1 i)) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_1 a → Memory.addr_le a_3 a_2 → Cint.is_sint8 x → Cint.is_sint8 x_2 → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_2 → A_Strlen.p_valid_str t t_1 a_3 → Memory.addr_le a a_4 → Memory.addr_le a_2 (Memory.shift a_3 x_5) → Cint.is_sint8 x_8 → Cint.is_sint8 x_7 → (∀(i : ℤ), (0 : ℤ) ≤ i → i + x_4 < x_3 → t_1 (Memory.shift a_3 i) = t_1 (Memory.shift a_1 i)) → Memory.addr_le a_1 a_5 ∧ Memory.addr_le a_5 a_4
  := sorry
end strcmp_Why3_ide_VCstrcmp_loop_inv_3_preserved_goal5
