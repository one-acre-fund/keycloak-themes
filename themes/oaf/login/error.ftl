<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "form">
		<div class="login-half h-100">
			<div id="loginbox" class="login-box">
				<div style="margin-left:20px">
					<div class="panel-heading oaf-logo"></div>
					<div class="panel-heading">
						<div class="panel-title login-title">${msg("errorTitle")}</div>
					</div>

					<div class="panel-body" >
						<p>${message.summary?no_esc}</p>
						<#if client?? && client.baseUrl?has_content>
							<p><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
						</#if>
					</div>
				</div>
			</div>
		</div>
		<div class="image-half h-100"></div>
    </#if>
</@layout.registrationLayout>