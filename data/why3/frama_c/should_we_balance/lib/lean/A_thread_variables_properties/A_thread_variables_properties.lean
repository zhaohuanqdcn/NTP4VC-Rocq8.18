import Why3.Base
import Why3.Qed.Qed
open Classical
open Lean4Why3
namespace A_thread_variables_properties
axiom l_size : ℤ
axiom Q_some : (0 : ℤ) < l_size ∧ l_size ≤ (2147483647 : ℤ)
end A_thread_variables_properties
