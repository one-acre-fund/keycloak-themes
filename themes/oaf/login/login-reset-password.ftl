<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "form">
		<div class="login-half h-100">
			<div id="loginbox" class="login-box">
				<div style="margin-left:20px">
					<div class="panel-heading oaf-logo"></div>
					<div class="panel-heading">
						<div class="panel-title login-title">${msg("emailForgotTitle")}</div>
					</div>

					<div class="panel-body" >
						<form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
							<div class="whitney-font-400">
								<div class="whitney-font-400" style="margin-bottom:20px;">
										<#if auth?has_content && auth.showUsername()>
											<div class="mdc-text-field mdc-textfield1 mdc-text-field--outlined">
												<input id="username" class="mdc-text-field__input" name="username" type="text" autofocus value="${auth.attemptedUsername}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>" style="font-size:15px;"/>
												<div class="mdc-notched-outline">
													<div class="mdc-notched-outline__leading" style="border-color: #2b7f68;"></div>
													<div class="mdc-notched-outline__notch" style="border-color: #2b7f68;">
														<label for="text-field-hero-input" class="mdc-floating-label" style="font-size:15px;"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
													</div>
													<div class="mdc-notched-outline__trailing" style="border-color: #2b7f68;"></div>
												</div>
											</div>
										<#else>
											<div class="mdc-text-field mdc-textfield1 mdc-text-field--outlined">
												<input id="username" class="mdc-text-field__input" name="username" type="text" autofocus aria-invalid="<#if messagesPerField.existsError('username')>true</#if>" style="font-size:15px;"/>
												<div class="mdc-notched-outline">
													<div class="mdc-notched-outline__leading" style="border-color: #2b7f68;"></div>
													<div class="mdc-notched-outline__notch" style="border-color: #2b7f68;">
														<label for="text-field-hero-input" class="mdc-floating-label" style="font-size:15px;"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
													</div>
													<div class="mdc-notched-outline__trailing" style="border-color: #2b7f68;"></div>
												</div>
											</div>
										</#if>

									<#if messagesPerField.existsError('username')>
										<span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
													${kcSanitize(messagesPerField.get('username'))?no_esc}
										</span>
									</#if>
								</div>
							</div>
							<div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
								<div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
									<div class="${properties.kcFormOptionsWrapperClass!}">
										<span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
									</div>
								</div>

								<div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
									<input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="image-half h-100"></div>
    <#elseif section = "info" >
        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
