<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <br>
    <@l.logout />
    <span><a href="/user">User list</a></span>

    <br>
    <div>
        <form method="post">
            <input type="text" name="text" placeholder="Введите сообщение"/>
            <input type="text" name="tag" placeholder="Тэг">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Добавить</button>
        </form>
    </div>

    <br>
    <div>Фильтр (по тэгу)</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter}">
        <button type="submit">Найти</button>
    </form>

    <br>
    <div>Список сообщений:</div>
    <br>

    <#list messages as message>
        <div>
            <b>${message.id}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <strong>${message.authorName}</strong>
        </div>
    <#else>
    No message
    </#list>
</@c.page>