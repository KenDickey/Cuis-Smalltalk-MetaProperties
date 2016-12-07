'From Cuis 5.0 of 7 November 2016 [latest update: #2995] on 6 December 2016 at 7:40:17 pm'!
'Description MetaProperties describe and define public visual properties of Morphs.  They are used by a PropertyEditor.'!
!provides: 'Morph-MetaProperties' 1 31!
!requires: 'Cuis-Base' 50 2984 nil!
!requires: 'Morphic-Misc1' 1 92 nil!
!requires: 'Graphics-Files-Additional' 1 18 nil!
!classDefinition: #VisualPropertyEditor category: #'Morph-MetaProperties'!
MenuMorph subclass: #VisualPropertyEditor
	instanceVariableNames: 'targetMorph metaProps showAllIvars showAllProps'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morph-MetaProperties'!
!classDefinition: 'VisualPropertyEditor class' category: #'Morph-MetaProperties'!
VisualPropertyEditor class
	instanceVariableNames: ''!

!classDefinition: #OrdinaryPropertyMenuItem category: #'Morph-MetaProperties'!
MenuItemMorph subclass: #OrdinaryPropertyMenuItem
	instanceVariableNames: 'accessKind name targetMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morph-MetaProperties'!
!classDefinition: 'OrdinaryPropertyMenuItem class' category: #'Morph-MetaProperties'!
OrdinaryPropertyMenuItem class
	instanceVariableNames: ''!

!classDefinition: #VisualPropertyMenuItem category: #'Morph-MetaProperties'!
MenuItemMorph subclass: #VisualPropertyMenuItem
	instanceVariableNames: 'metaProperty name prevValue targetMorph'
	classVariableNames: 'BlankIcon BoolIcon CharIcon ChronIcon ClassIcon ClosureIcon CollectIcon CpxIcon FalseIcon FileIcon FloatIcon FolderIcon FontIcon FracIcon IntIcon NilIcon ObjIcon OneOfIcon PtIcon RngIcon StrIcon StreamIcon SymIcon TrueIcon WindowIcon'
	poolDictionaries: ''
	category: 'Morph-MetaProperties'!
!classDefinition: 'VisualPropertyMenuItem class' category: #'Morph-MetaProperties'!
VisualPropertyMenuItem class
	instanceVariableNames: ''!

!classDefinition: #VisualIVarMenuItem category: #'Morph-MetaProperties'!
VisualPropertyMenuItem subclass: #VisualIVarMenuItem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morph-MetaProperties'!
!classDefinition: 'VisualIVarMenuItem class' category: #'Morph-MetaProperties'!
VisualIVarMenuItem class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyTests category: #'Morph-MetaProperties'!
TestCase subclass: #MetaPropertyTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morph-MetaProperties'!
!classDefinition: 'MetaPropertyTests class' category: #'Morph-MetaProperties'!
MetaPropertyTests class
	instanceVariableNames: ''!

!classDefinition: #MetaProperty category: #'Morph-MetaProperties'!
Object subclass: #MetaProperty
	instanceVariableNames: 'kind'
	classVariableNames: 'MetaPropDict PreDefinedPropsDict'
	poolDictionaries: ''
	category: 'Morph-MetaProperties'!
!classDefinition: 'MetaProperty class' category: #'Morph-MetaProperties'!
MetaProperty class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyFrom category: #'Morph-MetaProperties'!
MetaProperty subclass: #MetaPropertyFrom
	instanceVariableNames: 'minValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morph-MetaProperties'!
!classDefinition: 'MetaPropertyFrom class' category: #'Morph-MetaProperties'!
MetaPropertyFrom class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyOneOf category: #'Morph-MetaProperties'!
MetaProperty subclass: #MetaPropertyOneOf
	instanceVariableNames: 'choiceCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morph-MetaProperties'!
!classDefinition: 'MetaPropertyOneOf class' category: #'Morph-MetaProperties'!
MetaPropertyOneOf class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyRange category: #'Morph-MetaProperties'!
MetaProperty subclass: #MetaPropertyRange
	instanceVariableNames: 'minValue maxValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morph-MetaProperties'!
!classDefinition: 'MetaPropertyRange class' category: #'Morph-MetaProperties'!
MetaPropertyRange class
	instanceVariableNames: ''!

!classDefinition: #MetaPropertyViaTest category: #'Morph-MetaProperties'!
MetaProperty subclass: #MetaPropertyViaTest
	instanceVariableNames: 'testClosure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morph-MetaProperties'!
!classDefinition: 'MetaPropertyViaTest class' category: #'Morph-MetaProperties'!
MetaPropertyViaTest class
	instanceVariableNames: ''!


!VisualPropertyEditor commentStamp: '<historical>' prior: 0!
My instances present the public visual properties of Morphs -- those which have MetaProperties.

MetaProperties can be added to any Morph class and all submorph classes will inherit them.

See class MetaProperty and my class #initialize method for details. !

!OrdinaryPropertyMenuItem commentStamp: '<historical>' prior: 0!
My instances supply menu iterms which can have their values dragged for DragNDrop.

My accessKind is either #property #instanceVar.!

!VisualPropertyMenuItem commentStamp: '<historical>' prior: 0!
My instances display a menu selection for a Morph visual property.  
See documentation method: MetaProperty class>>whyMe

ivars:
  metaProperty -- a PropertyMetaVisualPropertyMenuItem
  name -- property name (a symbol)
  prevValue -- cached previous property value (used for undo)
  targetMorph -- changes to me are reflected in this specific morph
!

!VisualIVarMenuItem commentStamp: '<historical>' prior: 0!
Like for a Property but for IVars.!

!MetaPropertyTests commentStamp: '<historical>' prior: 0!
Unit tests for MetaProeprties!

!MetaProperty commentStamp: '<historical>' prior: 0!
I am the parent class for Morph meta-properties.  

My instances are immutable and may be shared.  See class side for common MetaProperties.

I maintain MetaPropDict, a dictionary of Class->Dict(name->metaProp).  See #MetaProperty class>>MetapropDictForClass:

Also, there is PreDefinedPropsDict, which contains metaPropName->metaProp for sharing.  These pre-defined MetaProperties are typically added in my class and subclass #initialize methods.
e.g.
   MetaProperty metaPropNamed: #acceptsColor.

My instances are used to allow generation of PropertyEditors for Morphs.

See method #whyMe in the class side for documentation.


"Simple Class test"
(MetaProperty kind: String) accepts: #symbol.

