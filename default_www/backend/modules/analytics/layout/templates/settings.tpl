{include:file='{$BACKEND_CORE_PATH}/layout/templates/head.tpl'}
{include:file='{$BACKEND_CORE_PATH}/layout/templates/structure_start_module.tpl'}

<div class="pageTitle">
	<h2>{$lblModuleSettings|ucfirst}: {$lblAnalytics|ucfirst}</h2>
</div>

{option:Wizard}
	<div class="generalMessage infoMessage content">
		<p><strong>{$msgConfigurationError}</strong></p>
		<ul class="pb0">
			{option:NoSessionToken}<li>{$errNoSessionToken}</li>{/option:NoSessionToken}
			{option:NoTableId}<li>{$errNoTableId}</li>{/option:NoTableId}
		</ul>
	</div>
{/option:Wizard}

<div class="box">
	<div class="heading">
		<h3>{$lblGoogleAnalyticsLink|ucfirst}</h3>
	</div>

	<div class="options">
		{option:Wizard}
			{option:NoSessionToken}
				<p>{$msgLinkGoogleAccount}</p>
				<div class="buttonHolder">
					<a href="{$googleAccountAuthenticationForm}" class="submitButton button inputButton button "><span>{$msgAuthenticateAtGoogle}</span></a>
				</div>
			{/option:NoSessionToken}

			{option:NoTableId}
				{option:accounts}
					<p>{$msgLinkWebsiteProfile}</p>
					{iteration:accounts}
						<div class="datagridHolder">
							{$accounts.datagrid}
						</div>
					{/iteration:accounts}
				{/option:accounts}

				{option:!accounts}
					<p>{$msgNoAccounts}</p>
				{/option:!accounts}

				<div class="buttonHolder">
					<a href="{$var|geturl:'settings'}&amp;remove=session_token" rel="confirmDeleteSessionToken" class="askConfirmation submitButton button inputButton button"><span>{$msgRemoveAccountLink}</span></a>
				</div>
			{/option:NoTableId}
		{/option:Wizard}

		{option:EverythingIsPresent}
			<p>
				{$lblLinkedAccount|ucfirst}: <strong>{$accountName}</strong><br />
				{$lblLinkedProfile|ucfirst}: <strong>{$profileTitle}</strong>
			</p>
			<div class="buttonHolder">
				<a href="{$var|geturl:'settings'}&amp;remove=table_id" rel="confirmDeleteTableId" class="askConfirmation submitButton button inputButton button"><span>{$msgRemoveProfileLink}</span></a>
			</div>
		{/option:EverythingIsPresent}

		<div id="confirmDeleteSessionToken" title="{$lblDelete|ucfirst}?" style="display: none;">
			<p>
				{$msgConfirmDeleteLinkGoogleAccount}
			</p>
		</div>

		<div id="confirmDeleteTableId" title="{$lblDelete|ucfirst}?" style="display: none;">
			<p>
				{$msgConfirmDeleteLinkAccount|sprintf:{$accountName}}
			</p>
		</div>
	</div>
</div>

{include:file='{$BACKEND_CORE_PATH}/layout/templates/structure_end_module.tpl'}
{include:file='{$BACKEND_CORE_PATH}/layout/templates/footer.tpl'}