namespace Pred
noncomputable def predExtensionalEqual {α : Type} [Inhabited α] (p : α -> Bool) (q : α -> Bool) := ∀(x : α), (p x = true) = (q x = true)
axiom predicateExtensionality {α : Type} [Inhabited α] (p : α -> Bool) (q : α -> Bool) (fact0 : predExtensionalEqual p q) : p = q
noncomputable def evalp {α : Type} [Inhabited α] (p : α -> Bool) (x : α) := p x = true
axiom pupdate :  {α : Type} -> [Inhabited α] -> (α -> Bool) -> α -> Bool -> α -> Bool
axiom pupdate_def {α : Type} [Inhabited α] (p : α -> Bool) (x : α) (y : Bool) (z : α) : (pupdate p x y z = true) = (if x = z then y = true else p z = true)
axiom pcompose :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (β -> Bool) -> (α -> β) -> α -> Bool
axiom pcompose_def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (p : β -> Bool) (f : α -> β) (x : α) : (pcompose p f x = true) = (p (f x) = true)
axiom pfalse :  {α : Type} -> [Inhabited α] -> α -> Bool
axiom pfalse_def {α : Type} [Inhabited α] (x : α) : ¬pfalse x = true
axiom ptrue :  {α : Type} -> [Inhabited α] -> α -> Bool
axiom ptrue_def {α : Type} [Inhabited α] (x : α) : ptrue x = true
end Pred
