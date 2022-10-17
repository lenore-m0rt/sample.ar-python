

function slider() {
    var slider = document.getElementById("bpm");
    var output = document.getElementById("bpm-val");
    output.innerHTML = slider.value; // Display the default slider value

    // Update the current slider value (each time you drag the slider handle)
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
    }
    else {
        output.innerHTML=slider.value;
    }
}