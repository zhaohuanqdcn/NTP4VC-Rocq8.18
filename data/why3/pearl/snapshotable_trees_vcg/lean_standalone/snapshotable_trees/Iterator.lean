namespace Iterator
structure iterator where
  it : MyEnum.enum
axiom inhabited_axiom_iterator : Inhabited iterator
attribute [instance] inhabited_axiom_iterator
noncomputable def elements (i : iterator) := MyEnum.enum_elements (iterator.it i)
noncomputable def hasNext (i : iterator) := ¬iterator.it i = MyEnum.enum.Done
end Iterator