"OneOf choice"
(MetaPropertyOneOf kind: Symbol choices: #(fee fie fo fum)) accepts: #fee.

"Number Range"
(MetaPropertyRange kind: Number minValue: 1 maxValue: 3) accepts: 1.2.

"Point Range"
(MetaPropertyRange kind: Point minValue: (0@0) maxValue: (4@4)) accepts: 1@5.

"Positive Point"
(MetaPropertyFrom kind: Point minValue: 0@0) accepts: 23@47.

"Pattern Match"
(MetaPropertyViaTest kind: String test: [ :s | '*baz*' match: s ]) accepts: 'mombazzi'.

!

!MetaPropertyFrom commentStamp: '<historical>' prior: 0!
I accept  minValue <= newValue!

!MetaPropertyOneOf commentStamp: '<historical>' prior: 0!
I only accept values which are included in choiceCollection.!

!MetaPropertyRange commentStamp: '<historical>' prior: 0!
I accept values in a range where:  minValue <= newValue <= maxValue.
!

!MetaPropertyViaTest commentStamp: '<historical>' prior: 0!
I test via  (aClosure value: newValue).

aClosure should take one argument are return a boolean.!

!ProtoObject methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:21:49'!
icon

	^ VisualPropertyMenuItem blankIcon! !

!Object methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:21:53'!
icon

	^ VisualPropertyMenuItem objectIcon ! !

!Object methodsFor: '*morph-metaproperties' stamp: 'KenD 12/6/2016 18:45:12'!
morphForDrag
	"Answer a morph suitable for DragNDrop"
	
	^ SignMorph forObject: self
! !

!Boolean methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:22:02'!
icon

	^ VisualPropertyMenuItem booleanIcon ! !

!False methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:22:11'!
icon

	^ VisualPropertyMenuItem falseIcon ! !

!True methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:22:07'!
icon

	^ VisualPropertyMenuItem trueIcon ! !

!UndefinedObject methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:21:57'!
icon

	^ VisualPropertyMenuItem nilIcon ! !

!Magnitude methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:22:14'!
icon

	^ VisualPropertyMenuItem integerIcon ! !

!Float methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:22:27'!
icon

	^ VisualPropertyMenuItem floatIcon ! !

!Fraction methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:22:18'!
icon

	^ VisualPropertyMenuItem fractionIcon ! !

!Integer methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:22:22'!
icon

	^ VisualPropertyMenuItem integerIcon ! !

!Time methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:22:31'!
icon

	^ VisualPropertyMenuItem chronIcon ! !

!Complex methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:23:06'!
icon

	^ VisualPropertyMenuItem complexIcon ! !

!Character methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:23:19'!
icon

	^ VisualPropertyMenuItem charIcon ! !

!Timespan methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:23:22'!
icon

	^ VisualPropertyMenuItem chronIcon ! !

!BlockClosure methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:22:59'!
icon

	^ VisualPropertyMenuItem closureIcon ! !

!Collection methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:22:34'!
icon

	^ VisualPropertyMenuItem collectionIcon ! !

!String methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:22:37'!
icon

	^ VisualPropertyMenuItem stringIcon ! !

!Symbol methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:22:44'!
icon

	^ VisualPropertyMenuItem symbolIcon ! !

!Stream methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:22:49'!
icon

	^ VisualPropertyMenuItem streamIcon ! !

!FileIOAccessor methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:23:26'!
icon

	^ VisualPropertyMenuItem fileIcon ! !

!FileSystemEntry methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:23:32'!
icon

	^ VisualPropertyMenuItem fileIcon ! !

!DirectoryEntry methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:23:37'!
icon

	^ VisualPropertyMenuItem folderIcon ! !

!FileEntry methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:23:40'!
icon

	^ VisualPropertyMenuItem fileIcon ! !

!Form methodsFor: '*morph-metaproperties' stamp: 'KenD 12/6/2016 19:39:56'!
morphForDrag
	"Answer a morph suitable for DragNDrop"
	
	^ ImageMorph new image: self
! !

!Color methodsFor: '*morph-metaproperties' stamp: 'KenD 12/6/2016 18:46:47'!
morphForDrag
	"Answer a morph suitable for DragNDrop"
	
	^ DropColorMorph fromColor: self
! !

!Point methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:22:56'!
icon

	^ VisualPropertyMenuItem pointIcon ! !

!AbstractFont methodsFor: '*morph-metaproperties' stamp: 'KenD 12/5/2016 15:35:29'!
availableFonts

	^ AvailableFonts ! !

!AbstractFont methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:23:02'!
icon

	^ VisualPropertyMenuItem fontIcon ! !

!AbstractFont methodsFor: '*morph-metaproperties' stamp: 'KenD 12/6/2016 18:48:32'!
morphForDrag
	"Answer a morph suitable for DragNDrop"
	
	^ FontMorph font: self
! !

!Morph methodsFor: '*morph-metaproperties' stamp: 'KenD 12/6/2016 18:45:31'!
morphForDrag
	"Answer a morph suitable for DragNDrop"
	
	^ self
! !

!Morph methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:41:29'!
propertiesDict
	"Private - could export a #propertiesDo: method"

	^ properties ! !

!Morph methodsFor: '*morph-metaproperties' stamp: 'KenD 12/6/2016 18:57:46'!
valueWhenDropped
	"Subclasses which wrap values should override (e.g. SignMorph, DropColorMorph)"
	
	^ self! !

!ImagePallet methodsFor: '*morph-metaproperties' stamp: 'KenD 12/2/2016 14:23:09'!
icon

	^ VisualPropertyMenuItem windowIcon ! !

!ImageMorph methodsFor: '*morph-metaproperties' stamp: 'KenD 12/5/2016 14:35:01'!
image

	^ self form! !

!ImageMorph methodsFor: '*morph-metaproperties' stamp: 'KenD 12/6/2016 19:33:29'!
valueWhenDropped
	"Answer my form (image)"
	
	^ self form! !

!StringMorph methodsFor: '*morph-metaproperties' stamp: 'KenD 12/5/2016 15:16:32'!
emphasis

	^ emphasis! !

!StringMorph methodsFor: '*morph-metaproperties' stamp: 'KenD 12/5/2016 15:15:33'!
emphasis: emphasisCode

	self font: font emphasis: emphasisCode! !

!StringMorph methodsFor: '*morph-metaproperties' stamp: 'KenD 12/5/2016 15:14:22'!
font: aFont

	emphasis ifNil: [ emphasis := 0 ].
	self font: aFont emphasis: emphasis! !

!MinimalStringMorph methodsFor: '*morph-metaproperties' stamp: 'KenD 12/5/2016 14:56:55'!
contents

	^ contents ! !

!MinimalStringMorph methodsFor: '*morph-metaproperties' stamp: 'KenD 12/5/2016 15:05:14'!
emphasis

	^ emphasis! !

!MinimalStringMorph methodsFor: '*morph-metaproperties' stamp: 'KenD 12/5/2016 14:59:08'!
emphasis: emphasisCode

	emphasis := emphasisCode.
	self fitContents.
	self redrawNeeded ! !

!MinimalStringMorph methodsFor: '*morph-metaproperties' stamp: 'KenD 12/5/2016 15:05:49'!
front

	^ self fontToUse! !

!MinimalStringMorph methodsFor: '*morph-metaproperties' stamp: 'KenD 12/5/2016 15:07:11'!
front: fontToUse

	font :=
		(emphasis isNil or: [emphasis = 0]) 
			ifTrue: [fontToUse]
			ifFalse: [fontToUse emphasized: emphasis].
	self fitContents.
	self redrawNeeded ! !

!OneLineEditorMorph methodsFor: '*morph-metaproperties' stamp: 'KenD 12/5/2016 15:01:56'!
emphasis

	^ emphasis ! !

!OneLineEditorMorph methodsFor: '*morph-metaproperties' stamp: 'KenD 12/5/2016 15:09:45'!
emphasis: emphasisCode

	emphasis := emphasisCode.
	self font: self font  "resets old font emphasis and redraws" ! !

!OneLineEditorMorph methodsFor: '*morph-metaproperties' stamp: 'KenD 12/5/2016 15:01:15'!
font

	^ self baseFont! !

!OneLineEditorMorph methodsFor: '*morph-metaproperties' stamp: 'KenD 12/5/2016 15:07:26'!
front: fontToUse

	font :=
		(emphasis isNil or: [emphasis = 0]) 
			ifTrue: [fontToUse]
			ifFalse: [fontToUse emphasized: emphasis].
	self fitContents.
	self redrawNeeded ! !

!VisualPropertyEditor methodsFor: 'dropping/grabbing' stamp: 'KenD 12/6/2016 18:49:33'!
aboutToGrab: aMorph
	"submorph is being grabbed by a hand.
	Perform necessary adjustments (if any) and return the actual morph
	that should be added to the hand.
	Answer nil to reject the drag."
"
	Transcript show: 'PropertyEditor aboutToGrab: ', aMorph printString ; newLine.
"
	| valueToDrag |
	(aMorph isKindOf: VisualPropertyMenuItem)
		ifTrue: [ valueToDrag := aMorph propertyValue ].
	(aMorph isKindOf: OrdinaryPropertyMenuItem)
		ifTrue: [ valueToDrag := aMorph value ].
	
	valueToDrag isNil
	ifTrue:  [^ self ] "Title selected. User wants to move me. Pick me up"
	ifFalse: [ ^ valueToDrag morphForDrag ]
! !

!VisualPropertyEditor methodsFor: 'construction' stamp: 'KenD 12/2/2016 19:23:37'!
addIVarsDisplay
	" Add display of IVars to self"
	
	self addLine.
	
	self ivarNames do: [ :ivarName | | iVal displayString propMorph |
		iVal := self targetMorph instVarNamed: ivarName.
		displayString := (ivarName, ': ', iVal printString)
							truncateWithElipsisTo: 40.
		propMorph := 
			OrdinaryPropertyMenuItem 
				itemForIVar: ivarName 
				targetMorph: self targetMorph.
		propMorph contents: displayString.
		propMorph icon:iVal icon.
		self addMorphBack: propMorph
	].

! !

!VisualPropertyEditor methodsFor: 'construction' stamp: 'KenD 12/5/2016 07:30:43'!
addMetaPropsDisplay
	" Add display of MetaProperty selections to self"

	| ivarNames |
	ivarNames := self targetMorph class allInstVarNames.
	
	self addLine.
	
	self metaPropNames do: [ :name | | propMorph |
		propMorph := 
		((ivarNames includes: name)
			ifTrue: [
				VisualIVarMenuItem 
						propName: name 
						morph: self targetMorph 
						propMeta: (self metaProps at: name)
			]
			ifFalse: [
				VisualPropertyMenuItem 
						propName: name 
						morph: self targetMorph 
						propMeta: (self metaProps at: name)
			]
		).
		propMorph  target: self;
					selector: #edit: ;
					arguments: { name. }.
		self addMorphBack: propMorph
	].! !

!VisualPropertyEditor methodsFor: 'construction' stamp: 'KenD 12/2/2016 16:39:42'!
addOperationsDisplay
	"This is a separate method so subclasses can override"

	self add: 'Refresh Me'             target: self selector: #refreshView;
		 add: 'Add Visual Property' target: self selector: #addVisualProperty;
		 add: 'Toggle IVar Display' target: self selector: #toggleIVarView;
		 add: 'Toggle nonVisual Props Display' target: self selector: #toggleOrdinaryPropsView;
		 add: 'Show drop target for Morph'      target: self targetMorph selector: #showDropTarget;
		 add: 'Edit Morph''s layoutSpec'           target: self targetMorph selector: #editMyLayoutSpec;
		 add: 'Open a message window for Morph' target: self targetMorph selector: #messageWindow.! !

!VisualPropertyEditor methodsFor: 'construction' stamp: 'KenD 12/2/2016 19:13:17'!
addOrdinaryPropertiesDisplay
	" Add display of ordinary properties to self"
	
	self addLine.
	
	self propertyNames do: [ :propName | | propValue displayString propMorph |
		propValue := self targetMorph valueOfProperty: propName.
		displayString :=  (propName, ': ', (propValue printString))
							truncateWithElipsisTo: 40.
		propMorph := 
			OrdinaryPropertyMenuItem 
				itemForProperty: propName 
				targetMorph: self targetMorph.
		propMorph contents: displayString.
		propMorph icon: propValue icon.
		self addMorphBack: propMorph
	].
! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/30/2016 16:39:01'!
addOrdinaryProperty

	self notYetImplemented ! !

!VisualPropertyEditor methodsFor: 'construction' stamp: 'KenD 11/30/2016 14:31:43'!
addPropertiesDisplay

	self notYetImplemented ! !

!VisualPropertyEditor methodsFor: 'initialization' stamp: 'KenD 11/28/2016 18:27:45'!
addTitle: aString

	titleMorph := WindowTitleMorph title: aString  buttonsNamed: #( close collapse showHalo ).
	titleMorph color: Theme current menuTitleBar.
	self addMorphFront: titleMorph.! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/30/2016 16:38:53'!
addVisualProperty

	self notYetImplemented ! !

!VisualPropertyEditor methodsFor: 'construction' stamp: 'KenD 12/3/2016 09:51:35'!
adjustSubmorphsLayout

	| calculatedExtent |
	super adjustSubmorphsLayout.
	calculatedExtent := self morphExtent.
	self morphExtent: (calculatedExtent x max: self minItemWidth) @ calculatedExtent y.
	self titleMorph morphExtent: (calculatedExtent x max: self minItemWidth) @ self titleMorph morphHeight.
	self titleMorph reset.  "Needed after adjustSubmorphsLayout"
! !

!VisualPropertyEditor methodsFor: 'dropping/grabbing' stamp: 'KenD 11/28/2016 18:29:13'!
allowsSubmorphDrag
	"Answer whether our morphs can just be grabbed with the hand, instead of requiring the use of the halo. Redefined to answer true."

	^ true! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 19:04:06'!
alwaysHiddenIVars
	"Answer a collection of names of ivars never to be shown"

	^ #(properties)! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 19:04:33'!
alwaysHiddenProperties
	"Answer a collection of names of properties never to be shown"

	^ #(morphModifiers)! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:15:22'!
changed: myMorph

	"@@@FIXME: my target morph has changed; need to update display@@@"
	PopUpMenu inform: self printString , ' target changed'! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:15:45'!
closeButtonClicked
	"The user clicked on the close-box control in the window title.  For Mac users only, the Mac convention of option-click-on-close-box is obeyed if the mac option key is down."

	Preferences dismissAllOnOptionClose ifTrue:
		[Sensor rawMacOptionKeyPressed ifTrue:
			[^ self world closeUnchangedWindows]].
	self targetMorph removeActionsForEvent: #propertyChanged.
	self delete  "closeBox overrides stayUp"! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:15:54'!
collapseButtonClicked
	
	self collapse
! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:16:16'!
edit: propName
"
	Remove
	Rename
	Edit Value
	Reset  to old Value
	Cancel
"
	"@@@FIXME: NYI @@@"
	(HoverHelpMorph contents: 'Need editor for ' , propName asString)
		popUpForHand: self targetMorph world activeHand! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:16:39'!
fontPreferenceChanged

	super fontPreferenceChanged.
	self refreshView.! !

!VisualPropertyEditor methodsFor: 'initialization' stamp: 'KenD 11/28/2016 18:33:34'!
forMorph: aMorph
	"Initialize, but do NOT open this instance"

	targetMorph := aMorph.  "NB: immutable"
	showAllIvars  := false.
	showAllProps := false.
	metaProps := MetaProperty metaPropsForMorph: aMorph.
	targetMorph when: #propertyChanged send: #refreshView to: self.
	self defaultTarget: self;
		 stayUp: true;
		 refreshView;
	 	 yourself! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/30/2016 15:49:25'!
ivarNames
	"Answer an alpha-sorted collection of Instance variable names less MetaProperties"

	| ivarNames neverShown metaPropsDict |
	ivarNames := SortedCollection sortBlock: [ :sym1 :sym2 | sym1 < sym2 ].
	metaPropsDict := self metaProps.
	neverShown     := self alwaysHiddenIVars.
	
	self targetMorph class allInstVarNames do: [ :ivarName | 
		(neverShown includes: ivarName)
			ifFalse: [ 
				(metaPropsDict includesKey: ivarName)
					ifFalse:  [ ivarNames add: ivarName ]
			] 
	].

	^ ivarNames ! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/30/2016 15:04:49'!
metaPropNames
	"Answer an alpha-sorted collection of MetaProperty names"

	| metaPropNames |
	metaPropNames := SortedCollection sortBlock: [ :sym1 :sym2 | sym1 < sym2 ].
	self metaProps keysDo: [ :mpName |  metaPropNames add: mpName ].

	^ metaPropNames ! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:34:24'!
metaProps

	^ metaProps! !

!VisualPropertyEditor methodsFor: 'geometry' stamp: 'KenD 12/3/2016 12:32:04'!
minItemWidth
	"Answer enough space to contain generous title"

	^ Preferences windowTitleFont widthOfString: '0123456789112345678921234567893'
! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/30/2016 16:30:33'!
propertyNames
	"Answer an alpha-sorted collection of property names less MetaProperties"

	| propNames neverShown metaPropsDict |
	propNames := SortedCollection sortBlock: [ :sym1 :sym2 | sym1 < sym2 ].
	metaPropsDict := self metaProps.
	neverShown     := self alwaysHiddenProperties.
	
	(self targetMorph propertiesDict)
	ifNotNil: [ :dict |
		dict keysDo: [ :propName | 
		(neverShown includes: propName)
			ifFalse: [ 
				(metaPropsDict includesKey: propName)
					ifFalse:  [ propNames add: propName ]
			] 
		]
	].

	^ propNames ! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/30/2016 16:08:09'!
refreshView

	"Something may have changed.."
	| aMorph |
	aMorph := self targetMorph.
	self removeAllMorphs.
	
	self addTitle: (aMorph printStringLimitedTo: 60).

	self addOperationsDisplay.
	self addMetaPropsDisplay.
	self showAllIvars  ifTrue: [ self addIVarsDisplay ].
	self showAllProps ifTrue: [ self addOrdinaryPropertiesDisplay ].
	
	self titleMorph morphExtent: (self titleMorph morphExtent x) @ (Preferences windowTitleFont height).
	self adjustSubmorphsLayout;
		yourself! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:34:39'!
showAllIvars

	^ showAllIvars! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:35:24'!
showAllIvars: aBool

	showAllIvars := aBool! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:34:53'!
showAllProps

	^ showAllProps! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:35:08'!
showAllProps: aBool

	showAllProps := aBool! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:18:46'!
showHaloButtonClicked
	"Show my targetMorph's halo"
	| aMorph |
	aMorph := self targetMorph.
	aMorph isInWorld 
		ifTrue: [ aMorph show; addHalo ]
		ifFalse: [
"			(HoverHelpMorph 
			contents: aMorph printString , ' not shown in world')
				popUpForHand: self  world activeHand
"			aMorph openInWorld; 
				show;
				morphPosition: 200@100;
				addHalo   
		]! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:34:01'!
