<!DOCTYPE html>
<html>
    <head>
        <title>Presentation</title>
        <meta name="layout" content="main"/>
    </head>
    <body>
        <div class="">
            <form class="form-inline" action="${createLink(controller: 'presentation', action: 'index')}">
                <div class="form-group">
                    <label for="txturl">URL</label>
                    <input type="text" class="form-control" name="url" id="txturl" placeholder="Infoq presentation url">
                </div>
                <button type="submit" class="btn btn-default">Reproduce</button>
            </form>
            <ul>
                <g:each var="item" in="${items}">
                    <li><a href="${createLink(controller: 'presentation', action: 'index', params: [url: item.url])}">${item.title}</a></li>
                </g:each>
            </ul>
        </div>
    </body>
</html>