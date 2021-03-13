<!DOCTYPE html>
<head>
    <meta name="layout" content="main"/>
</head>
<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">
        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="index.html"><i class="menu-icon  fa fa-laptop"></i>Gestion des données</a>
                </li>
                <li class="menu-title">CRUD</li><!-- /.menu-title -->
                <li>
                <li id="annonce">
                    <a href="${createLink(action: 'index', controller: 'annonce', params: [page:'1'])}"> <i class="menu-icon fa fa-table"></i>Annonce</a>
                </li>
                <li id="user">
                    <a href="${createLink(action: 'index', controller: 'utilisateur', params: [page:'1'])}"> <i class="menu-icon fa fa-table"></i>Utilisateur</a>
                </li>
            </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside>
