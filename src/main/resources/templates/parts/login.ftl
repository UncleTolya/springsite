<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name :</label>
            <div class="col-sm-4">
                <input type="text" name="username" class="form-control"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password :</label>
            <div class="col-sm-4">
                <input type="password" name="password" class="form-control"/>
            </div>
        </div>
    <#if isRegisterForm>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> E-Mail :</label>
            <div class="col-sm-4">
                <input type="email" name="email" class="form-control" placeholder="some@some.com"/>
            </div>
        </div>
    </#if>
        <#--<div><label> Password: <input type="password" name="password"/> </label></div>-->
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="form-group row">
            <div class="col-sm-10">
                <#if !isRegisterForm>
                    <input type="submit" value="Sign In" class="btn btn-primary"/>
                    <a class="btn btn-primary" href="/registration">Sign Up</a>
                <#else>
                    <input type="submit" value="Sign Up" class="btn btn-primary"/>
                </#if>
            </div>
        </div>
        <#--<div><input type="submit" value="Sign In"/></div>-->
    </form>
</#macro>

<#macro logout>
    <div class="ml-4">
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Sign Out" class="btn btn-primary"/>
        </form>
    </div>
</#macro>