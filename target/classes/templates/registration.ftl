<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <div class="mb-4 ml-4">Add new User</div>
    <#--${message}-->
    ${message!}
    <@l.login "/registration" true/>
</@c.page>