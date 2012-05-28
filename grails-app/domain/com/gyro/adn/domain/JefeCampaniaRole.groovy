package com.gyro.adn.domain

import org.apache.commons.lang.builder.HashCodeBuilder

class JefeCampaniaRole implements Serializable {

	JefeCampania jefeCampania
	Role role

	boolean equals(other) {
		if (!(other instanceof JefeCampaniaRole)) {
			return false
		}

		other.jefeCampania?.id == jefeCampania?.id &&
			other.role?.id == role?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (jefeCampania) builder.append(jefeCampania.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static JefeCampaniaRole get(long jefeCampaniaId, long roleId) {
		find 'from JefeCampaniaRole where jefeCampania.id=:jefeCampaniaId and role.id=:roleId',
			[jefeCampaniaId: jefeCampaniaId, roleId: roleId]
	}

	static JefeCampaniaRole create(JefeCampania jefeCampania, Role role, boolean flush = false) {
		new JefeCampaniaRole(jefeCampania: jefeCampania, role: role).save(flush: flush, insert: true)
	}

	static boolean remove(JefeCampania jefeCampania, Role role, boolean flush = false) {
		JefeCampaniaRole instance = JefeCampaniaRole.findByJefeCampaniaAndRole(jefeCampania, role)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(JefeCampania jefeCampania) {
		executeUpdate 'DELETE FROM JefeCampaniaRole WHERE jefeCampania=:jefeCampania', [jefeCampania: jefeCampania]
	}

	static void removeAll(Role role) {
		executeUpdate 'DELETE FROM JefeCampaniaRole WHERE role=:role', [role: role]
	}

	static mapping = {
		id composite: ['role', 'jefeCampania']
		version false
	}
}
