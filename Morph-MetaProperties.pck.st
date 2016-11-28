'From Cuis 5.0 of 7 November 2016 [latest update: #2984] on 27 November 2016 at 4:34:50 pm'!
'Description MetaProperties describe and define public visual properties of Morphs.  They are used by a PropertyEditor.'!
!provides: 'Morph-MetaProperties' 1 0!
!requires: 'Cuis-Base' 50 2984 nil!
!requires: 'Morphic-Misc1' 1 86 nil!
!classDefinition: #MetaProperty category: #'Morph-MetaProperties'!
Object subclass: #MetaProperty
	instanceVariableNames: 'isImmutable'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morph-MetaProperties'!
!classDefinition: 'MetaProperty class' category: #'Morph-MetaProperties'!
MetaProperty class
	instanceVariableNames: ''!


!MetaProperty commentStamp: '<historical>' prior: 0!
I am an abstract class for Morph meta-properties.

My instances are used to allow generation of PropertyEditors for Morphs.

See method #whyMe in the class side for documentation.!

!MetaProperty class methodsFor: 'documentation' stamp: 'KenD 11/27/2016 16:30:47'!
whyMe

^
'
Some Morph properties support private mechanics, but others should be visually shared and displayed in a PropertyEditor so that users can easily adjust visual properties.

The basic idea here is to allow authors of Morph classes to attach MetaProperties so that a Morph''s instance variables show up in a PropertyEditor.  Instance variables are private/hidden by default.

To remove walls, a morphs public properties (those that have been annotated to show up in a PropertyEditor) can be updated by fill-in or DragNDrop for example from a Color, Font or some other Pallet or selected from a menu select list.

Note that these (public) visual properties may be virtual.  The idea being that changing a property value may store a value into an instance variable, a #property, or invoke a bit of code that does the right thing and maintains some invariant.

MetaProperties are considered immutable and may be shared.  They are associated with Morph classes and are inherited by Morph subclasses.

See the #examples class category.
'! !
