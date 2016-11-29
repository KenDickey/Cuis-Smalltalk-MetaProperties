'From Cuis 5.0 of 7 November 2016 [latest update: #2984] on 28 November 2016 at 7:20:12 pm'!
'Description MetaProperties describe and define public visual properties of Morphs.  They are used by a PropertyEditor.'!
!provides: 'Morph-MetaProperties' 1 3!
!requires: 'Graphics-Files-Additional' 1 18 nil!
!requires: 'Morphic-Misc1' 1 86 nil!
!requires: 'Cuis-Base' 50 2984 nil!
!classDefinition: #PropertyEditor category: #'Morph-MetaProperties'!
MenuMorph subclass: #PropertyEditor
	instanceVariableNames: 'targetMorph metaProps showAllIvars showAllProps'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Morph-MetaProperties'!
!classDefinition: 'PropertyEditor class' category: #'Morph-MetaProperties'!
PropertyEditor class
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

!ProtoObject methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 16:50:29'!
icon

	^ VisualPropertyMorph blankIcon! !

!Object methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 16:49:48'!
icon

	^ VisualPropertyMorph objectIcon ! !

!Boolean methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 17:57:21'!
icon

	^ VisualPropertyMorph booleanIcon ! !

!False methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 16:53:15'!
icon

	^ VisualPropertyMorph falseIcon ! !

!True methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 16:51:04'!
icon

	^ VisualPropertyMorph trueIcon ! !

!UndefinedObject methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 16:51:54'!
icon

	^ VisualPropertyMorph nilIcon ! !

!Magnitude methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:01:20'!
icon

	^ VisualPropertyMorph integerIcon ! !

!Float methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:03:25'!
icon

	^ VisualPropertyMorph floatIcon ! !

!Fraction methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:03:53'!
icon

	^ VisualPropertyMorph fractionIcon ! !

!Integer methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:02:04'!
icon

	^ VisualPropertyMorph integerIcon ! !

!Time methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:12:42'!
icon

	^ VisualPropertyMorph chronIcon ! !

!Complex methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:02:50'!
icon

	^ VisualPropertyMorph complexIcon ! !

!Character methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:05:14'!
icon

	^ VisualPropertyMorph charIcon ! !

!Timespan methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:13:23'!
icon

	^ VisualPropertyMorph chronIcon ! !

!BlockClosure methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:07:55'!
icon

	^ VisualPropertyMorph closureIcon ! !

!Collection methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:09:25'!
icon

	^ VisualPropertyMorph collectionIcon ! !

!String methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:05:54'!
icon

	^ VisualPropertyMorph stringIcon ! !

!Symbol methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:06:25'!
icon

	^ VisualPropertyMorph symbolIcon ! !

!Stream methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:10:13'!
icon

	^ VisualPropertyMorph streamIcon ! !

!FileIOAccessor methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:17:39'!
icon

	^ VisualPropertyMorph fileIcon ! !

!FileSystemEntry methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:17:29'!
icon

	^ VisualPropertyMorph fileIcon ! !

!DirectoryEntry methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:15:57'!
icon

	^ VisualPropertyMorph folderIcon ! !

!FileEntry methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:16:36'!
icon

	^ VisualPropertyMorph fileIcon ! !

!Point methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:19:42'!
icon

	^ VisualPropertyMorph pointIcon ! !

!AbstractFont methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:13:57'!
icon

	^ VisualPropertyMorph fontIcon ! !

!Morph methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:41:29'!
propertiesDict
	"Private - could export a #propertiesDo: method"

	^ properties ! !

!ImagePallet methodsFor: '*morph-metaproperties' stamp: 'KenD 11/28/2016 18:18:59'!
icon

	^ VisualPropertyMorph windowIcon ! !

!PropertyEditor methodsFor: 'dropping/grabbing' stamp: 'KenD 11/28/2016 18:28:46'!
aboutToGrab: aMorph
	"submorph is being grabbed by a hand.
	Perform necessary adjustments (if any) and return the actual morph
	that should be added to the hand.
	Answer nil to reject the drag."
"
	Transcript show: 'PropertyEditor aboutToGrab: ', aMorph printString ; newLine.
"
	^ (aMorph isKindOf: VisualPropertyMorph)
		ifTrue: [ 
			(aMorph propertyValue isKindOf: Color)
			ifTrue: [ DropColorMorph fromColor: aMorph propertyValue ]
			ifFalse: [ SignMorph forObject: aMorph propertyValue ]
		] 
		ifFalse: [ self ] "Title selected. User wants to move me. Pick me up"! !

!PropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:19:50'!
addProperty

	self notYetImplemented ! !

!PropertyEditor methodsFor: 'initialization' stamp: 'KenD 11/28/2016 18:27:45'!
addTitle: aString

	titleMorph := WindowTitleMorph title: aString  buttonsNamed: #( close collapse showHalo ).
	titleMorph color: Theme current menuTitleBar.
	self addMorphFront: titleMorph.! !

!PropertyEditor methodsFor: 'construction' stamp: 'KenD 11/28/2016 18:29:38'!
adjustSubmorphsLayout

	super adjustSubmorphsLayout.
	self titleMorph reset.  "Needed after adjustSubmorphsLayout"! !

