<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <div class="mb-4 ml-4">Login page</div>
    ${message!}
<@l.login "/login" false/>
</@c.page>