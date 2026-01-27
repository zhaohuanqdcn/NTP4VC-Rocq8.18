import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import Why3.map.Const
open Classical
open Lean4Why3
namespace linear_probing_LinearProbing_addqtvc
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
theorem add'vc (x : key) (h : t) (fact0 : neq x dummy) : (if Int.ofNat (List.length (data h)) ≤ (2 : ℤ) * (size h + (1 : ℤ)) then ∀(h1 : t), view h = view h1 ∧ size h = size h1 → Int.ofNat (List.length (data h1)) = (2 : ℤ) * Int.ofNat (List.length (data h)) → size h1 + (1 : ℤ) < Int.ofNat (List.length (data h1)) else size h + (1 : ℤ) < Int.ofNat (List.length (data h))) ∧ (∀(h1 : t), view h = view h1 ∧ size h = size h1 → size h1 + (1 : ℤ) < Int.ofNat (List.length (data h1)) → (let o1 : List key := data h1; (neq x dummy ∧ (let n : ℤ := Int.ofNat (List.length o1); (0 : ℤ) < n ∧ (0 : ℤ) < numof o1 (0 : ℤ) n)) ∧ (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o1)) ∧ (eq (o1[Int.toNat i]!) dummy ∨ eq (o1[Int.toNat i]!) x) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length o1) → between (bucket x (Int.ofNat (List.length o1))) j i → neq (o1[Int.toNat j]!) x ∧ neq (o1[Int.toNat j]!) dummy) → (let o2 : key := dummy; let o3 : List key := data h1; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o3)) ∧ (let o4 : key := o3[Int.toNat i]!; eq o4 o2 = (keym1 o4 = keym1 o2) → (if eq o4 o2 then ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (data h1))) ∧ (List.length (List.set (data h1) (Int.toNat i) x) = List.length (data h1) → List.length (List.set (data h1) (Int.toNat i) x) = List.length (data h1) → getElem! (List.set (data h1) (Int.toNat i) x) ∘ Int.toNat = Function.update (getElem! (data h1) ∘ Int.toNat) i x → (∀(h2 : t), (((0 : ℤ) ≤ size h1 + (1 : ℤ) ∧ size h1 + (1 : ℤ) < Int.ofNat (List.length (List.set (data h1) (Int.toNat i) x))) ∧ (let n : ℤ := Int.ofNat (List.length (List.set (data h1) (Int.toNat i) x)); size h1 + (1 : ℤ) + numof (List.set (data h1) (Int.toNat i) x) (0 : ℤ) n = n) ∧ valid (List.set (data h1) (Int.toNat i) x) (Function.update (view h1) (keym1 x) true) (Function.update (loc h1) (keym1 x) i)) ∧ (Function.update (loc h1) (keym1 x) i = loc h2 ∧ Function.update (view h1) (keym1 x) true = view h2 ∧ List.set (data h1) (Int.toNat i) x = data h2 ∧ size h1 + (1 : ℤ) = size h2 → view h2 = Function.update (view h) (keym1 x) true))) else ∀(h2 : t), (((0 : ℤ) ≤ size h1 ∧ size h1 < Int.ofNat (List.length (data h1))) ∧ (let n : ℤ := Int.ofNat (List.length (data h1)); size h1 + numof (data h1) (0 : ℤ) n = n) ∧ valid (data h1) (Function.update (view h1) (keym1 x) true) (Function.update (loc h1) (keym1 x) i)) ∧ (Function.update (loc h1) (keym1 x) i = loc h2 ∧ Function.update (view h1) (keym1 x) true = view h2 ∧ data h1 = data h2 ∧ size h1 = size h2 → view h2 = Function.update (view h) (keym1 x) true)))))))
  := sorry
end linear_probing_LinearProbing_addqtvc