!PropertyEditor methodsFor: 'dropping/grabbing' stamp: 'KenD 11/28/2016 18:29:13'!
allowsSubmorphDrag
	"Answer whether our morphs can just be grabbed with the hand, instead of requiring the use of the halo. Redefined to answer true."

	^ true! !

!PropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 19:04:06'!
alwaysHiddenIVars
	"Answer a collection of names of ivars never to be shown"

	^ #(properties)! !

!PropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 19:04:33'!
alwaysHiddenProperties
	"Answer a collection of names of properties never to be shown"

	^ #(morphModifiers)! !

!PropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:15:22'!
changed: myMorph

	"@@@FIXME: my target morph has changed; need to update display@@@"
	PopUpMenu inform: self printString , ' target changed'! !

!PropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:15:45'!
closeButtonClicked
	"The user clicked on the close-box control in the window title.  For Mac users only, the Mac convention of option-click-on-close-box is obeyed if the mac option key is down."

	Preferences dismissAllOnOptionClose ifTrue:
		[Sensor rawMacOptionKeyPressed ifTrue:
			[^ self world closeUnchangedWindows]].
	self targetMorph removeActionsForEvent: #propertyChanged.
	self delete  "closeBox overrides stayUp"! !

!PropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:15:54'!
collapseButtonClicked
	
	self collapse
! !

!PropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:16:16'!
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

!PropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:16:39'!
fontPreferenceChanged

	super fontPreferenceChanged.
	self refreshView.! !

!PropertyEditor methodsFor: 'initialization' stamp: 'KenD 11/28/2016 18:33:34'!
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

!PropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 19:12:24'!
ivarNames
	"Answer an alpha-sorted collection of instance variable names to be shown
	when ShowAllIvars is true"

	| ivarNames neverShown |
	ivarNames := SortedCollection sortBlock: [ :sym1 :sym2 | sym1 < sym2 ].
	neverShown := self alwaysHiddenIVars.
	
	self targetMorph class allInstVarNames do: [ :ivarName | 
		(neverShown includes: ivarName)
			ifFalse: [ ivarNames add: ivarName ]
	].

	^ ivarNames ! !

!PropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:34:24'!
metaProps

	^ metaProps! !

!PropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 19:03:51'!
propertyNames
	"Answer an alpha-sorted collection of property names less MetaProperties"

	| propNames neverShown metaPropsDict |
	propNames := SortedCollection sortBlock: [ :sym1 :sym2 | sym1 < sym2 ].
	metaPropsDict := self metaProps.
	neverShown     := self alwaysHiddenProperties.
	
	self targetMorph propertiesDict keysDo: [ :propName | 
		(neverShown includes: propName)
			ifFalse: [ 
				(metaPropsDict includesKey: propName)
					ifFalse:  [ propNames add: propName ]
			] 
	].

	^ propNames ! !

!PropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:17:52'!
refreshView

	"Something may have changed.."
	| aMorph |
	aMorph := self targetMorph.
	self removeAllMorphs.
	
	self addTitle: (aMorph printStringLimitedTo: 60).

	"add operations"
	self add: 'Refresh Me'            target: self selector: #refreshView.
	self add: 'Add Property'          target: self selector: #addProperty.
	self add: 'Toggle IVar Display' target: self selector: #toggleIVarView.

	self addLine.
	
	"add properties"
	self propertyNames do: [ :name | | propMorph |
		propMorph := 
			VisualPropertyMorph 
					propName: name 
					morph: aMorph 
					propMeta: (aMorph valueOfMetaProperty: name).
		propMorph  target: self;
					selector: #edit: ;
					arguments: { name. }.
		self addMorphBack: propMorph
	].

	(self showAllIvars)  ifTrue: [ "add ivars"
		
		self addLine.
	
		aMorph class allInstVarNames do: [ :ivarName | | displayString |
			displayString := 
				(ivarName, ': ', 
					((aMorph instVarNamed: ivarName) printString) )
							truncateWithElipsisTo: 40.
			(ivarName asString = 'properties')
			ifFalse: [
				self add: displayString 
					  target: self 
				  	  selector: #editIvar: 
					  argument: ivarName
			]
		]
	].
	
	self titleMorph morphExtent: (self titleMorph morphExtent x) @ (Preferences windowTitleFont height).
	self adjustSubmorphsLayout;
		yourself! !

!PropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:34:39'!
showAllIvars

	^ showAllIvars! !

!PropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:35:24'!
showAllIvars: aBool

	showAllIvars := aBool! !

!PropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:34:53'!
showAllProps

	^ showAllProps! !

!PropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:35:08'!
showAllProps: aBool

	showAllProps := aBool! !

!PropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:18:46'!
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

!PropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:34:01'!
targetMorph

	^ targetMorph ! !

!PropertyEditor methodsFor: 'events' stamp: 'KenD 11/28/2016 19:18:53'!
toggleIVarView

	self toggleIVars; refreshView! !

!PropertyEditor methodsFor: 'accessing' stamp: 'KenD 11/28/2016 18:36:13'!
toggleIVars

	self showAllIvars: (self showAllIvars not)! !

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
