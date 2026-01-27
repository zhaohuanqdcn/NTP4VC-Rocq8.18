namespace MyEnum
inductive enum where
  | Done : enum
  | Next : ℤ -> Tree.tree -> enum -> enum
axiom inhabited_axiom_enum : Inhabited enum
attribute [instance] inhabited_axiom_enum
noncomputable def enum_elements : enum -> List ℤ
  | enum.Done => ([] : List ℤ)
  | (enum.Next x r e1) => List.cons x (Tree.tree_elements r ++ enum_elements e1)
end MyEnum
