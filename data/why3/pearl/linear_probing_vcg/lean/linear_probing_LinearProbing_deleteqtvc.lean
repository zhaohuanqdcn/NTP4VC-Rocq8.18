import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import Why3.map.Const
open Classical
open Lean4Why3
namespace linear_probing_LinearProbing_deleteqtvc
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
theorem delete'vc (f0 : ℤ) (a : List key) (j : ℤ) (i : ℤ) (view1 : keym -> Bool) (loc1 : keym -> ℤ) (fact0 : (0 : ℤ) ≤ f0) (fact1 : f0 < Int.ofNat (List.length a)) (fact2 : (0 : ℤ) ≤ j) (fact3 : j < Int.ofNat (List.length a)) (fact4 : (0 : ℤ) ≤ i) (fact5 : i < Int.ofNat (List.length a)) (fact6 : ¬j = f0) (fact7 : eq (a[Int.toNat j]!) dummy) (fact8 : eq (a[Int.toNat f0]!) dummy) (fact9 : between j i f0) (fact10 : ∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length a) → between i k f0 → ¬k = i → neq (a[Int.toNat k]!) dummy) (fact11 : ¬view1 (keym1 dummy) = true) (fact12 : ∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length a) → (let x : key := a[Int.toNat k]!; neq x dummy → view1 (keym1 x) = true ∧ loc1 (keym1 x) = k)) (fact13 : let n : ℤ := Int.ofNat (List.length a); ∀(x : key), view1 (keym1 x) = true → (let k : ℤ := loc1 (keym1 x); ((0 : ℤ) ≤ k ∧ k < n) ∧ eq (a[Int.toNat k]!) x ∧ (∀(l : ℤ), (0 : ℤ) ≤ l ∧ l < n → between (bucket x n) l k → neq (a[Int.toNat l]!) x ∧ (neq (a[Int.toNat l]!) dummy ∨ l = j ∧ between j i k)))) : let n : ℤ := Int.ofNat (List.length a); let i1 : ℤ := next n i; ((0 : ℤ) ≤ i1 ∧ i1 < Int.ofNat (List.length a)) ∧ (let xi : key := a[Int.toNat i1]!; let o1 : key := dummy; neq xi o1 = (¬keym1 xi = keym1 o1) → (if neq xi o1 then (0 : ℤ) < n ∧ (let r : ℤ := bucket xi n; (0 : ℤ) ≤ r ∧ r < n → (∀(o2 : Bool), (if j < r then o2 = (if r ≤ i1 then true else false) else o2 = false) → (∀(o3 : Bool), (if o2 = true then o3 = true else ∃(o4 : Bool), (if i1 < j then o4 = (if j < r then true else false) else o4 = false) ∧ (if o4 = true then o3 = true else if r ≤ i1 then o3 = (if i1 < j then true else false) else o3 = false)) → (if o3 = true then ((0 : ℤ) ≤ (if f0 ≤ i then Int.ofNat (List.length a) - i + f0 else f0 - i) ∧ (if f0 ≤ i1 then Int.ofNat (List.length a) - i1 + f0 else f0 - i1) < (if f0 ≤ i then Int.ofNat (List.length a) - i + f0 else f0 - i)) ∧ ((0 : ℤ) ≤ f0 ∧ f0 < Int.ofNat (List.length a)) ∧ ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a)) ∧ ((0 : ℤ) ≤ i1 ∧ i1 < Int.ofNat (List.length a)) ∧ ¬j = f0 ∧ eq (a[Int.toNat j]!) dummy ∧ eq (a[Int.toNat f0]!) dummy ∧ between j i1 f0 ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length a) → between i1 k f0 → ¬k = i1 → neq (a[Int.toNat k]!) dummy) ∧ ¬view1 (keym1 dummy) = true ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length a) → (let x : key := a[Int.toNat k]!; neq x dummy → view1 (keym1 x) = true ∧ loc1 (keym1 x) = k)) ∧ (let n1 : ℤ := Int.ofNat (List.length a); ∀(x : key), view1 (keym1 x) = true → (let k : ℤ := loc1 (keym1 x); ((0 : ℤ) ≤ k ∧ k < n1) ∧ eq (a[Int.toNat k]!) x ∧ (∀(l : ℤ), (0 : ℤ) ≤ l ∧ l < n1 → between (bucket x n1) l k → neq (a[Int.toNat l]!) x ∧ (neq (a[Int.toNat l]!) dummy ∨ l = j ∧ between j i1 k)))) else ∀(a1 : List key), List.length a1 = List.length a ∧ (∀(i2 : ℤ), (0 : ℤ) ≤ i2 ∧ i2 < Int.ofNat (List.length a1) → a1[Int.toNat i2]! = a[Int.toNat i2]!) → ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a)) ∧ (List.length (List.set a (Int.toNat j) xi) = List.length a → getElem! (List.set a (Int.toNat j) xi) ∘ Int.toNat = Function.update (getElem! a ∘ Int.toNat) j xi → (∀(a2 : List key), List.length a2 = List.length (List.set a (Int.toNat j) xi) ∧ (∀(i2 : ℤ), (0 : ℤ) ≤ i2 ∧ i2 < Int.ofNat (List.length a2) → a2[Int.toNat i2]! = (List.set a (Int.toNat j) xi)[Int.toNat i2]!) → (let o4 : key := dummy; ((0 : ℤ) ≤ i1 ∧ i1 < Int.ofNat (List.length (List.set a (Int.toNat j) xi))) ∧ (List.length (List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4) = List.length (List.set a (Int.toNat j) xi) → getElem! (List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4) ∘ Int.toNat = Function.update (getElem! (List.set a (Int.toNat j) xi) ∘ Int.toNat) i1 o4 → (((0 : ℤ) ≤ (if f0 ≤ i then Int.ofNat (List.length a) - i + f0 else f0 - i) ∧ (if f0 ≤ i1 then Int.ofNat (List.length (List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4)) - i1 + f0 else f0 - i1) < (if f0 ≤ i then Int.ofNat (List.length a) - i + f0 else f0 - i)) ∧ ((0 : ℤ) ≤ f0 ∧ f0 < Int.ofNat (List.length (List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4))) ∧ ((0 : ℤ) ≤ i1 ∧ i1 < Int.ofNat (List.length (List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4))) ∧ ((0 : ℤ) ≤ i1 ∧ i1 < Int.ofNat (List.length (List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4))) ∧ ¬i1 = f0 ∧ eq ((List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4)[Int.toNat i1]!) dummy ∧ eq ((List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4)[Int.toNat f0]!) dummy ∧ between i1 i1 f0 ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length (List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4)) → between i1 k f0 → ¬k = i1 → neq ((List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4)[Int.toNat k]!) dummy) ∧ ¬view1 (keym1 dummy) = true ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length (List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4)) → (let x : key := (List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4)[Int.toNat k]!; neq x dummy → view1 (keym1 x) = true ∧ Function.update loc1 (keym1 xi) j (keym1 x) = k)) ∧ (let n1 : ℤ := Int.ofNat (List.length (List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4)); ∀(x : key), view1 (keym1 x) = true → (let k : ℤ := Function.update loc1 (keym1 xi) j (keym1 x); ((0 : ℤ) ≤ k ∧ k < n1) ∧ eq ((List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4)[Int.toNat k]!) x ∧ (∀(l : ℤ), (0 : ℤ) ≤ l ∧ l < n1 → between (bucket x n1) l k → neq ((List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4)[Int.toNat l]!) x ∧ (neq ((List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4)[Int.toNat l]!) dummy ∨ l = i1 ∧ between i1 i1 k))))) ∧ (∀(loc2 : keym -> ℤ) (a3 : List key), List.length a3 = List.length (List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4) → numof a3 (0 : ℤ) (Int.ofNat (List.length a3)) = numof (List.set (List.set a (Int.toNat j) xi) (Int.toNat i1) o4) (0 : ℤ) (Int.ofNat (List.length a3)) ∧ valid a3 view1 loc2 → numof a3 (0 : ℤ) (Int.ofNat (List.length a3)) = numof a (0 : ℤ) (Int.ofNat (List.length a3)) ∧ valid a3 view1 loc2))))))))) else valid a view1 loc1))
  := sorry
end linear_probing_LinearProbing_deleteqtvc
