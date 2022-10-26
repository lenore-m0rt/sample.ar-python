//animación del header
window.addEventListener("scroll", function () {
    let header = document.querySelector('header');
    header.classList.toggle("sticky", window.scrollY > 0);
});

function slider() {
    var slider = document.getElementById("bpm");
    var output = document.getElementById("bpm-val");
    output.innerHTML = slider.value; // Muestra el valor del slide por defecto

    // Actualiza el valor del slide cada vez que se corre el cursor
    slider.oninput = function() {
    output.innerHTML = this.value;
    }
} 

function noBpm() {
    var slider = document.getElementById("bpm");
    var output = document.getElementById("bpm-val");
    slider.disabled = !slider.disabled;

    if (slider.disabled) {
        output.innerHTML='';
        slider.value = '120';
    }
    else {
        output.innerHTML=slider.value;
    }
}

function buscarSample() {
    var bpm = document.getElementById("bpm");
    var bpmVal = parseInt(bpm.value);
    
    if (bpmVal <= 100) {
        document.getElementById('resultados').src ='error.html';
        return true;
    }
    document.getElementById('resultados').src ='resultado-sam.html';
    return true;
} 
