private - ffi
valueNamed: aName in: anAddress
	"This method was automatically generated"
	^ self ffiCall: #(bool moz2d_test_AntialiasMode(String aName, int* anAddress))