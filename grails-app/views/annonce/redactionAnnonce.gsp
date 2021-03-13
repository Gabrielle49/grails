<!DOCTYPE html>
<head>
    <meta name="layout" content="main"/>
</head>
<style>
.autocomplete {
    /*the container must be positioned relative:*/
    position: relative;
    display: inline-block;
}
.autocomplete-items {
    position: absolute;
    border: 1px solid #d4d4d4;
    border-bottom: none;
    border-top: none;
    z-index: 99;
    /*position the autocomplete items to be the same width as the container:*/
    top: 100%;
    left: 0;
    right: 0;
}
.autocomplete-items div {
    padding: 10px;
    cursor: pointer;
    background-color: #fff;
    border-bottom: 1px solid #d4d4d4;
}
.autocomplete-items div:hover {
    /*when hovering an item:*/
    background-color: #e9e9e9;
}
.autocomplete-active {
    /*when navigating through the items using the arrow keys:*/
    background-color: DodgerBlue !important;
    color: #ffffff;
}
</style>

<div class="clearfix"></div>

<br>

<!-- Orders -->
<div class="orders">
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
               <div class="card-body">
                    <g:if test="${flash.message}">
                        <div class="message" style="display: block"></div>
                        <div class="sufee-alert alert with-close alert-success alert-dismissible fade show">
                            <span class="badge badge-pill badge-success">Succés</span>
                            ${flash.message}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                    </g:if>
                   <h3><strong>Insérer / Editer une annonce</strong></h3>
                   <br>
                   <g:form controller="annonce" >
                       <div class="card-body card-block">
                           <input type="hidden" value="0" name="annonce" id="id">
                           <div class="row form-group">
                                   <label class=" form-control-label">Titre</label>
                                   <input type="text" id="titre" name="titre" class="form-control">
                           </div>
                           <div class="form-group">
                               <label class="form-control-label">Description</label>
                               <textarea id="description" name="description"></textarea>
                           </div>
                           <div class="row form-group">
                               <label class=" form-control-label">Date de création</label>
                               <input type="date" id="dateCreation" name="dateCreation" class="form-control">
                           </div>
                           <div class="row form-group">
                               <label class=" form-control-label">Prix</label>
                               <input type="number" id="prix" name="prix" class="form-control">
                           </div>
                           <div class="row form-group">
                               <label class=" form-control-label">Illustration(Test)</label>
                               <input type="text" id="illustration" name="illustration" class="form-control">
                           </div>
                           <!--<div class="form-group">
                               <input type="file" name="image" id="image">
                           </div>-->
                       <div class="modal-footer">
                           <g:actionSubmit type="button" class="btn btn-primary" value="Confirmer" action="save"/>
                       </div>
                   </g:form>

               </div>
            </div> <!-- /.card -->
        </div>  <!-- /.col-lg-8 -->
</div>
    <div id="card1" class="col-md-2">
        <div class="card">
            <img class="card-img-top" src="https://i.imgur.com/ue0AB6J.png" alt="Card image cap">
            <div class="card-body">
                <p class="card-text"><button class="btn btn-outline-danger btn-lg btn-block" type="button" onclick="hideImage(1)">Supprimer</button></p>
            </div>
        </div>
    </div>
    <div id="card2" class="col-md-2">
        <div class="card">
            <img class="card-img-top" src="https://i.imgur.com/hrS2McC.png" alt="Card image cap">
            <div class="card-body">
                <p class="card-text"><button class="btn btn-outline-danger btn-lg btn-block" type="button" onclick="hideImage(2)">Supprimer</button></p>
            </div>
        </div>
    </div>
    <div id="card3" class="col-md-2">
        <div class="card">
            <img class="card-img-top" src="https://i.imgur.com/MUBS4Gh.png" alt="Card image cap">
            <div class="card-body">
                <p class="card-text"><button class="btn btn-outline-danger btn-lg btn-block" type="button" onclick="hideImage(3)">Supprimer</button></p>
            </div>
        </div>
    </div>
    <div id="card4" class="col-md-2">
        <div class="card">
            <img class="card-img-top" src="https://i.imgur.com/MUBS4Gh.png" alt="Card image cap">
            <div class="card-body">
                <p class="card-text"><button class="btn btn-outline-danger btn-lg btn-block" type="button" onclick="hideImage(4)">Supprimer</button></p>
            </div>
        </div>
    </div>
</div>


<script>

    function hideImage(id){
        var x = document.getElementById("card"+id);
        x.style.display = "none";
    }

    $(document).ready(function(){
        document.getElementById('dateCreation').valueAsDate = new Date();
        $("#annonce").addClass("active");
    });

</script>