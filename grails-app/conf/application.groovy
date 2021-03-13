

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.mbds.grails.lecoincoin.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.mbds.grails.lecoincoin.UserRole'
grails.plugin.springsecurity.authority.className = 'com.mbds.grails.lecoincoin.Role'
grails.plugin.springsecurity.rest.token.storage.jwt.secret="eyJhbGciOiJIUzI1NiJ9.eyJSb2xlIjoiQWRtaW4iLCJJc3N1ZXIiOiJsY29pbmNvaW4iLCJVc2VybmFtZSI6IkxlY29pbmNvaW4iLCJleHAiOjE2NDcwOTMyMTksImlhdCI6MTYxNTU1NzIxOX0.ipXRovHYdtIGGr24FOTp5bVldPFWe9Nv5dMFT_z9pDE"
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]


grails.plugin.springsecurity.filterChain.chainMap = [
		[pattern: '/assets/**',      filters: 'none'],
		[pattern: '/**/js/**',       filters: 'none'],
		[pattern: '/**/css/**',      filters: 'none'],
		[pattern: '/**/images/**',   filters: 'none'],
		[pattern: '/**/favicon.ico', filters: 'none'],
		//Stateless chain
		[
				pattern: '/api/**',
				filters: 'JOINED_FILTERS,-anonymousAuthenticationFilter,-exceptionTranslationFilter,-authenticationProcessingFilter,-securityContextPersistenceFilter,-rememberMeAuthenticationFilter'
		],

		//Traditional, stateful chain
		[
				pattern: '/**',
				filters: 'JOINED_FILTERS,-restTokenValidationFilter,-restExceptionTranslationFilter'
		]
]