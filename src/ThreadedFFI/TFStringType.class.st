"
I represent a String type in uffi that gets marshalled to a pointer type in libffi.
I override the marshalling methods to allow reading/writing strings from/to C pointers.

See my superclass for more details.
"
Class {
	#name : #TFStringType,
	#superclass : #TFPointerType,
	#category : #ThreadedFFI
}

{ #category : #writting }
TFStringType >> freeValueIfNeeded: aCHeapValueHolder [
	
	(aCHeapValueHolder pointerAt: 1) free
]

{ #category : #writting }
TFStringType >> readValue: anExternalAddress offset: offset [

	^ (super readValue: anExternalAddress offset: offset) readStringUTF8
]

{ #category : #writting }
TFStringType >> write: aString into: targetAddress [

	super write: (ExternalAddress fromString: aString utf8Encoded) into: targetAddress
]