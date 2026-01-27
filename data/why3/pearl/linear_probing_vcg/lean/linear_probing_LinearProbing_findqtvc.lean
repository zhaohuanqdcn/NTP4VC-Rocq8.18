import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import Why3.map.Const
open Classical
open Lean4Why3
namespace linear_probing_LinearProbing_findqtvc
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
theorem find'vc (x : key) (a : List key) (fact0 : neq x dummy) (fact1 : let n : ℤ := Int.ofNat (List.length a); (0 : ℤ) < n ∧ (0 : ℤ) < numof a (0 : ℤ) n) : let n : ℤ := Int.ofNat (List.length a); (0 : ℤ) < n ∧ (let b : ℤ := bucket x n; (0 : ℤ) ≤ b ∧ b < n → (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i < n) ∧ (0 : ℤ) < numof a (0 : ℤ) n ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < n → between b j i → neq (a[Int.toNat j]!) x ∧ neq (a[Int.toNat j]!) dummy) ∧ (if b ≤ i then numof a b i = (0 : ℤ) else numof a b n = numof a (0 : ℤ) i ∧ numof a (0 : ℤ) i = (0 : ℤ)) → (let o1 : key := dummy; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ (let o2 : key := a[Int.toNat i]!; eq o2 o1 = (keym1 o2 = keym1 o1) → (¬eq o2 o1 → (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ (∀(o3 : Bool), (if eq o2 o1 then o3 = true else let o4 : key := a[Int.toNat i]!; o3 = (if eq o4 x then true else false) ∧ (o3 = true) = (keym1 o4 = keym1 x)) → (¬o3 = true → (let o4 : ℤ := next n i; ((0 : ℤ) ≤ (if b ≤ i then n - i + b else b - i) ∧ (if b ≤ o4 then n - o4 + b else b - o4) < (if b ≤ i then n - i + b else b - i)) ∧ ((0 : ℤ) ≤ o4 ∧ o4 < n) ∧ (0 : ℤ) < numof a (0 : ℤ) n ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < n → between b j o4 → neq (a[Int.toNat j]!) x ∧ neq (a[Int.toNat j]!) dummy) ∧ (if b ≤ o4 then numof a b o4 = (0 : ℤ) else numof a b n = numof a (0 : ℤ) o4 ∧ numof a (0 : ℤ) o4 = (0 : ℤ)))) ∧ (∀(result : ℤ), (if o3 = true then result = i else ((0 : ℤ) ≤ result ∧ result < n) ∧ (eq (a[Int.toNat result]!) dummy ∨ eq (a[Int.toNat result]!) x) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < n → between b j result → neq (a[Int.toNat j]!) x ∧ neq (a[Int.toNat j]!) dummy)) → ((0 : ℤ) ≤ result ∧ result < n) ∧ (eq (a[Int.toNat result]!) dummy ∨ eq (a[Int.toNat result]!) x) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < n → between b j result → neq (a[Int.toNat j]!) x ∧ neq (a[Int.toNat j]!) dummy)))))) ∧ (((0 : ℤ) ≤ b ∧ b < n) ∧ (0 : ℤ) < numof a (0 : ℤ) n ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < n → between b j b → neq (a[Int.toNat j]!) x ∧ neq (a[Int.toNat j]!) dummy) ∧ (if b ≤ b then numof a b b = (0 : ℤ) else numof a b n = numof a (0 : ℤ) b ∧ numof a (0 : ℤ) b = (0 : ℤ))) ∧ (∀(result : ℤ), ((0 : ℤ) ≤ result ∧ result < n) ∧ (eq (a[Int.toNat result]!) dummy ∨ eq (a[Int.toNat result]!) x) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < n → between b j result → neq (a[Int.toNat j]!) x ∧ neq (a[Int.toNat j]!) dummy) → ((0 : ℤ) ≤ result ∧ result < Int.ofNat (List.length a)) ∧ (eq (a[Int.toNat result]!) dummy ∨ eq (a[Int.toNat result]!) x) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a) → between (bucket x (Int.ofNat (List.length a))) j result → neq (a[Int.toNat j]!) x ∧ neq (a[Int.toNat j]!) dummy)))
  := sorry
end linear_probing_LinearProbing_findqtvc
