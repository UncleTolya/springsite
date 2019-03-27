<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
    <p>
        <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample"
                aria-expanded="false" aria-controls="collapseExample">
            Add new message
        </button>
    </p>
    <div class="form-inline collapse mb-8" id="collapseExample">
        <form method="post" enctype="multipart/form-data">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input class="col-sm-3 col-form-label" type="text" name="text" placeholder="Введите сообщение">
            <input class="col-sm-1 col-form-label" type="text" name="tag" placeholder="Тэг">
            <button type="submit" class="btn btn-primary">Добавить</button>
            <div class="custom-file mt-4">
                <label class="col-sm-4 custom-file-label" for="customFile">Choose file</label>
                <div class="col-sm-4">
                    <input type="file" class="custom-file-input" id="customFile">
                </div>
            </div>
        </form>
    </div>
    <div class="mt-4 mb-4">
        <form method="get" action="/main">
            <input class="col-sm-3 col-form-label" type="text" name="filter" placeholder="Фильтр"
                   value=${filter!""}>
            <label><input type="checkbox"
                          name="filterHasImage"
                        <#if filterHasImage?? && filterHasImage?string="on">
                    checked="true"</#if>> with img </label>
            <button type="submit" class="btn btn-secondary btn-sm">Показать</button>
        </form>
    </div>
    <div class="card-columns">
    <#list messages as message>
        <div class="card m-4">
            <div>
                <span>${message.authorName}:</span>
                <div class="card-footer">
                    <strong>${message.text}</strong>
                    <#if message.tag?? && message.tag?string!=("")>
                        <div>
                            <i>#${message.tag}</i>
                        </div>
                    </#if>
                </div>
                <div>
                    <#if message.fileName??>
                        <img class="card-img-top" src="/img/${message.fileName}">
                    </#if>
                </div>
            </div>
        </div>
    <#else>
        No messages
    </#list>
    </div>
</@c.page>