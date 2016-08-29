api
install
	|pluginPath|

	self downloadFilename exists
		ifFalse: [ Error signal: 'Library is not downloaded!' ].

	pluginPath := self libraryDirectory / self libraryName.
	
	(Smalltalk vm listLoadedModules includes: self libraryName)
		ifTrue: [
			MozServices stop.
			Smalltalk vm forgetModule: self libraryName.
		].
	
	pluginPath exists ifTrue: [ pluginPath delete ].
	self downloadFilename moveTo: pluginPath.

	MozServices start