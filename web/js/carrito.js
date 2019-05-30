function validaCantidad(existencia){
    
    var cantidad = document.forms["myForm"]["cantidad"].value;    
    if(cantidad>existencia){
        alert("NO HAY SUFUCIENTES DISCOS EN ALMACEN");
        return false;
    }else       
        return true;
}