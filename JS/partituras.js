
function buscarPartitura() {
    var compositor = document.getElementById('compositor').value ;
    var obra = document.getElementById('obra').value;
    var estilo = document.querySelector('input[name="estilo"]:checked');

    if (compositor =='' && obra=='' && estilo ==null) {
        alert("Debe completar al menos un campo de búsqueda");
        return false;
    }
    document.getElementById('resultados').src ='resultado.html';
    return true;
}