<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
Add new User
    <#--${message}-->
    ${message!"Input login and password"}
    <@l.login "/registration" />
</@c.page>