private - ffi
primSetAttributeInt: anInteger index: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_int(self, FFIExternalEnumeration anIndex, uint32 anInteger))