//animación del header

window.addEventListener("scroll", function () {
    let header = document.querySelector('header');
    header.classList.toggle("sticky", window.scrollY > 0);
});

function buscarPartitura() {
    var compositor = document.getElementById('compositor').value ;
    var obra = document.getElementById('obra').value;
    var estilo = document.querySelector('input[name="estilo"]:checked');
    var coral = document.getElementById('coral');

    if (compositor =='' && obra=='' && estilo ==null) {
        alert("Debe completar al menos un campo de búsqueda");
        return false;
    }

    if (coral.checked) {
        document.getElementById('resultados').src ='error.html';
        return true;
    }
    document.getElementById('resultados').src ='resultado.html';
    return true;

}
