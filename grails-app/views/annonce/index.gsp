<!DOCTYPE html>
<head>
    <meta name="layout" content="main"/>
</head>
<div class="animated fadeIn">

    <div class="clearfix"></div>

    <br>
    <!-- Orders -->
    <div class="orders">
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">

                        <div class="col-sm-12">
                            <h4 class="d-inline-block">Annonce</h4>
                            <!--<div class="float-right"><button type="button" class="btn btn-success" data-toggle="modal" data-target="#mediumModal" >Insérer nouveau</button></div>-->
                            <div class="float-right"><a class="btn btn-success" href="${createLink(action: 'redactionAnnonce', controller: 'annonce')}" >Insérer nouveau annonce</a></div>
                        </div>
                    </div>
                    <div class="card-body--">
                        <div class="table-stats order-table ov-h">
                            <table class="table ">
                                <thead>
                                <tr>
                                    <th class="serial">#</th>
                                    <th>Titre</th>
                                    <th>Prix</th>
                                    <th>Date de creation</th>
                                    <th>Modifier</th>
                                    <th>Supprimer</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <g:each in="${liste}" status="i" var="annonce">
                                        <tr>
                                            <td class="serial">${i+1}</td>
                                            <td><strong>${annonce.title}</strong></td>
                                            <td><strong>${annonce.price}$</strong></td>
                                            <td><g:formatDate format="yyyy-MM-dd" date="${annonce.dateCreated}"/></td>
                                            <td><a href="${createLink(action: 'redactionAnnonce', controller: 'annonce', params: [article:annonce.id])}" class="btn btn-primary">Modifier les informations</a></td>
                                            <td><a href="${createLink(action: 'delete', controller: 'annonce', params:[id: "${annonce.id}"] )}"
                                                   onclick="return confirm('Voulez vous réellement supprimer?');" class="btn btn-danger">Supprimer</a>
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                        </div> <!-- /.table-stats -->
                    </div>
                </div> <!-- /.card -->
            </div>  <!-- /.col-lg-8 -->
        </div>
    </div>
    <div class="float-right">
        <ul class="pagination">
            <g:if test="${Integer.valueOf(params.page)-1>0}">
                <li class="page-item"><a class="page-link" href="${createLink(action: 'index', controller: 'annonce', params: [page:"${Integer.valueOf(params.page)-1}"])}">Précédent</a></li>
            </g:if>
            <g:else>
                <li class="page-item disabled"><a class="page-link" href="">Précédent</a></li>
            </g:else>

            <g:set var="counter" value="${0}"/>
            <g:while test="${counter < nbBoutons}">
                <g:set var="counter" value="${counter+1}"/>
                <g:if test="${Integer.valueOf(counter)==Integer.valueOf(params.page)}">
                    <li class="page-item active"><a class="page-link" href="${createLink(action: 'index', controller: 'annonce', params: [page:"${counter}"])}">${counter}</a></li>
                </g:if>
                <g:else>
                    <li class="page-item"><a class="page-link" href="${createLink(action: 'index', controller: 'annonce', params: [page:"${counter}"])}">${counter}</a></li>
                </g:else>
            </g:while>

            <g:if test="${Integer.valueOf(params.page)+1<=nbBoutons}">
                <li class="page-item"><a class="page-link" href="${createLink(action: 'index', controller: 'annonce', params: [page:"${Integer.valueOf(params.page)+1}"])}">Suivant</a></li>
            </g:if>
            <g:else>
                <li class="page-item disabled"><a class="page-link" href="">Suivant</a></li>
            </g:else>
        </ul>
    </div>
    <!-- /.orders -->
    <!-- To Do and Live Chat -->
</div>

<script>
    $(document).ready(function(){
        $("#annonce").addClass("active");
    });
</script>