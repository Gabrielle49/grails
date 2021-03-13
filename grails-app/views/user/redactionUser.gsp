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
                   <g:form controller="infoArticle">
                       <div class="card-body card-block">
                           <input type="hidden" value="0" name="article" id="id">
                           <div class="row form-group">
                                   <label class=" form-control-label">Nom d'utilisateur</label>
                                   <input type="text" id="titre" name="titre" class="form-control">
                           </div>
                           <div class="row form-group">
                               <label class=" form-control-label">Mot de passe</label>
                               <input type="text" id="descriptionCourte" name="descriptionCourte" class="form-control">
                           </div>
                       </div>
                       <div class="modal-footer">
                           <g:actionSubmit type="button" class="btn btn-primary" value="Confirmer" action="save"/>
                       </div>
                   </g:form>
               </div>
            </div> <!-- /.card -->
        </div>  <!-- /.col-lg-8 -->
    </div>
</div>

<script>

</script>