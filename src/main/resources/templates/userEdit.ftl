<#import "parts/common.ftl" as c>

<@c.page>
    User editor
    <form action="/user" method="post">
        <input type="text" name="username" value="${user.username}">
        <#--<input type="text" value="${_csrf.token}">-->
        <p>
            <#list roles as role>
            <div>
                <label><input type="checkbox"
                              name="${role}" ${user.roles?seq_contains(role)?string("cheked", "")}>${role}</label>
            </div>
            </#list>
        </p>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit">Save</button>
    </form>

</@c.page>