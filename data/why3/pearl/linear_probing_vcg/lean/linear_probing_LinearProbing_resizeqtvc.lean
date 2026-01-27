import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import Why3.map.Const
open Classical
open Lean4Why3
namespace linear_probing_LinearProbing_resizeqtvc
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
theorem resize'vc (h : t) : let n : ℤ := Int.ofNat (List.length (data h)); let n2 : ℤ := (2 : ℤ) * n; (0 : ℤ) ≤ n2 ∧ (∀(a : List key), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n2 → a[Int.toNat i]! = dummy) ∧ Int.ofNat (List.length a) = n2 → (let o1 : keym -> ℤ := Const.const (0 : ℤ); let o2 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ o2 + (1 : ℤ) → (numof a (0 : ℤ) n2 = numof (data h) (0 : ℤ) (0 : ℤ) + n2 - (0 : ℤ) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < n2 → neq (a[Int.toNat j]!) dummy → view h (keym1 (a[Int.toNat j]!)) = true ∧ o1 (keym1 (a[Int.toNat j]!)) = j) ∧ (∀(x : key), view h (keym1 x) = true → (if loc h (keym1 x) < (0 : ℤ) then let j2 : ℤ := o1 (keym1 x); ((0 : ℤ) ≤ j2 ∧ j2 < n2) ∧ eq (a[Int.toNat j2]!) x ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < n2 → between (bucket x n2) k j2 → neq (a[Int.toNat k]!) x ∧ neq (a[Int.toNat k]!) dummy) else ∀(j2 : ℤ), (0 : ℤ) ≤ j2 ∧ j2 < n2 → neq (a[Int.toNat j2]!) x))) ∧ (∀(l : keym -> ℤ) (a1 : List key), List.length a1 = List.length a → (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o2) ∧ numof a1 (0 : ℤ) n2 = numof (data h) (0 : ℤ) i + n2 - i ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < n2 → neq (a1[Int.toNat j]!) dummy → view h (keym1 (a1[Int.toNat j]!)) = true ∧ l (keym1 (a1[Int.toNat j]!)) = j) ∧ (∀(x : key), view h (keym1 x) = true → (if loc h (keym1 x) < i then let j2 : ℤ := l (keym1 x); ((0 : ℤ) ≤ j2 ∧ j2 < n2) ∧ eq (a1[Int.toNat j2]!) x ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < n2 → between (bucket x n2) k j2 → neq (a1[Int.toNat k]!) x ∧ neq (a1[Int.toNat k]!) dummy) else ∀(j2 : ℤ), (0 : ℤ) ≤ j2 ∧ j2 < n2 → neq (a1[Int.toNat j2]!) x)) → (let o3 : List key := data h; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o3)) ∧ (let x : key := o3[Int.toNat i]!; let o4 : key := dummy; neq x o4 = (¬keym1 x = keym1 o4) → (if neq x o4 then (neq x dummy ∧ (let n1 : ℤ := Int.ofNat (List.length a1); (0 : ℤ) < n1 ∧ (0 : ℤ) < numof a1 (0 : ℤ) n1)) ∧ (∀(j : ℤ), ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a1)) ∧ (eq (a1[Int.toNat j]!) dummy ∨ eq (a1[Int.toNat j]!) x) ∧ (∀(j1 : ℤ), (0 : ℤ) ≤ j1 ∧ j1 < Int.ofNat (List.length a1) → between (bucket x (Int.ofNat (List.length a1))) j1 j → neq (a1[Int.toNat j1]!) x ∧ neq (a1[Int.toNat j1]!) dummy) → ((0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a1)) ∧ (List.length (List.set a1 (Int.toNat j) x) = List.length a1 → getElem! (List.set a1 (Int.toNat j) x) ∘ Int.toNat = Function.update (getElem! a1 ∘ Int.toNat) j x → numof (List.set a1 (Int.toNat j) x) (0 : ℤ) n2 = numof (data h) (0 : ℤ) (i + (1 : ℤ)) + n2 - (i + (1 : ℤ)) ∧ (∀(j1 : ℤ), (0 : ℤ) ≤ j1 ∧ j1 < n2 → neq ((List.set a1 (Int.toNat j) x)[Int.toNat j1]!) dummy → view h (keym1 ((List.set a1 (Int.toNat j) x)[Int.toNat j1]!)) = true ∧ Function.update l (keym1 x) j (keym1 ((List.set a1 (Int.toNat j) x)[Int.toNat j1]!)) = j1) ∧ (∀(x1 : key), view h (keym1 x1) = true → (if loc h (keym1 x1) < i + (1 : ℤ) then let j2 : ℤ := Function.update l (keym1 x) j (keym1 x1); ((0 : ℤ) ≤ j2 ∧ j2 < n2) ∧ eq ((List.set a1 (Int.toNat j) x)[Int.toNat j2]!) x1 ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < n2 → between (bucket x1 n2) k j2 → neq ((List.set a1 (Int.toNat j) x)[Int.toNat k]!) x1 ∧ neq ((List.set a1 (Int.toNat j) x)[Int.toNat k]!) dummy) else ∀(j2 : ℤ), (0 : ℤ) ≤ j2 ∧ j2 < n2 → neq ((List.set a1 (Int.toNat j) x)[Int.toNat j2]!) x1)))) else numof a1 (0 : ℤ) n2 = numof (data h) (0 : ℤ) (i + (1 : ℤ)) + n2 - (i + (1 : ℤ)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < n2 → neq (a1[Int.toNat j]!) dummy → view h (keym1 (a1[Int.toNat j]!)) = true ∧ l (keym1 (a1[Int.toNat j]!)) = j) ∧ (∀(x1 : key), view h (keym1 x1) = true → (if loc h (keym1 x1) < i + (1 : ℤ) then let j2 : ℤ := l (keym1 x1); ((0 : ℤ) ≤ j2 ∧ j2 < n2) ∧ eq (a1[Int.toNat j2]!) x1 ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < n2 → between (bucket x1 n2) k j2 → neq (a1[Int.toNat k]!) x1 ∧ neq (a1[Int.toNat k]!) dummy) else ∀(j2 : ℤ), (0 : ℤ) ≤ j2 ∧ j2 < n2 → neq (a1[Int.toNat j2]!) x1)))))) ∧ (numof a1 (0 : ℤ) n2 = numof (data h) (0 : ℤ) (o2 + (1 : ℤ)) + n2 - (o2 + (1 : ℤ)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < n2 → neq (a1[Int.toNat j]!) dummy → view h (keym1 (a1[Int.toNat j]!)) = true ∧ l (keym1 (a1[Int.toNat j]!)) = j) ∧ (∀(x : key), view h (keym1 x) = true → (if loc h (keym1 x) < o2 + (1 : ℤ) then let j2 : ℤ := l (keym1 x); ((0 : ℤ) ≤ j2 ∧ j2 < n2) ∧ eq (a1[Int.toNat j2]!) x ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < n2 → between (bucket x n2) k j2 → neq (a1[Int.toNat k]!) x ∧ neq (a1[Int.toNat k]!) dummy) else ∀(j2 : ℤ), (0 : ℤ) ≤ j2 ∧ j2 < n2 → neq (a1[Int.toNat j2]!) x)) → (∀(h1 : t), (((0 : ℤ) ≤ size h ∧ size h < Int.ofNat (List.length a1)) ∧ (let n3 : ℤ := Int.ofNat (List.length a1); size h + numof a1 (0 : ℤ) n3 = n3) ∧ valid a1 (view h) l) ∧ (l = loc h1 ∧ view h = view h1 ∧ a1 = data h1 ∧ size h = size h1 → Int.ofNat (List.length (data h1)) = (2 : ℤ) * Int.ofNat (List.length (data h))))))) ∧ (o2 + (1 : ℤ) < (0 : ℤ) → (∀(h1 : t), (((0 : ℤ) ≤ size h ∧ size h < Int.ofNat (List.length a)) ∧ (let n3 : ℤ := Int.ofNat (List.length a); size h + numof a (0 : ℤ) n3 = n3) ∧ valid a (view h) o1) ∧ (o1 = loc h1 ∧ view h = view h1 ∧ a = data h1 ∧ size h = size h1 → Int.ofNat (List.length (data h1)) = (2 : ℤ) * Int.ofNat (List.length (data h)))))))
  := sorry
end linear_probing_LinearProbing_resizeqtvc
