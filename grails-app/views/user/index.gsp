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
                            <h4 class="d-inline-block">Utilisateur</h4>
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
                                    <th>Nom d'utilisateur</th>
                                    <th>Mot de passe</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="serial"></td>
                                        <td></td>
                                        <td></td>
                                        <td><a href="${createLink(action: 'redactionUser', controller: 'user')}" class="btn btn-primary">Modifier les informations</a></td>
                                        <td><a href="" onclick="return confirm('Voulez vous réellement supprimer?');" class="btn btn-danger">Supprimer</a></td>
                                    </tr>
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

        </ul>
    </div>
    <!-- /.orders -->
    <!-- To Do and Live Chat -->
</div>

<script>
</script>

</body>
</html>