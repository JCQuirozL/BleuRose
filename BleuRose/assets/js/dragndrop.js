var contador = 0;
var elemArrastrableId = "";


function start(e) {
    /*funciones de los elementos cuadraditos*/
    console.log("start");
    e.dataTransfer.effectAllowed = "move";
    e.dataTransfer.setData("Data", e.target.id); /*Data arrastrable1*/
    $("#" + e.target.id).css("opacity", "0.4");
    elemArrastrableId = e.target.id;
    origen = e.target.parentNode.id;
}

function end(e) {
    console.log(end);
    e.target.style.opacity = '';
    e.dataTransfer.clearData("Data");
    elemArrastrableId = "";
}

function enter(e) {
    console.log("enter");
    e.target.style.border = "5px solid #d527f7";
}

function leave(e) {
    console.log("leave");
    //e.target.style.border="";
    $("#" + e.target.id).css("border", "");
}

function over(e) {
    console.log("over");
    var id = e.target.id;
    //return false
    e.preventDefault();
    return true;

}

function drop(e) {
    console.log("drop");
    var elementoArrastrado = e.dataTransfer.getData("Data");
    e.target.appendChild(document.getElementById(elementoArrastrado));
    e.target.style.border = "";
}


function eliminar(e) {
    console.log("eliminar");
    var elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data")); //arrastrable1
    elementoArrastrado.parentNode.removeChild(elementoArrastrado);
    e.target.style.border = "";

}

function clonar(e) {
    if (contador < 8) {
        console.log("clonar");
        var elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data"));//Arrastrable1
        elementoArrastrado.style.opacity = "";
        var elementoClonado = elementoArrastrado.cloneNode(true);
        elementoClonado.id = "ElementoClonado" + contador;
        contador++; //1
        elementoClonado.style.position = "static";
        e.target.appendChild(elementoClonado);
        e.target.style.border = "";
        console.log(contador);
        $("#agregados").html(contador);

    }
    else {
        alert("No se pueden agregar más de " + contador + " artículos al carrito.");
        e.target.style.border = "";

    }
}