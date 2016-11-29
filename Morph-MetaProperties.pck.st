'From Cuis 5.0 of 7 November 2016 [latest update: #2984] on 28 November 2016 at 4:44:39 pm'!
'Description MetaProperties describe and define public visual properties of Morphs.  They are used by a PropertyEditor.'!
!provides: 'Morph-MetaProperties' 1 1!
!requires: 'Graphics-Files-Additional' 1 18 nil!
!requires: 'Morphic-Misc1' 1 86 nil!
!requires: 'Cuis-Base' 50 2984 nil!
!classDefinition: #PropertyEditor category: #'Morph-MetaProperties'!
MenuMorph subclass: #PropertyEditor
	instanceVariableNames: 'morph metaProps showAllIvars showAllProps'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morph-MetaProperties'!
!classDefinition: 'PropertyEditor class' category: #'Morph-MetaProperties'!
PropertyEditor class
	instanceVariableNames: ''!

!classDefinition: #PropertyMorph category: #'Morph-MetaProperties'!
MenuItemMorph subclass: #PropertyMorph
	instanceVariableNames: ''
	classVariableNames: 'BlankIcon BoolIcon CharIcon ChronIcon ClassIcon ClosureIcon CollectIcon CpxIcon FalseIcon FileIcon FloatIcon FolderIcon FontIcon FracIcon IntIcon NilIcon ObjIcon OneOfIcon PtIcon RngIcon StrIcon StreamIcon SymIcon TrueIcon WindowIcon'
	poolDictionaries: ''
	category: 'Morph-MetaProperties'!
!classDefinition: 'PropertyMorph class' category: #'Morph-MetaProperties'!
PropertyMorph class
	instanceVariableNames: ''!

!classDefinition: #VisualPropertyMorph category: #'Morph-MetaProperties'!
MenuItemMorph subclass: #VisualPropertyMorph
	instanceVariableNames: 'metaProperty name prevValue targetMorph'
	classVariableNames: 'BlankIcon BoolIcon CharIcon ChronIcon ClassIcon ClosureIcon CollectIcon CpxIcon FalseIcon FileIcon FloatIcon FolderIcon FontIcon FracIcon IntIcon NilIcon ObjIcon OneOfIcon PtIcon RngIcon StrIcon StreamIcon SymIcon TrueIcon WindowIcon'
	poolDictionaries: ''
	category: 'Morph-MetaProperties'!
!classDefinition: 'VisualPropertyMorph class' category: #'Morph-MetaProperties'!
VisualPropertyMorph class
	instanceVariableNames: ''!

!classDefinition: #MetaProperty category: #'Morph-MetaProperties'!
Object subclass: #MetaProperty
	instanceVariableNames: 'isImmutable'
	classVariableNames: 'MetaPropDict'
	poolDictionaries: ''
	category: 'Morph-MetaProperties'!
!classDefinition: 'MetaProperty class' category: #'Morph-MetaProperties'!
MetaProperty class
	instanceVariableNames: ''!


!PropertyEditor commentStamp: '<historical>' prior: 0!
My instances present the public visual properties of Morphs -- those which have MetaProperties.

MetaProperties can be added to any Morph and all submorphs will inherit them.

See class MetaProperty and this class for details. !

!VisualPropertyMorph commentStamp: '<historical>' prior: 0!
My instances display a menu selection for a Morph visual property.  
See documentation method: MetaProperty class>>whyMe

ivars:
  metaProperty -- a PropertyMeta
  name -- property name (a symbol)
  prevValue -- cached previous property value (used for undo)
  targetMorph -- changes to me are reflected in this specific morph
!

!MetaProperty commentStamp: '<historical>' prior: 0!
I am an abstract class for Morph meta-properties.

My instances are used to allow generation of PropertyEditors for Morphs.

See method #whyMe in the class side for documentation.!

!PropertyEditor methodsFor: 'initialization' stamp: 'KenD 11/28/2016 08:24:25'!
forMorph: aMorph
	"Initialize, but do NOT open this instance"

	morph := aMorph.  "NB: immutable"
	showAllIvars  := false.
	showAllProps := false.
	metaProps := MetaProperty metaPropsForMorph: aMorph
	! !

!PropertyEditor class methodsFor: 'instance creation' stamp: 'KenD 11/28/2016 08:19:15'!
forMorph: aMorph

	^ self new forMorph: aMorph! !

!VisualPropertyMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 11/28/2016 16:38:00'!
allowsMorphDrop
	"Answer whether we accept dropping morphs. Redefined to answer true."

	^ true! !

!VisualPropertyMorph methodsFor: 'testing' stamp: 'KenD 11/28/2016 16:37:33'!
allowsValue: aValue

	^ self metaProperty accepts: aValue! !

!VisualPropertyMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 11/28/2016 16:42:34'!
cleanUpForMorph: aMorph.
	"@@FIXME: graphical animation of rejected drop@@"

	aMorph delete! !

!VisualPropertyMorph methodsFor: 'editing' stamp: 'KenD 11/28/2016 16:37:00'!
edit

	self metaProperty edit: self targetMorph ! !

!VisualPropertyMorph methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:29:30'!
metaProperty

	^ metaProperty! !

!VisualPropertyMorph methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:29:37'!
name

	^ name! !

!VisualPropertyMorph methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:29:58'!
prevValue

	^ prevValue! !

!VisualPropertyMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 11/28/2016 16:38:18'!
processMouseDown: evt localPosition: localEventPosition
	"Do nothing upon mouse-down except inform the hand to watch for a 
	click; wait until an ensuing #click: message gets dispatched"
"
	Transcript newLine; show: (self name , ' got #processMouseDown:localPosition:').  
"
	evt wasHandled: true.
	evt hand waitForClicksOrDrag: self
				event: evt
				dragSel: #dragEvent:localPosition:
				clkSel: #mouseButton1Down:localPosition:

! !

!VisualPropertyMorph methodsFor: 'initialization' stamp: 'KenD 11/28/2016 16:32:10'!
propName: aSymbol morph: aMorph propMeta: aPropertyDescriptor

	super initialize.
	name := aSymbol.
	targetMorph := aMorph.
	metaProperty := aPropertyDescriptor.
	prevValue := aMorph valueOfProperty: aSymbol.	
	self setContents;
		 target: self;
		 icon: prevValue icon; 
		 selector: #edit
! !

!VisualPropertyMorph methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:30:25'!
propertyDescriptor

	^ self metaProperty! !

!VisualPropertyMorph methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:30:35'!
propertyName

	^ self name ! !

!VisualPropertyMorph methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:31:08'!
propertyValue

	^ self targetMorph valueOfProperty: self name! !

!VisualPropertyMorph methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:32:38'!
propertyValue: newValue
	"Assumed checking already done.  Does NOT change cashed value"

	self targetMorph setProperty: self name toValue: (self metaProperty dropAcceptor value: newValue).
	self setContents.
	self owner ifNotNil: [ self owner adjustSubmorphsLayout ].
! !

!VisualPropertyMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 11/28/2016 16:41:45'!
schedulePostRemovalOf: aMorph
	"See comment in VisualPropertyMorph>>wantsDroppedMorph:event:"

	self addAlarm: #cleanUpForMorph: with: aMorph after: 0.1
! !

!VisualPropertyMorph methodsFor: 'private' stamp: 'KenD 11/28/2016 16:33:26'!
setContents
	"(re)set my content string"

	self contents: ( (name asString , ':  ', (self propertyValue printString))
						truncateWithElipsisTo: 40 ).
	self icon: (self propertyValue icon)! !

!VisualPropertyMorph methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:35:46'!
targetMorph

	^ targetMorph ! !

!VisualPropertyMorph methodsFor: 'editing' stamp: 'KenD 11/28/2016 16:35:20'!
undo
	"Reset value from remembered value"

	self targetMorph setProperty: self name  toValue: self prevValue! !

!VisualPropertyMorph methodsFor: 'private' stamp: 'KenD 11/28/2016 16:34:02'!
valueMorph

	^ SignMorph forObject: self propertyValue! !

!VisualPropertyMorph methodsFor: 'dropping/grabbing' stamp: 'KenD 11/28/2016 16:38:34'!
wantsDroppedMorph: aMorph event: evt
	"Return true if the receiver wishes to accept the given morph, which is being dropped by a hand in response to the given event. Note that for a successful drop operation both parties need to agree. The symmetric check is done automatically via aMorph wantsToBeDroppedInto: self."

	| dropValue |
	(aMorph isKindOf: SignMorph)
		ifTrue: [ dropValue := aMorph object ]
		ifFalse: [ 
			(aMorph isKindOf: DropColorMorph)
			ifTrue: [dropValue := aMorph color] 
			ifFalse: [dropValue := aMorph] 
		].
	(self allowsValue: dropValue)
		ifTrue: [ self propertyValue: dropValue ].
	
	"We can't just delet aMorph as rejecting the drop adds it to tis old owner at 0@0.
	 So we accept the drop, but then delete aMorph."
	self schedulePostRemovalOf: aMorph.  "@@@FIXME: this is ugly!!@@@"

	^ true  "Always accept drop -- even if we reject the value, then delete the morph"! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:21:29'!
