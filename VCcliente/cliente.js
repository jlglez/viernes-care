
function nota(){
    var config= new FormData();
    config.append("accion", "nota");
    config.append("dni", document.getElementById("dni").value.toUpperCase());
    config.append("estado", "contagiado");
    config.append("id_usuario", document.getElementById("id_usuario").value);
    config.append("nota", document.getElementById("nota").value);

    var opcionesPregunta = {
      method: 'POST',
      body: config,
      redirect: 'follow'
    };

    fetch("http://192.168.0.57/vcserver/serv_usu.php", opcionesPregunta)
    .then(response => response.text())
    .then(result1 => {
        if (result1=="ok") {limpiaAlta();}
    })  
}

function datosPac(){
    document.getElementById("seccion").innerHTML= "";
    var url="http://192.168.0.57/vcserver/serv_pac.php?accion=datos&dni="+document.getElementById("dni_paciente").value.toUpperCase()+"&codigo_acceso="+document.getElementById("codigo_acceso").value;

    fetch(url)
    .then(response => response.json())
    .then(res => {
        document.getElementById("seccion").innerHTML="<div>Nombre: "+res[0].nombre+" "+res[0].apellido_1+" "+ res[0].apellido_2+"</div><br>";
        document.getElementById("seccion").innerHTML+="<div>Estado actual: "+res[0].estado+"</div><br><b><u>NOTAS</b></u><br><hr>";

    })

    url="http://192.168.0.57/vcserver/serv_pac.php?accion=notas&dni="+document.getElementById("dni_paciente").value.toUpperCase()+"&codigo_acceso="+document.getElementById("codigo_acceso").value;
    fetch(url)   
    .then(response1 => response1.json())
    .then(res1 => {
        var respuesta="";
        for(i=0;i<res1.length;i++){
            respuesta+="<div>Rastreador: "+res1[i].id_usuario+"<div></div>Fecha: "+res1[i].fecha+"</div><br>";
            respuesta+="<div>"+res1[i].nota+"</div><br>";
        }
        document.getElementById("seccion").innerHTML+=respuesta;

    })
}

function alta(){

    var config= new FormData();
    config.append("accion", "alta");
    config.append("dni", document.getElementById("dni").value.toUpperCase());
    config.append("nombre", document.getElementById("nombre").value);
    config.append("apellido_1", document.getElementById("apellido_1").value);
    config.append("apellido_2", document.getElementById("apellido_2").value);
    config.append("email", document.getElementById("email").value.toLowerCase());
    config.append("telefono", document.getElementById("telefono").value);
    config.append("estado", "contagiado");
    config.append("id_usuario", document.getElementById("id_usuario").value);

    var opcionesPregunta = {
      method: 'POST',
      body: config,
      redirect: 'follow'
    };

    fetch("http://192.168.0.57/vcserver/serv_usu.php", opcionesPregunta)
    .then(response => response.text())
    .then(result => {
        console.log(result);
    })

    // a continuación añadimos la nota.
    nota();
    
}

function lista(){
    document.getElementById("seccion").innerHTML= "";
    var flt = document.getElementsByName("filtro");
    var url="http://192.168.0.57/vcserver/serv_usu.php?accion=lista";
    for (var i=0; i<3;i++){
        url+="&"+flt[i].value+"="+flt[i].checked;
    }

    fetch(url)   
    .then(response => response.json())
    .then(res => {
        var respuesta="<table><tr> <th>Apellido 1</th> <th>Apellido 2</th> <th>Nombre</th> <th>DNI</th> <th>telefono</th> <th>email</th> <th>C. acceso</th> <th>estado</th> </tr>";
        for(i=0;i<res.length;i++){
            respuesta+="<tr> <td>"+res[i].apellido_1+"</td> <td>"+res[i].apellido_2+"</td>";
            respuesta+="<td>"+res[i].nombre+"</td> <td>"+res[i].dni+"</td>";
            respuesta+="<td>"+res[i].telefono+"</td> <td>"+res[i].email+"</td>";
            respuesta+="<td>"+res[i].codigo_acceso+"</td> <td>"+res[i].estado+"</td> </tr>";
        }
        respuesta+="</table>";
        document.getElementById("seccion").innerHTML=respuesta;
    })
}

