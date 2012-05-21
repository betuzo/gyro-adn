package com.gyro.adn.domain

class TelefonoUsuario {

	static belongsTo = [usuario: Usuario]

	String telefono
	String extension
	String tipoTelefono

    static constraints = {
    	telefono blank:false
    	extension nullable:true, blank:true
    	tipoTelefono inList: ["Casa", "Oficina", "Celular", "Otro"]
    }

    String toString(){
        return "${tipoTelefono}"
    }
}