blankIcon

	^BlankIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:21:35'!
booleanIcon

	^BoolIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:21:41'!
charIcon

	^CharIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:21:49'!
chronIcon

	^ChronIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:21:55'!
classIcon

	^ClassIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:01'!
closureIcon

	^ClosureIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:09'!
collectionIcon

	^CollectIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:15'!
complexIcon

	^CpxIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:22'!
falseIcon

	^FalseIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:28'!
fileIcon

	^FileIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:36'!
floatIcon

	^FloatIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:41'!
folderIcon

	^FolderIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:46'!
fontIcon

	^FontIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:50'!
fractionIcon

	^FracIcon! !

!VisualPropertyMorph class methodsFor: 'class initialization' stamp: 'KenD 11/28/2016 16:18:45'!
initialize
"
	VisualPropertyMorph initialize.
"
	| dirName |
	dirName :=  ((CodePackage installedPackages at: self category)
		    		  fullFileName upToLastPathSeparator), '/Icons/'.

	BlankIcon := ImageReadWriter formFromFileNamed: dirName , 'Blank.png'.
	BoolIcon := ImageReadWriter formFromFileNamed: dirName , 'Bool.png'.
	CharIcon := ImageReadWriter formFromFileNamed: dirName , 'Char.png'.
	ChronIcon := ImageReadWriter formFromFileNamed: dirName , 'Chron.png'.
	ClassIcon := ImageReadWriter formFromFileNamed: dirName , 'Class.png'.
	ClosureIcon := ImageReadWriter formFromFileNamed: dirName , 'Closure.png'.
	CollectIcon := ImageReadWriter formFromFileNamed: dirName , 'Collect.png'.
	CpxIcon := ImageReadWriter formFromFileNamed: dirName , 'Cpx.png'.
	FalseIcon := ImageReadWriter formFromFileNamed: dirName , 'False.png'.
	FileIcon := ImageReadWriter formFromFileNamed: dirName , 'File.png'.
	FloatIcon := ImageReadWriter formFromFileNamed: dirName , 'Float.png'.
	FolderIcon := ImageReadWriter formFromFileNamed: dirName , 'Folder.png'.
	FontIcon := ImageReadWriter formFromFileNamed: dirName , 'Font.png'.
	FracIcon := ImageReadWriter formFromFileNamed: dirName , 'Frac.png'.
	IntIcon := ImageReadWriter formFromFileNamed: dirName , 'Int.png'.
	NilIcon := ImageReadWriter formFromFileNamed: dirName , 'Nil.png'.
	ObjIcon := ImageReadWriter formFromFileNamed: dirName , 'Obj.png'.
	OneOfIcon := ImageReadWriter formFromFileNamed: dirName , 'OneOf.png'.
	PtIcon := ImageReadWriter formFromFileNamed: dirName , 'Pt.png'.
	RngIcon := ImageReadWriter formFromFileNamed: dirName , 'Rng.png'.
	StrIcon := ImageReadWriter formFromFileNamed: dirName , 'Str.png'.
	StreamIcon := ImageReadWriter formFromFileNamed: dirName , 'Stream.png'.
	SymIcon := ImageReadWriter formFromFileNamed: dirName , 'Sym.png'.
	TrueIcon := ImageReadWriter formFromFileNamed: dirName , 'True.png'.
	WindowIcon := ImageReadWriter formFromFileNamed: dirName , 'Window.png'.
	
! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:56'!
integerIcon

	^IntIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:02'!
nilIcon

	^NilIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:06'!
objectIcon

	^ObjIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:12'!
oneOfIcon

	^OneOfIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:17'!
pointIcon

	^PtIcon! !

!VisualPropertyMorph class methodsFor: 'instance creation' stamp: 'KenD 11/28/2016 16:17:41'!
propName: aSymbol morph: aMorph

	^ self propName: aSymbol morph: aMorph propMeta: MetaProperty default
! !

!VisualPropertyMorph class methodsFor: 'instance creation' stamp: 'KenD 11/28/2016 16:17:54'!
propName: aSymbol morph: aMorph propMeta: aPropertyDescriptor

	^self new propName: aSymbol morph: aMorph propMeta: aPropertyDescriptor
! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:26'!
rangeIcon

	^RngIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:31'!
streamIcon

	^StreamIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:37'!
stringIcon

	^StrIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:43'!
symbolIcon

	^SymIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:49'!
trueIcon

	^TrueIcon! !

!VisualPropertyMorph class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:54'!
windowIcon

	^WindowIcon! !

!MetaProperty class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 08:18:23'!
metaPropsForMorph: aMorph

	self notYetImplemented ! !

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
VisualPropertyMorph initialize!