function datosRas(){
    document.getElementById("seccion").innerHTML= "";
    var url="http://192.168.0.57/vcserver/serv_usu.php?accion=datos&dni="+document.getElementById("dni_rast").value.toUpperCase();

    fetch(url)
    .then(response => response.json())
    .then(res => {
        var respuesta="<div>Nombre: "+res[0].nombre +" "+res[0].apellido_1 +" "+res[0].apellido_2+"</div>";
        respuesta+="<div>DNI: "+res[0].dni+"</div><div>Telefono: "+res[0].telefono+"</div><div>Email: "+res[0].email+"</div>";
        respuesta+="<div>Código de acceso: "+res[0].codigo_acceso+"</div><div>Estado actual: <b>"+res[0].estado+"</b></div><br>";
        respuesta+="<div>Fecha primer diagnóstico: "+res[0].fecha+"</div><div>Rastreador: "+res[0].id_usuario+"</div><div>Nº de seguimientos: "+res[0].notas+"</b></div><br>";

        document.getElementById("seccion").innerHTML=respuesta;

    })
}

function modif(){
    var url="http://192.168.0.57/vcserver/serv_usu.php?accion=datos&dni="+document.getElementById("dni_rast").value.toUpperCase();

    fetch(url)
    .then(response => response.json())
    .then(res => {
        document.getElementById("nombre").value=res[0].nombre;
        document.getElementById("apellido_1").value=res[0].apellido_1;
        document.getElementById("apellido_2").value=res[0].apellido_2;
        document.getElementById("email").value=res[0].email;
        document.getElementById("telefono").value=res[0].telefono;
        document.getElementById("actualizar").innerHTML="<button class='boton' onclick='actualiza()' title='Actualiza los datos'>Actualizar</button>";
    })    
}

function histor(){
    document.getElementById("seccion").innerHTML= "";

    // datos del paciente
    var url="http://192.168.0.57/vcserver/serv_usu.php?accion=datos&dni="+document.getElementById("dni_rast").value.toUpperCase();
    console.log(url);
    fetch(url)
    .then(response => response.json())
    .then(res => {
        var respuesta="";
        respuesta+="<div>Nombre: "+res[0].nombre+" "+res[0].apellido_1+" "+ res[0].apellido_2+"</div>";
        respuesta+="<div>DNI: "+res[0].dni+"</div><div>Telefono: "+res[0].telefono+"</div><div>Email: "+res[0].email+"</div>";
        respuesta+="<br><b><u>HISTORIA CLÍNICA</b></u><br><hr>";
        document.getElementById("seccion").innerHTML= respuesta;
    })

    // Hitorial
    url="http://192.168.0.57/vcserver/serv_usu.php?accion=notas&dni="+document.getElementById("dni_rast").value.toUpperCase();
    fetch(url)   
    .then(response => response.json())
    .then(res => {
        var respuesta="";
        for(i=0;i<res.length;i++){
            respuesta+="<div>Rastreador: "+res[i].id_usuario+"<div></div>Fecha: "+res[i].fecha+"</div><br>";
            respuesta+="<div>"+res[i].nota+"</div><br>";
        }
        document.getElementById("seccion").innerHTML+=respuesta;
    })
}


function limpiaAlta() {
    document.getElementById("dni").value="";
    document.getElementById("nombre").value="";
    document.getElementById("apellido_1").value="";
    document.getElementById("apellido_2").value="";
    document.getElementById("email").value="";
    document.getElementById("telefono").value="";
    document.getElementById("nota").value="";
    document.getElementById("id_usuario").value="";
    alert("Paciente añadido/modificado");
}

function actualiza(){
    

}