<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false displayMessage=false; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "form">
        <#if realm.password>
			<div class="login-half h-100">
                <div id="loginbox" class="login-box">
                    <div style="margin-left:20px">
						<div class="panel-heading oaf-logo"></div>
                        <div class="panel-heading">
                            <div class="panel-title login-title">${msg("welcome")}</div>
							<#if realm.password && social.providers??>
								<#list social.providers as p>
									<#if p.displayName = "Google">										
										<a href="${p.loginUrl}" id="zocial-${p.alias}">
											<div class="big-btn">
											  <div class="google-icon-wrapper">
												<img class="google-icon-svg" alt="G" src="${url.resourcesPath}/img/Google_Logo_From_Wiki.svg"/>
											  </div>
											  <p class="btn-text">${msg("doLogInWithGoogle")}</p>
											  <img class="gt-icon-svg" alt="arrow" src="${url.resourcesPath}/img/gt.svg">
											</div>
										</a>
									<#else>
										<a href="${p.loginUrl}" id="zocial-${p.alias}" class="btn btn-primary">${msg("doLogIn")} ${msg("with")} ${p.displayName}</a>
									</#if>
								</#list>
							</#if>
                        </div>

                        <div class="panel-body" >
                            <#if message?has_content>
                                <div id="login-alert" class="alert alert-danger col-sm-12">
                                    <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                                </div>
                            </#if>
                            <div id="sign-in-email-and-pass-link" class="sign-in-email-and-pass-div">
								<a href="#" class="sign-in-email-and-pass-link" onclick="showForm()"><u>${msg("doLogInWithEmailAndPassword")}</u></a>
							</div>
                            <form id="kc-form-login" class="${properties.kcFormClass!} hide-by-default manual-login-form" onsubmit="login.disabled = true; return true;" action="${url.loginAction?keep_after('^[^#]*?://.*?[^/]*', 'r')}" method="post">
                                <div class="or-div">
									${msg("or")}
								</div>
								<div class="${properties.kcInputWrapperClass!} whitney-font-400">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <#if usernameEditDisabled??>
                                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"/>
                                    <#else>
                                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>" />
                                    </#if>
                                </div>

                                <div class="${properties.kcInputWrapperClass!} whitney-font-400">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" placeholder="${msg("password")}"/>
                                </div>
								<#if realm.resetPasswordAllowed>
									<div style="float:right;margin-top:-20px"><a href="${url.loginResetCredentialsUrl}" class="forgot-password">${msg("doForgotPassword")}</a></div>
								</#if>

                                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                                    <#if realm.rememberMe && !usernameEditDisabled??>
                                        <div class="checkbox">
                                            <label>
                                                <#if login.rememberMe??>
                                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" tabindex="3" checked> ${msg("rememberMe")}
                                                <#else>
                                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" tabindex="3"> ${msg("rememberMe")}
                                                </#if>
                                            </label>
                                        </div>
                                    </#if>
                                </div>

                                <div id="kc-form-buttons" style="margin-top:10px" class="${properties.kcFormButtonsClass!}">
                                    <div class="${properties.kcFormButtonsWrapperClass!}">
                                        <a href="#" onclick="document.getElementById('kc-form-login').submit()">
											<div class="big-btn" style="margin-top:0;background-color:#2b7f68;">  
												<p class="btn-text" style="color:white;margin-left:10px;font-weight:600">${msg("doLogIn")}</p>
												<img class="gt-icon-svg" alt="arrow" src="${url.resourcesPath}/img/gt-white.svg">
											</div>
										</a>
										
                                        <!-- This comment block contains the old login form template and social providers for reference
										<input tabindex="4" class="${properties.kcButtonClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
										<#if realm.password && social.providers??>
                                            <#list social.providers as p>
                                                <#if p.displayName = "Google">
													<a href="${p.loginUrl}" id="zocial-${p.alias}" class="big-btn"></a>
												<#else>
													<a href="${p.loginUrl}" id="zocial-${p.alias}" class="btn btn-primary">${msg("doLogIn")} With ${p.displayName}</a>
												</#if>
                                            </#list>
                                        </#if>-->
                                    </div>
                                </div>

                                <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                                    <div class="form-group">
                                        <div class="col-md-12 control">
                                            <div style="border-top: 1px solid#888; padding-top:15px;" >
                                                ${msg("noAccount")}
                                                <a tabindex="6" href="${url.registrationUrl}" style="font-weight: bold;">
                                                    ${msg("doRegister")}
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </#if>
                            </form>
                            <#if realm.internationalizationEnabled  && locale.supported?size gt 1> 
                                <div id="kc-locale">
                                    <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!} whitney-font-400">
                                        <div class="kc-dropdown" id="kc-locale-dropdown">
                                            <div style="float:center;margin-top:100px;">
                                                <select onchange="location = this.value;" style=" border:0px;outline:0px;">
                                                    <#list locale.supported as l>
                                                    <option value="${l.url}" <#if l.label== locale.current> selected="selected" </#if>>${l.label}</option>
                                                    </#list>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
			<div class="image-half h-100"></div>
        </#if>
    </#if>
</@layout.registrationLayout>