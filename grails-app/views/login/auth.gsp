<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
	<meta name="layout" content="main"/>
	<s2ui:title messageCode='spring.security.ui.login.title'/>
	<asset:stylesheet src='spring-security-ui-auth.css'/>
</head>
<body>
<!--<div class="login s2ui_center ui-corner-all" style='text-align:center;'>
	<div class="login-inner">
		<s2ui:form type='login' focus='username'>
			<div class="sign-in">
				<h2>Login</h2>
				<table>
					<tr>
						<td><label for="username">Nom d'utilisateur </label></td>
						<td><input type="text" name="${securityConfig.apf.usernameParameter}" id="username" class='form-control' size="20"/></td>
					</tr>
					<tr>
						<td><label for="password">Mot de passe</label></td>
						<td><input type="password" name="${securityConfig.apf.passwordParameter}" id="password" class="form-control" size="20"/></td>
					</tr>
					<tr>
						<td colspan='2'>
							<input type="checkbox" class="checkbox" name="${securityConfig.rememberMe.parameter}" id="remember_me" checked="checked"/>
							<label for='remember_me'>Se rappeler de moi</label> |
							<span class="forgot-link">
								<g:link controller='register' action='forgotPassword'>Mot de passe oublié</g:link>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan='2'>
							<s2ui:linkButton elementId='register' controller='register' messageCode='spring.security.ui.login.register'/>
							<s2ui:submitButton elementId='loginButton' messageCode='spring.security.ui.login.login'/>
						</td>
					</tr>
				</table>
			</div>
		</s2ui:form>
	</div>
</div>-->

<div class="sufee-login d-flex align-content-center flex-wrap">
	<div class="container">
		<div class="login-content">
			<div class="login-logo">
				<a href="index.html">
					<img class="align-content" src="http://localhost:8080/assets/logo.png" alt="">
				</a>
			</div>
			<div class="login-form">
				<s2ui:form type='login' focus='username'>
					<div class="form-group">
						<label>Email address</label>
						<input type="text" name="${securityConfig.apf.usernameParameter}" id="username" class="form-control" placeholder="Nom d'utilisateur">
					</div>
					<div class="form-group">
						<label>Password</label>
						<input type="password" name="${securityConfig.apf.passwordParameter}" id="password" class="form-control" placeholder="Password">
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox" name="${securityConfig.rememberMe.parameter}" id="remember_me"> Remember Me
						</label>
						<label class="pull-right">
							<g:link controller='register' action='forgotPassword'>Mot de passe oublié?</g:link>
						</label>

					</div>
					<input type="submit" id="loginButton_submit" class="btn btn-success btn-flat m-b-30 m-t-30"/>
					<div class="register-link m-t-15 text-center">
						<p>Avez vous un compte? <s2ui:linkButton elementId='register' controller='register' messageCode='Créer un compte'/></p>
					</div>
				</s2ui:form>
			</div>
		</div>
	</div>
</div>
</body>
</html>
