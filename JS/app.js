// Animación del header
window.addEventListener("scroll", function () {
    let header = document.querySelector('header');
    header.classList.toggle("sticky", window.scrollY > 0);
});

// Validación del formulario
function enviaFormulario(e) {
    const formContacto = document.getElementById('formContacto');
    // nombre = document.getElementById('nombre').value,
    // correo = document.getElementById('correo').value,
    // asunto = document.querySelector('input[name="asunto"]:checked'),
    botonSub = document.getElementById('botonSub');

    let validarNombre = function (e) {
        if (formContacto.nombre.value == 0) {
            alert("Ingrese un nombre.");
            return false;
        } 
        
        if (!formatoNombre(formContacto.nombre.value)) {
            alert("Ingrese un nombre válido.")
            return false;
        }
        return true;
    };

    const formatoNombre = (nombre) => {
        return /^[A-Za-zÑñÁáÉéÍíÓóÚúÜü\s]+$/.test(nombre);
    }

    let validarCorreo = function (e) {
        if (formContacto.correo.value == 0) {
            alert("Ingrese un correo electrónico.")
            return false;
        } 
        
        if (!formatoCorreo(formContacto.correo.value)) {
            alert("Ingrese un correo electrónico válido.")
            return false;
        }
        return true;
    };

    const formatoCorreo = (correo) => {
        return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(correo);
    }

    let validarAsunto = function (e) {
        if (!formContacto.asunto[0].checked && !formContacto.asunto[1].checked && !formContacto.asunto[2].checked) {
            alert("Elija un asunto.");
            return false;
        }
        return true;
    }

    if (!validarNombre(e)) {
        return false;
    }

    if (!validarCorreo(e)) {
        return false;
    }

    if (!validarAsunto(e)) {
        return false;
    }

    
        // Código para evitar el cuadro (action) de formspree en pantalla. Se omite porque nos ignora las validaciones de JS.
    const data = new FormData(formContacto);
    const response = fetch("https://formspree.io/f/mjvzagye", {
        method: formContacto.method,
        body: data,
        headers: {
                'Accept': 'application/json'
            }
    })
    .then((response) => {

        if(response.ok){
            console.log("Form enviado");
            formContacto.reset()
            alert("¡Gracias por contactarte!");  
        }
  
    })
    .catch((error) => {
      console.error('Error:', error);
    });


    return true;
}