import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import Why3.map.Const
open Classical
open Lean4Why3
namespace linear_probing_LinearProbing_find_dummyqtvc
axiom key : Type
axiom inhabited_axiom_key : Inhabited key
attribute [instance] inhabited_axiom_key
axiom keym : Type
axiom inhabited_axiom_keym : Inhabited keym
attribute [instance] inhabited_axiom_keym
axiom keym1 : key -> keym
axiom eq : key -> key -> Prop
axiom eq'spec (x : key) (y : key) : eq x y = (keym1 x = keym1 y)
noncomputable def neq (x : key) (y : key) := ¬eq x y
axiom neq'spec (x : key) (y : key) : neq x y = (¬keym1 x = keym1 y)
axiom hash : key -> ℤ
axiom hash_nonneg (k : key) : (0 : ℤ) ≤ hash k
axiom hash_eq (x : key) (y : key) (fact0 : eq x y) : hash x = hash y
axiom dummy : key
axiom bucket : key -> ℤ -> ℤ
axiom bucket'def (n : ℤ) (k : key) (fact0 : (0 : ℤ) < n) : bucket k n = Int.tmod (hash k) n
axiom bucket'spec (n : ℤ) (k : key) (fact0 : (0 : ℤ) < n) : (0 : ℤ) ≤ bucket k n ∧ bucket k n < n
noncomputable def between (l : ℤ) (j : ℤ) (r : ℤ) := l ≤ j ∧ j < r ∨ r < l ∧ l ≤ j ∨ j < r ∧ r < l
axiom fc : List key -> ℤ -> Bool
axiom fc'def (a : List key) (i : ℤ) : (fc a i = true) = eq (a[Int.toNat i]!) dummy
noncomputable def numof (a : List key) (l : ℤ) (u : ℤ) := NumOf.numof (fc a) l u
noncomputable def valid (data : List key) (view : keym -> Bool) (loc : keym -> ℤ) := ¬view (keym1 dummy) = true ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length data) → (let x : key := data[Int.toNat i]!; neq x dummy → view (keym1 x) = true ∧ loc (keym1 x) = i)) ∧ (let n : ℤ := Int.ofNat (List.length data); ∀(x : key), view (keym1 x) = true → (let i : ℤ := loc (keym1 x); ((0 : ℤ) ≤ i ∧ i < n) ∧ eq (data[Int.toNat i]!) x ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < n → between (bucket x n) j i → neq (data[Int.toNat j]!) x ∧ neq (data[Int.toNat j]!) dummy)))
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom size : t -> ℤ
axiom data : t -> List key
axiom view : t -> keym -> Bool
axiom loc : t -> keym -> ℤ
axiom t'invariant (self : t) : (0 : ℤ) ≤ size self ∧ size self < Int.ofNat (List.length (data self)) ∧ size self + numof (data self) (0 : ℤ) (Int.ofNat (List.length (data self))) = Int.ofNat (List.length (data self)) ∧ valid (data self) (view self) (loc self)
noncomputable def t'eq (a : t) (b : t) := size a = size b ∧ data a = data b ∧ view a = view b ∧ loc a = loc b
axiom t'inj (a : t) (b : t) (fact0 : t'eq a b) : a = b
noncomputable def next (n : ℤ) (i : ℤ) := let i1 : ℤ := i + (1 : ℤ); if i1 = n then (0 : ℤ) else i1
theorem find_dummy'vc (s : ℤ) (a : List key) (i : ℤ) (fact0 : (0 : ℤ) ≤ s) (fact1 : s < Int.ofNat (List.length a)) (fact2 : (0 : ℤ) ≤ i) (fact3 : i < Int.ofNat (List.length a)) (fact4 : ¬i = s) (fact5 : if s ≤ i then (1 : ℤ) ≤ numof a i (Int.ofNat (List.length a)) + numof a (0 : ℤ) s else (1 : ℤ) ≤ numof a i s) (fact6 : ∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length a) → between s k i → ¬k = s → neq (a[Int.toNat k]!) dummy) : let o1 : key := dummy; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ (let o2 : key := a[Int.toNat i]!; eq o2 o1 = (keym1 o2 = keym1 o1) → (¬eq o2 o1 → (let o3 : ℤ := next (Int.ofNat (List.length a)) i; ((0 : ℤ) ≤ (if s ≤ i then Int.ofNat (List.length a) - i + s else s - i) ∧ (if s ≤ o3 then Int.ofNat (List.length a) - o3 + s else s - o3) < (if s ≤ i then Int.ofNat (List.length a) - i + s else s - i)) ∧ ((0 : ℤ) ≤ s ∧ s < Int.ofNat (List.length a)) ∧ ((0 : ℤ) ≤ o3 ∧ o3 < Int.ofNat (List.length a)) ∧ ¬o3 = s ∧ (if s ≤ o3 then (1 : ℤ) ≤ numof a o3 (Int.ofNat (List.length a)) + numof a (0 : ℤ) s else (1 : ℤ) ≤ numof a o3 s) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length a) → between s k o3 → ¬k = s → neq (a[Int.toNat k]!) dummy))) ∧ (∀(result : ℤ), (if eq o2 o1 then result = i else ((0 : ℤ) ≤ result ∧ result < Int.ofNat (List.length a)) ∧ ¬result = s ∧ eq (a[Int.toNat result]!) dummy ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length a) → between s k result → ¬k = s → neq (a[Int.toNat k]!) dummy)) → ((0 : ℤ) ≤ result ∧ result < Int.ofNat (List.length a)) ∧ ¬result = s ∧ eq (a[Int.toNat result]!) dummy ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length a) → between s k result → ¬k = s → neq (a[Int.toNat k]!) dummy)))
  := sorry
end linear_probing_LinearProbing_find_dummyqtvc
