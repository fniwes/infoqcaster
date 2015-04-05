<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Presentation</title>
    </head>
    <body>
        <form class="row" action="${createLink(controller: 'presentation', action: 'index')}">
            <div class="col-md-10">
                <label for="url" class="sr-only">URL of presentation to watch</label>
                <input type="url" class="form-control" id="url" name="url" placeholder="URL of Presentation to watch">
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-default btn-block">Watch</button>
            </div>
        </form>
        <div class="row">
            <div class="col-md-6 latest-presentations">
                <h2 class="section-title">Latests presentations</h2>
                <ul>
                    <g:each var="item" in="${items}">
                        <li><a href="${createLink(controller: 'presentation', action: 'index', params: [url: item.url])}">${item.title}</a></li>
                    </g:each>
                </ul>
            </div>
            <div class="col-md-6 recently-viewed">
                <h2 class="section-title">Recently viewed</h2>
                <ul>
                    <g:each var="item" in="${watched}">
                        <li><a href="${createLink(controller: 'presentation', action: 'index', params: [url: item.url])}">${item.title}</a></li>
                    </g:each>
                </ul>
            </div>
        </div>
    </body>
</html>