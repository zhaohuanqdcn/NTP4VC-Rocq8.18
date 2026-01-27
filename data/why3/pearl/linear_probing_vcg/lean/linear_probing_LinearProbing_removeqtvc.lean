import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import Why3.map.Const
open Classical
open Lean4Why3
namespace linear_probing_LinearProbing_removeqtvc
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
theorem remove'vc (x : key) (h : t) (fact0 : neq x dummy) : let o1 : List key := data h; (neq x dummy ∧ (let n : ℤ := Int.ofNat (List.length o1); (0 : ℤ) < n ∧ (0 : ℤ) < numof o1 (0 : ℤ) n)) ∧ (∀(j : ℤ), ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length o1)) ∧ (eq (o1[Int.toNat j]!) dummy ∨ eq (o1[Int.toNat j]!) x) ∧ (∀(j1 : ℤ), (0 : ℤ) ≤ j1 ∧ j1 < Int.ofNat (List.length o1) → between (bucket x (Int.ofNat (List.length o1))) j1 j → neq (o1[Int.toNat j1]!) x ∧ neq (o1[Int.toNat j1]!) dummy) → (let o2 : key := dummy; let o3 : List key := data h; ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length o3)) ∧ (let o4 : key := o3[Int.toNat j]!; neq o4 o2 = (¬keym1 o4 = keym1 o2) → (if neq o4 o2 then let o5 : key := dummy; let o6 : List key := data h; ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length o6)) ∧ (List.length (List.set o6 (Int.toNat j) o5) = List.length o6 → List.length (List.set o6 (Int.toNat j) o5) = List.length (data h) → getElem! (List.set o6 (Int.toNat j) o5) ∘ Int.toNat = Function.update (getElem! o6 ∘ Int.toNat) j o5 → (let o7 : ℤ := next (Int.ofNat (List.length (data h))) j; (((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length (List.set o6 (Int.toNat j) o5))) ∧ ((0 : ℤ) ≤ o7 ∧ o7 < Int.ofNat (List.length (List.set o6 (Int.toNat j) o5))) ∧ ¬o7 = j ∧ (if j ≤ o7 then (1 : ℤ) ≤ numof (List.set o6 (Int.toNat j) o5) o7 (Int.ofNat (List.length (List.set o6 (Int.toNat j) o5))) + numof (List.set o6 (Int.toNat j) o5) (0 : ℤ) j else (1 : ℤ) ≤ numof (List.set o6 (Int.toNat j) o5) o7 j) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length (List.set o6 (Int.toNat j) o5)) → between j k o7 → ¬k = j → neq ((List.set o6 (Int.toNat j) o5)[Int.toNat k]!) dummy)) ∧ (∀(f0 : ℤ), ((0 : ℤ) ≤ f0 ∧ f0 < Int.ofNat (List.length (List.set o6 (Int.toNat j) o5))) ∧ ¬f0 = j ∧ eq ((List.set o6 (Int.toNat j) o5)[Int.toNat f0]!) dummy ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length (List.set o6 (Int.toNat j) o5)) → between j k f0 → ¬k = j → neq ((List.set o6 (Int.toNat j) o5)[Int.toNat k]!) dummy) → (((0 : ℤ) ≤ f0 ∧ f0 < Int.ofNat (List.length (List.set o6 (Int.toNat j) o5))) ∧ ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length (List.set o6 (Int.toNat j) o5))) ∧ ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length (List.set o6 (Int.toNat j) o5))) ∧ ¬j = f0 ∧ eq ((List.set o6 (Int.toNat j) o5)[Int.toNat j]!) dummy ∧ eq ((List.set o6 (Int.toNat j) o5)[Int.toNat f0]!) dummy ∧ between j j f0 ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length (List.set o6 (Int.toNat j) o5)) → between j k f0 → ¬k = j → neq ((List.set o6 (Int.toNat j) o5)[Int.toNat k]!) dummy) ∧ ¬Function.update (view h) (keym1 x) false (keym1 dummy) = true ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length (List.set o6 (Int.toNat j) o5)) → (let x1 : key := (List.set o6 (Int.toNat j) o5)[Int.toNat k]!; neq x1 dummy → Function.update (view h) (keym1 x) false (keym1 x1) = true ∧ loc h (keym1 x1) = k)) ∧ (let n : ℤ := Int.ofNat (List.length (List.set o6 (Int.toNat j) o5)); ∀(x1 : key), Function.update (view h) (keym1 x) false (keym1 x1) = true → (let k : ℤ := loc h (keym1 x1); ((0 : ℤ) ≤ k ∧ k < n) ∧ eq ((List.set o6 (Int.toNat j) o5)[Int.toNat k]!) x1 ∧ (∀(l : ℤ), (0 : ℤ) ≤ l ∧ l < n → between (bucket x1 n) l k → neq ((List.set o6 (Int.toNat j) o5)[Int.toNat l]!) x1 ∧ (neq ((List.set o6 (Int.toNat j) o5)[Int.toNat l]!) dummy ∨ l = j ∧ between j j k))))) ∧ (∀(l : keym -> ℤ) (h_data : List key), List.length h_data = List.length (List.set o6 (Int.toNat j) o5) → List.length h_data = List.length (List.set o6 (Int.toNat j) o5) → numof h_data (0 : ℤ) (Int.ofNat (List.length h_data)) = numof (List.set o6 (Int.toNat j) o5) (0 : ℤ) (Int.ofNat (List.length h_data)) ∧ valid h_data (Function.update (view h) (keym1 x) false) l → (∀(h1 : t), (((0 : ℤ) ≤ size h - (1 : ℤ) ∧ size h - (1 : ℤ) < Int.ofNat (List.length h_data)) ∧ (let n : ℤ := Int.ofNat (List.length h_data); size h - (1 : ℤ) + numof h_data (0 : ℤ) n = n) ∧ valid h_data (Function.update (view h) (keym1 x) false) l) ∧ (l = loc h1 ∧ Function.update (view h) (keym1 x) false = view h1 ∧ h_data = data h1 ∧ size h - (1 : ℤ) = size h1 → view h1 = Function.update (view h) (keym1 x) false)))))) else view h = Function.update (view h) (keym1 x) false))))
  := sorry
end linear_probing_LinearProbing_removeqtvc
