package com.gyro.adn.domain

class JefeCampania {

	transient springSecurityService

	String nombre
	String apellidoPaterno
	String apellidoMaterno
	String username
	String direccion
	int codigoPostal
	Municipio municipio
	Date fechaRegistro
    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static hasMany = [campanias: Campania]

	static constraints = {
		nombre blank:false 
    	apellidoPaterno blank:false
    	apellidoMaterno blank:true, nullable:true
    	username email:true, blank:false, unique: true
    	direccion blank:false
    	codigoPostal blank:false
    	municipio nullable:false
    	fechaRegistro nullable:false
        password blank: true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		JefeCampaniaRole.findAllByJefeCampania(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

	String toString(){
        return "${nombre} - ${apellidoPaterno}"
    }
}
