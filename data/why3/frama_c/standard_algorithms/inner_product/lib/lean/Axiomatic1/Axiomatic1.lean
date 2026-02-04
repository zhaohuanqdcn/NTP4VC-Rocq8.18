import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.inner_product.lib.lean.A_InnerProductAxiomatic.A_InnerProductAxiomatic
import Why3.Cint.Cint
import frama_c.standard_algorithms.inner_product.lib.lean.Compound.Compound
import frama_c.standard_algorithms.inner_product.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace Axiomatic1
noncomputable def p_innerproductbounds (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (b : Memory.addr) (n : ℤ) (init_0 : ℤ) := ∀(i : ℤ), let x : ℤ := A_InnerProductAxiomatic.l_innerproduct mint_0 a b i init_0; i ≤ n → (0 : ℤ) ≤ i → -(2147483648 : ℤ) ≤ x ∧ x ≤ (2147483647 : ℤ)
noncomputable def p_productbounds (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (b : Memory.addr) (n : ℤ) := ∀(i : ℤ), let x : ℤ := mint_0 (Memory.shift a i) * mint_0 (Memory.shift b i); (0 : ℤ) ≤ i → i < n → -(2147483648 : ℤ) ≤ x ∧ x ≤ (2147483647 : ℤ)
end Axiomatic1
