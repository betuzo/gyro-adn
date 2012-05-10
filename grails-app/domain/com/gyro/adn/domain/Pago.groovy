package com.gyro.adn.domain

class Pago {

	static belongsTo = [campania: Campania]

	String tipoPago
	Date fechaPago
	double cantidad

    static constraints = {
    	tipoPago inList: ["Parcial", "Final"]
    	fechaPago nullable:false
    	cantidad min:0D, nullable:false
    }

    String toString(){
        return "${tipoPago} - ${fechaPago}"
    }
}