targetMorph

	^ targetMorph ! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/30/2016 15:44:19'!
titleMorph

	^ titleMorph! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/30/2016 15:33:47'!
toggleIVarView

	self toggleShowIVars; refreshView! !

!VisualPropertyEditor methodsFor: 'events' stamp: 'KenD 11/30/2016 15:34:18'!
toggleOrdinaryPropsView

	self toggleShowProps; refreshView! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/30/2016 15:33:30'!
toggleShowIVars

	self showAllIvars: (self showAllIvars not)! !

!VisualPropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/30/2016 15:33:20'!
toggleShowProps

	self showAllProps: (self showAllProps not)! !

!VisualPropertyEditor class methodsFor: 'instance creation' stamp: 'KenD 11/28/2016 08:19:15'!
forMorph: aMorph

	^ self new forMorph: aMorph! !

!VisualPropertyEditor class methodsFor: 'class initialization' stamp: 'KenD 12/5/2016 15:32:56'!
initialize
"
	VisualPropertyEditor initialize.
"
	"Add typical Morph visual properties to MetaProperty's MetaPropDict"
	
	| classDict propsDict |
	"Ensure named MetaProperties exist"
	MetaProperty initialize.
	MetaProperty allSubclassesDo: [ :sc | sc initialize ].
	
	"Seed MetaProperties for known Morphs"
	propsDict := MetaProperty preDefinedPropsDict.

	classDict := MetaProperty metaPropsDictForClass: RectangleLikeMorph.
	classDict at: #extent put: (propsDict at: #acceptsPositivePoint). 
	classDict at: #color put: (propsDict at: #acceptsColor). 

	classDict := MetaProperty metaPropsDictForClass: BorderedRectMorph.
	classDict at: #borderColor put: (propsDict at: #acceptsColor). 
	classDict at: #borderWidth put: (propsDict at: #acceptsInteger).
	
	classDict := MetaProperty metaPropsDictForClass: LineMorph.
	classDict at: #startPoint put: (propsDict at: #acceptsPoint). 
	classDict at: #endPoint put: (propsDict at: #acceptsPoint). 
	classDict at: #color put: (propsDict at: #acceptsColor). 
	classDict at: #lineWidth put: (propsDict at: #acceptsInteger). 

	classDict := MetaProperty metaPropsDictForClass: PointerLineMorph.
	classDict at: #endPointMorph put: (propsDict at: #acceptsMorph). 

	classDict := MetaProperty metaPropsDictForClass: Panel.
	classDict at: #widgetsColor put: (propsDict at: #acceptsColor). 
	classDict at: #stayUp put: (propsDict at: #acceptsBoolean). 

	classDict := MetaProperty metaPropsDictForClass: PluggableButtonMorph.
	classDict at: #label put: (propsDict at: #acceptsString).
	classDict at: #font put: (propsDict at: #acceptsFont).
	classDict at: #icon put: (propsDict at: #acceptsForm).
	classDict at: #iconName put: (propsDict at: #acceptsSymbol).

	classDict := MetaProperty metaPropsDictForClass: ImageMorph.
	classDict at: #image put: (propsDict at: #acceptsForm).

	classDict := MetaProperty metaPropsDictForClass: BorderedImageMorph.
	classDict at: #borderColor put: (propsDict at: #acceptsColor).
	classDict at: #borderWidth put: (propsDict at: #acceptsPositiveInteger).
	classDict at: #borderStyle put: (propsDict at: #acceptsBorderStyle).

	classDict := MetaProperty metaPropsDictForClass: FramedLayoutMorph.
	classDict at: #borderColor put: (propsDict at: #acceptsColor).
	classDict at: #borderWidth put: (propsDict at: #acceptsPositiveInteger).
	classDict at: #frameSelector put: (propsDict at: #acceptsBorderStyle).

	classDict := MetaProperty metaPropsDictForClass: WindowTitleMorph.
	classDict at: #titleString put: (propsDict at: #acceptsString).
	
	classDict := MetaProperty metaPropsDictForClass: StringMorph.
	classDict at: #contents put: (propsDict at: #acceptsString).
	classDict at: #font put: (propsDict at: #acceptsFont).
	classDict at: #emphasis put: (propsDict at: #acceptsPositiveInteger). "@@FIXME@@"	
	
	classDict := MetaProperty metaPropsDictForClass: MinimalStringMorph.
	classDict at: #contents put: (propsDict at: #acceptsString).
	classDict at: #font put: (propsDict at: #acceptsFont).
	classDict at: #emphasis put: (propsDict at: #acceptsPositiveInteger). "@@FIXME@@"
		classDict := MetaProperty metaPropsDictForClass: OneLineEditorMorph.
	classDict at: #contents put: (propsDict at: #acceptsString).
	classDict at: #font put: (propsDict at: #acceptsFont).
	classDict at: #emphasis put: (propsDict at: #acceptsPositiveInteger). "@@FIXME@@"



! !

!OrdinaryPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 12/2/2016 16:05:43'!
allowsMorphDrop
	"Answer whether we accept dropping morphs.  We don't"

	^ false! !

!OrdinaryPropertyMenuItem methodsFor: 'initialization' stamp: 'KenD 12/2/2016 16:03:28'!
itemForIVar: aName targetMorph: aMorph

	accessKind := #instanceVariable.
	targetMorph := aMorph.
	name := aName.! !

!OrdinaryPropertyMenuItem methodsFor: 'initialization' stamp: 'KenD 12/2/2016 16:02:32'!
itemForProperty: aName targetMorph: aMorph

	accessKind := #property.
	targetMorph := aMorph.
	name := aName.! !

!OrdinaryPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 12/2/2016 16:07:12'!
name

	^ name! !

!OrdinaryPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 12/2/2016 16:05:05'!
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

!OrdinaryPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 12/2/2016 16:15:02'!
targetMorph

	^ targetMorph! !

!OrdinaryPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 12/2/2016 16:22:54'!
value
	"Answer value of my targetMorph's property or instance variable"

	^ (accessKind = #property)
		ifTrue:  [ targetMorph valueOfProperty: name ]
		ifFalse: [ targetMorph instVarNamed:     name ]! !

!OrdinaryPropertyMenuItem class methodsFor: 'instance creation' stamp: 'KenD 12/2/2016 16:00:46'!
itemForIVar: aName targetMorph: aMorph

	^self new itemForIVar: aName targetMorph: aMorph! !

!OrdinaryPropertyMenuItem class methodsFor: 'instance creation' stamp: 'KenD 12/2/2016 16:01:01'!
itemForProperty: aName targetMorph: aMorph

	^self new itemForProperty: aName targetMorph: aMorph! !

!VisualPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 11/28/2016 16:38:00'!
allowsMorphDrop
	"Answer whether we accept dropping morphs. Redefined to answer true."

	^ true! !

!VisualPropertyMenuItem methodsFor: 'testing' stamp: 'KenD 11/28/2016 16:37:33'!
allowsValue: aValue

	^ self metaProperty accepts: aValue! !

!VisualPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 12/6/2016 14:08:52'!
cleanUpForMorph: aMorph.

	aMorph delete! !

!VisualPropertyMenuItem methodsFor: 'editing' stamp: 'KenD 11/28/2016 16:37:00'!
edit

	self metaProperty edit: self targetMorph ! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:29:30'!
metaProperty

	^ metaProperty! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:29:37'!
name

	^ name! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:29:58'!
prevValue

	^ prevValue! !

!VisualPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 11/28/2016 16:38:18'!
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

!VisualPropertyMenuItem methodsFor: 'initialization' stamp: 'KenD 11/28/2016 16:32:10'!
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

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:30:25'!
propertyDescriptor

	^ self metaProperty! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:30:35'!
propertyName

	^ self name ! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:31:08'!
propertyValue

	^ self targetMorph valueOfProperty: self name! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 12/5/2016 07:43:17'!
propertyValue: newValue
	"Assumed checking already done.  Does NOT change cashed value"

	self targetMorph setProperty: self name toValue: newValue.
	self update.
! !

!VisualPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 11/28/2016 16:41:45'!
schedulePostRemovalOf: aMorph
	"See comment in VisualPropertyMorph>>wantsDroppedMorph:event:"

	self addAlarm: #cleanUpForMorph: with: aMorph after: 0.1
! !

!VisualPropertyMenuItem methodsFor: 'private' stamp: 'KenD 12/6/2016 14:25:15'!
setContents
	"(re)set my content string and icon"

	self contents: ( (name asString , ':  ', (self propertyValue printString))
						truncateWithElipsisTo: 40 ).
	self icon: (self propertyValue icon)! !

!VisualPropertyMenuItem methodsFor: 'events' stamp: 'KenD 12/6/2016 14:22:30'!
showAccept: aMorph

	| hilightMorph mPos mExtent |
	mPos := aMorph morphPositionInWorld.
	mExtent := aMorph morphExtent.
	hilightMorph := FrameMorph new.
	hilightMorph borderWidth: 6;
					borderColor: Color green;
					morphExtent: mExtent + 6;
					openInWorld;
					morphPosition: mPos - (6@6).

	self addAlarm: #cleanUpForMorph: with: aMorph        after: 200.
	self addAlarm: #cleanUpForMorph: with: hilightMorph after: 400.! !

!VisualPropertyMenuItem methodsFor: 'events' stamp: 'KenD 12/6/2016 14:20:39'!
showReject: aMorph

	| leftStroke rightStroke mPos mExtent |
	mPos := aMorph morphPositionInWorld.
	mExtent := aMorph morphExtent.
	leftStroke   := LineMorph 
						startPoint: mPos - (10@10) 
						endPoint: (mPos + mExtent + (10@10)) 
						width: 6
						color: Color red.
	rightStroke := LineMorph 
						startPoint: mPos + (-10 @ (mExtent y + 10))
						endPoint: (mPos + ((10 + mExtent x) @ -10)) 
						width: 6
						color: Color red.
	leftStroke   openInWorld.
	rightStroke openInWorld.
	self addAlarm: #cleanUpForMorph: with: aMorph after: 0.2.
	self addAlarm: #cleanUpForMorph: with: leftStroke after: 400.	
	self addAlarm: #cleanUpForMorph: with: rightStroke after: 400.! !

!VisualPropertyMenuItem methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:35:46'!
targetMorph

	^ targetMorph ! !

!VisualPropertyMenuItem methodsFor: 'editing' stamp: 'KenD 11/28/2016 16:35:20'!
undo
	"Reset value from remembered value"

	self targetMorph setProperty: self name  toValue: self prevValue! !

!VisualPropertyMenuItem methodsFor: 'events' stamp: 'KenD 12/4/2016 20:36:52'!
update

	self setContents.
	self owner ifNotNil: [ self owner adjustSubmorphsLayout ].
	self targetMorph redrawNeeded.! !

!VisualPropertyMenuItem methodsFor: 'private' stamp: 'KenD 11/28/2016 16:34:02'!
valueMorph

	^ SignMorph forObject: self propertyValue! !

!VisualPropertyMenuItem methodsFor: 'dropping/grabbing' stamp: 'KenD 12/6/2016 19:02:11'!
wantsDroppedMorph: aMorph event: evt
	"Return true if the receiver wishes to accept the given morph, which is being dropped by a hand in response to the given event. Note that for a successful drop operation both parties need to agree. The symmetric check is done automatically via aMorph wantsToBeDroppedInto: self."

	(self allowsValue: aMorph valueWhenDropped)
		ifTrue: [ 
			self propertyValue: aMorph valueWhenDropped.
			self showAccept: aMorph. 
	 	]
		ifFalse: [
			self showReject: aMorph.
		].
	
	"Rejecting the drop adds aMorph to its old owner at 0@0.
	 So we accept the drop, but then delete aMorph.  
	This is done in #showAccept and #showReject."

	^ true  "Always accept drop"! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:21:29'!
blankIcon

	^BlankIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:21:35'!
booleanIcon

	^BoolIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:21:41'!
charIcon

	^CharIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:21:49'!
chronIcon

	^ChronIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:21:55'!
classIcon

	^ClassIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:01'!
closureIcon

	^ClosureIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:09'!
collectionIcon

	^CollectIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:15'!
complexIcon

	^CpxIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:22'!
falseIcon

	^FalseIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:28'!
fileIcon

	^FileIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:36'!
floatIcon

	^FloatIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:41'!
folderIcon

	^FolderIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:46'!
fontIcon

	^FontIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:50'!
fractionIcon

	^FracIcon! !

!VisualPropertyMenuItem class methodsFor: 'class initialization' stamp: 'KenD 11/28/2016 16:18:45'!
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

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:22:56'!
integerIcon

	^IntIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:02'!
nilIcon

	^NilIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:06'!
objectIcon

	^ObjIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:12'!
oneOfIcon

	^OneOfIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:17'!
pointIcon

	^PtIcon! !

!VisualPropertyMenuItem class methodsFor: 'instance creation' stamp: 'KenD 11/28/2016 16:17:41'!
propName: aSymbol morph: aMorph

	^ self propName: aSymbol morph: aMorph propMeta: MetaProperty default
! !

!VisualPropertyMenuItem class methodsFor: 'instance creation' stamp: 'KenD 11/28/2016 16:17:54'!
propName: aSymbol morph: aMorph propMeta: aPropertyDescriptor

	^self new propName: aSymbol morph: aMorph propMeta: aPropertyDescriptor
! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:26'!
rangeIcon

	^RngIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:31'!
streamIcon

	^StreamIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:37'!
stringIcon

	^StrIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:43'!
symbolIcon

	^SymIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:49'!
trueIcon

	^TrueIcon! !

!VisualPropertyMenuItem class methodsFor: 'accessing' stamp: 'KenD 11/28/2016 16:23:54'!
windowIcon

	^WindowIcon! !

!VisualIVarMenuItem methodsFor: 'initialization' stamp: 'KenD 12/4/2016 20:18:25'!
propName: aSymbol morph: aMorph propMeta: aPropertyDescriptor

	super initialize.
	name := aSymbol.
	targetMorph := aMorph.
	metaProperty := aPropertyDescriptor.
	prevValue := aMorph instVarNamed: aSymbol.	
	self setContents;
		 target: self;
		 icon: prevValue icon; 
		 selector: #edit! !

!VisualIVarMenuItem methodsFor: 'initialization' stamp: 'KenD 12/4/2016 20:19:09'!
propertyValue

	^ self targetMorph instVarNamed: self name! !

!VisualIVarMenuItem methodsFor: 'initialization' stamp: 'KenD 12/4/2016 20:37:04'!
propertyValue: newValue
	"Assume access check already made"

	self targetMorph instVarNamed: self name put: newValue.
	self update.! !

!MetaPropertyTests methodsFor: 'testing' stamp: 'KenD 12/5/2016 14:19:19'!
testAccepts

	self assert: ((MetaProperty kind: String) accepts: 'aString').
	self deny: ((MetaProperty kind: String) accepts: 2@3).
	self assert: ((MetaProperty kind: String) accepts: #symbol).

	"OneOf choice"
	self assert: ((MetaPropertyOneOf kind: Symbol choices: #(fee fie fo fum)) accepts: #fie).
	self deny: ((MetaPropertyOneOf kind: Symbol choices: #(fee fie fo fum)) accepts: #bogus).
	self deny: ((MetaPropertyOneOf kind: Symbol choices: #(fee fie fo fum)) accepts: 4@5).
	self deny: ((MetaPropertyOneOf kind: Boolean choices: #(true false)) accepts: nil).
	self assert: ((MetaPropertyOneOf kind: Boolean choices: #(true false)) accepts: true).
	self assert: ((MetaPropertyOneOf kind: Boolean choices: #(true false)) accepts: false).
	self deny: ((MetaPropertyOneOf kind: Boolean choices: #(true false)) accepts: #bogus).

	"Number Range"
	self assert: ((MetaPropertyRange kind: Number minValue: 1 maxValue: 3) accepts: 1.2).
	self deny: ((MetaPropertyRange kind: Number minValue: 1 maxValue: 3) accepts: 0.7).
	self deny: ((MetaPropertyRange kind: Number minValue: 1 maxValue: 3) accepts: 7).
	self deny: ((MetaPropertyRange kind: Number minValue: 1 maxValue: 3) accepts: 4).
	self deny: ((MetaPropertyRange kind: Number minValue: 1 maxValue: 3) accepts: 2@3).
	self deny: ((MetaPropertyRange kind: Number minValue: 1 maxValue: 3) accepts: #bogus).
		
	"Point Range"
	self assert: ((MetaPropertyRange kind: Point minValue: (0@0) maxValue: (4@4)) accepts: 1@4).
	self assert: ((MetaPropertyRange kind: Point minValue: (0@0) maxValue: (4@4)) accepts: 4@3).
	self deny: ((MetaPropertyRange kind: Point minValue: (0@0) maxValue: (4@4)) accepts: 1@5).
	self deny: ((MetaPropertyRange kind: Point minValue: (0@0) maxValue: (4@4)) accepts: 5@1).
	self deny: ((MetaPropertyRange kind: Point minValue: (0@0) maxValue: (4@4)) accepts: -1@1).
	self assert: ((MetaPropertyRange kind: Point minValue: (0@0) maxValue: (4@4)) accepts: 0.3@1).


	"Positive Point"
	self assert: ((MetaPropertyFrom kind: Point minValue: 0@0) accepts: 23@47).
	self deny: ((MetaPropertyFrom kind: Point minValue: 0@0) accepts: -23@47).
	self deny: ((MetaPropertyFrom kind: Point minValue: 0@0) accepts: -23@-47).
	self deny: ((MetaPropertyFrom kind: Point minValue: 0@0) accepts: 1@-1).

	"Pattern Match"
	self assert: ((MetaPropertyViaTest kind: String test: [ :s | '*baz*' match: s ]) accepts: 'mombazzi').
	self deny: ((MetaPropertyViaTest kind: String test: [ :s | '*baz*' match: s ]) accepts: 'bamboozle').
	self deny: ((MetaPropertyViaTest kind: String test: [ :s | '*baz*' match: s ]) accepts: 43).
! !

!MetaPropertyTests methodsFor: 'testing' stamp: 'KenD 12/5/2016 13:55:45'!
testCreationGuards

	"Kind must be a Class"
	self should: [ MetaProperty kind: 37 ] raise: Error.
	self should: [ MetaProperty kind: Color blue ] raise: Error.
	
	"Values must be of right kind"
	self should: [ MetaPropertyFrom kind: Point minValue: Color red ] raise: Error.
	self should: [ MetaPropertyFrom kind: Number minValue: 3@4 ] raise: Error.
	self should: [ MetaPropertyOneOf kind: Number choices: #(fee fie fo fum) ] raise: Error.
	self should: [ MetaPropertyOneOf kind: Number choices: Color green ] raise: Error.
	self should: [ MetaPropertyRange kind: Number minValue: 1@2 maxValue: 3 ] raise: Error.
	self should: [ MetaPropertyRange kind: Number minValue: 1 maxValue: 2@3 ] raise: Error.
	self should: [ MetaPropertyViaTest kind: Number test: Color white ] raise: Error.
	self should: [ MetaPropertyViaTest kind: Number test: [ :a :b | a + b ] ] raise: Error.
	self should: [ MetaPropertyViaTest kind: 34 test: [ :a :b | a + b ] ] raise: Error.! !

!MetaPropertyTests methodsFor: 'testing' stamp: 'KenD 12/5/2016 13:22:28'!
testPredefinedMProps

	self assert: ((MetaProperty metaPropNamed: #acceptsString) accepts: 'aString').
	self assert: ((MetaProperty metaPropNamed: #acceptsColor) accepts: Color blue).
	self assert: ((MetaProperty metaPropNamed: #acceptsPositivePoint) accepts: 2@3).
	self assert: ((MetaProperty metaPropNamed: #acceptsPositiveNumber) accepts: 0.1).
	
	self deny: ((MetaProperty metaPropNamed: #acceptsPositivePoint) accepts: -2@3).
	self deny: ((MetaProperty metaPropNamed: #acceptsPositiveNumber) accepts: -1).! !

!MetaProperty methodsFor: 'testing' stamp: 'KenD 12/4/2016 14:21:39'!
accepts: newValue

	^ newValue isKindOf: kind! !

!MetaProperty methodsFor: 'initialization' stamp: 'KenD 12/4/2016 14:20:57'!
initialize

	kind := Object "default"! !

!MetaProperty methodsFor: 'accessing' stamp: 'KenD 12/4/2016 14:33:35'!
kind

	^ kind! !

!MetaProperty methodsFor: 'initialization' stamp: 'KenD 12/4/2016 14:19:45'!
kind: aClass

	(aClass isKindOf: Class)
	ifTrue:  [ kind := aClass ]
	ifFalse: [ self error: 'Expected a class: ', aClass printString ].! !

!MetaProperty class methodsFor: 'class initialization' stamp: 'KenD 12/5/2016 14:29:02'!
initialize
	"Add typical usages to dictionary for sharing."
"
	MetaProperty initialize.
"
	| props |
	props := self preDefinedPropsDict.
	props at: #acceptsString put: (MetaProperty kind: String).
	props at: #acceptsSymbol put: (MetaProperty kind: Symbol).
	props at: #acceptsCharacter put: (MetaProperty kind: Character).
	props at: #acceptsNumber put: (MetaProperty kind: Number).
	props at: #acceptsColor put: (MetaProperty kind: Color).
	props at: #acceptsPoint put: (MetaProperty kind: Point).
	props at: #acceptsRectangle put: (MetaProperty kind: Rectangle).
	props at: #acceptsBoolean put: (MetaProperty kind: Boolean).
	props at: #acceptsMorph put: (MetaProperty kind: Morph).
	props at: #acceptsNil put: (MetaProperty kind: UndefinedObject).
	props at: #acceptsClass put: (MetaProperty kind: Class).
	props at: #acceptsInteger put: (MetaProperty kind: Integer).
	props at: #acceptsFraction put: (MetaProperty kind: Fraction ).
	props at: #acceptsFloat put: (MetaProperty kind: Float).
	props at: #acceptsCollection put: (MetaProperty kind: Collection ).
	props at: #acceptsArray put: (MetaProperty kind: Array ).
	props at: #acceptsDictionary put: (MetaProperty kind: Dictionary).
	props at: #acceptsFileEntry put: (MetaProperty kind: FileEntry ).
	props at: #acceptsText put: (MetaProperty kind: Text).
	props at: #acceptsFont put: (MetaProperty kind: AbstractFont ).
	props at: #acceptsForm put: (MetaProperty kind: Form).
	props at: #acceptsLocation put: (MetaProperty kind: MorphicLocation).

	
	
	! !

!MetaProperty class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 14:24:56'!
kind: aClass

	^ self new kind: aClass! !

!MetaProperty class methodsFor: 'accessing' stamp: 'KenD 12/2/2016 15:37:12'!
metaPropDict
	"Answer a dictionary of Class->Dict(name->metaProp)"

	MetaPropDict ifNil: [ MetaPropDict := Dictionary new ].
	
	^ MetaPropDict! !

!MetaProperty class methodsFor: 'accessing' stamp: 'KenD 12/5/2016 07:39:48'!
metaPropNamed: metaPropName

	^ PreDefinedPropsDict at: metaPropName ifAbsent: [ nil ]
	! !

!MetaProperty class methodsFor: 'accessing' stamp: 'KenD 12/2/2016 15:36:33'!
metaPropsDictForClass: aClass

	| classDict |
	classDict := self metaPropDict.
	classDict at: aClass ifAbsentPut: [ Dictionary new ].
	
	^ classDict at: aClass! !

!MetaProperty class methodsFor: 'accessing' stamp: 'KenD 12/2/2016 15:48:27'!
metaPropsForMorph: aMorph
	"Answer a combined Dictionary of name->metaProp by collecting all inherited MetaProps"
	
	| metaPropDict |
	
	metaPropDict := self metaPropsDictForClass: aMorph class.
	aMorph class allSuperclassesDo: [ :sc | | dict |
		dict := self metaPropsDictForClass: sc.
		"supers w same name are ignored, else added"
		dict keysAndValuesDo: [ :k :v | metaPropDict at: k ifAbsentPut: [ v ] ] 
	].
		
	
	^ metaPropDict! !

!MetaProperty class methodsFor: 'accessing' stamp: 'KenD 12/4/2016 16:37:09'!
preDefinedPropsDict

	PreDefinedPropsDict ifNil: [ PreDefinedPropsDict := Dictionary new ].
	
	^ PreDefinedPropsDict ! !

!MetaProperty class methodsFor: 'documentation' stamp: 'KenD 12/2/2016 15:43:36'!
whyMe

^
'
Some Morph properties support private mechanics, but others should be visually shared and displayed in a PropertyEditor so that users can easily adjust visual properties.

The basic idea here is to allow authors of Morph classes to attach MetaProperties so that a Morph''s visual instance variables and properties show up in a VisualPropertyEditor.  Instance variables and properties are private/hidden by default.

To remove walls, a morph''s public properties (those that have been annotated to show up in a VisualPropertyEditor) can be updated by fill-in or DragNDrop for example from a Color, Font or some other Pallet or selected from a menu select list.

Note that these (public) visual properties may be virtual.  The idea being that changing a property value may store a value into an instance variable, a #property, or invoke a bit of code that does the right thing and maintains some invariant.

MetaProperties are considered immutable and may be shared.  They are associated with Morph classes and are inherited by Morph subclasses.

See the #examples class category.
'! !

!MetaPropertyFrom methodsFor: 'testing' stamp: 'KenD 12/4/2016 14:57:36'!
accepts: newValue

	^ (super accepts: newValue)
		and: [ minValue <= newValue ]! !

!MetaPropertyFrom methodsFor: 'initialization' stamp: 'KenD 12/4/2016 14:58:26'!
kind: aClass minValue: min

	super kind: aClass.
	(min  isKindOf: aClass) ifFalse: [ self error: 'minValue must be aKindOf: ',  aClass printString ].
	minValue := min.! !

!MetaPropertyFrom methodsFor: 'accessing' stamp: 'KenD 12/4/2016 14:56:58'!
minValue

	^ minValue! !

!MetaPropertyFrom class methodsFor: 'class initialization' stamp: 'KenD 12/5/2016 15:23:19'!
initialize
	"Add typical usages to dictionary for sharing."
"
	MetaPropertyFrom initialize.
"
	| props |
	props := self preDefinedPropsDict.
	props at: #acceptsPositivePoint     put: (MetaPropertyFrom kind: Point minValue: 0@0).
	props at: #acceptsPositiveNumber put: (MetaPropertyFrom kind: Number minValue: 0).
	props at: #acceptsPositiveInteger put: (MetaPropertyFrom kind: Integer minValue: 0).! !

!MetaPropertyFrom class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 14:59:16'!
kind: aClass minValue: min

	^ self new kind: aClass minValue: min! !

!MetaPropertyFrom class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 14:59:28'!
minValue: min

	^ self new kind: Object minValue: min! !

!MetaPropertyOneOf methodsFor: 'testing' stamp: 'KenD 12/4/2016 14:29:45'!
accepts: newValue

	^ (super accepts: newValue)
		and: [ choiceCollection includes: newValue ]! !

!MetaPropertyOneOf methodsFor: 'accessing' stamp: 'KenD 12/4/2016 14:34:10'!
choices

	^ choiceCollection! !

!MetaPropertyOneOf methodsFor: 'initialization' stamp: 'KenD 12/5/2016 13:50:52'!
kind: aClass choices: aCollection

	super kind: aClass.
	(aCollection isKindOf: Collection)
		ifFalse: [ self error: 'Expected a collection of value choices: ', aCollection printString ].
	(aCollection allSatisfy: [ :elt | elt isKindOf: aClass])
		ifFalse: [ self error: 'Expected collection elements of kind: ', aClass printString,
					 ' got: ', aCollection printString ].
	
	choiceCollection := aCollection.
! !

!MetaPropertyOneOf class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 14:40:39'!
choices: aCollection

	^ self new kind: Object choices: aCollection! !

!MetaPropertyOneOf class methodsFor: 'class initialization' stamp: 'KenD 12/5/2016 14:43:12'!
initialize
	"Add typical usages to dictionary for sharing."
"
	MetaPropertyOneOf initialize.
"
	| props |
	props := self preDefinedPropsDict.
	props at: #acceptsBoolean put: (MetaPropertyOneOf kind: Boolean choices: #(true false)).
	props at: #acceptsBorderStyle put: (MetaPropertyOneOf kind: Symbol choices: #(inset raised simple)).! !

!MetaPropertyOneOf class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 14:30:57'!
kind: aClass choices: aCollection

	^ self new kind: aClass choices: aCollection! !

!MetaPropertyRange methodsFor: 'testing' stamp: 'KenD 12/4/2016 14:43:49'!
accepts: newValue

	^ (super accepts: newValue)
		and: [ minValue <= newValue ]
			and: [ newValue <= maxValue ]! !

!MetaPropertyRange methodsFor: 'initialization' stamp: 'KenD 12/4/2016 14:45:45'!
kind: aClass minValue: min maxValue: max

	super kind: aClass.
	(min  isKindOf: aClass) ifFalse: [ self error: 'minValue must be aKindOf: ',  aClass printString ].
	(max isKindOf: aClass) ifFalse: [ self error: 'maxValue must be aKindOf: ', aClass printString ].
	minValue := min.
	maxValue := max.! !

!MetaPropertyRange methodsFor: 'accessing' stamp: 'KenD 12/4/2016 14:42:29'!
maxValue

	^ maxValue! !

!MetaPropertyRange methodsFor: 'accessing' stamp: 'KenD 12/4/2016 14:42:19'!
minValue

	^ minValue! !

!MetaPropertyRange class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 14:41:31'!
kind: aClass minValue: min maxValue: max

	^ self new kind: aClass minValue: min maxValue: max! !

!MetaPropertyRange class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 14:41:43'!
minValue: min maxValue: max

	^ self new kind: Object minValue: min maxValue: max! !

!MetaPropertyViaTest methodsFor: 'testing' stamp: 'KenD 12/4/2016 15:19:09'!
accepts: newValue

	^ (super accepts: newValue)
		and: [ testClosure value: newValue ]! !

!MetaPropertyViaTest methodsFor: 'initialization' stamp: 'KenD 12/4/2016 15:18:19'!
kind: aClass test: aClosure

	super kind: aClass.
	(aClosure isKindOf: BlockClosure) 
		ifFalse: [ self error: 'Expected a BlockClosure: ', aClosure printString ].
	(aClosure argumentCount = 1) 
		ifFalse: [ self error: 'Test should take one argument and answer a boolean: ',
					aClosure printString ].
	testClosure := aClosure.! !

!MetaPropertyViaTest methodsFor: 'accessing' stamp: 'KenD 12/4/2016 15:18:32'!
test

	^ testClosure! !

!MetaPropertyViaTest methodsFor: 'accessing' stamp: 'KenD 12/4/2016 15:18:29'!
testClosure

	^ testClosure! !

!MetaPropertyViaTest class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 15:21:17'!
kind: aClass test: aClosure

	^ self new kind: aClass test: aClosure! !

!MetaPropertyViaTest class methodsFor: 'instance creation' stamp: 'KenD 12/4/2016 15:21:10'!
test: aClosure

	^ self new kind: Object test: aClosure! !
VisualPropertyEditor initialize!
VisualPropertyMenuItem initialize!
MetaProperty initialize!
MetaPropertyFrom initialize!
MetaPropertyOneOf initialize!
