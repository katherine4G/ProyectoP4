import React, { useState } from 'react';

const Users = () => {
  const [users, setUsers] = useState([
    { id: 1, name: 'Pedro', password: '605340234', roleId: 2 },
    { id: 2, name: 'Ana', password: '602130321', roleId: 1 },
  ]);

  const [formData, setFormData] = useState({
    name: '',
    password: '',
    roleId: ''
  });

  const handleChange = e => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleAddUser = e => {
    e.preventDefault();
    if (!formData.name || !formData.password || !formData.roleId) return;

    const newUser = {
      id: users.length + 1, // Simulación autoincremental
      name: formData.name,
      password: formData.password,
      roleId: parseInt(formData.roleId)
    };

    setUsers([...users, newUser]);
    setFormData({ name: '', password: '', roleId: '' });
  };

  const handleDeleteUser = (id) => {
    setUsers(users.filter(user => user.id !== id));
  };

  return (
    <div style={styles.container}>
      <h2>Gestión de Usuarios</h2>

      <form onSubmit={handleAddUser} style={styles.form}>
        <input
          type="text"
          name="name"
          placeholder="Nombre"
          value={formData.name}
          onChange={handleChange}
          style={styles.input}
        />
        <input
          type="password"
          name="password"
          placeholder="Contraseña"
          value={formData.password}
          onChange={handleChange}
          style={styles.input}
        />
        <input
          type="number"
          name="roleId"
          placeholder="ID del Rol"
          value={formData.roleId}
          onChange={handleChange}
          style={styles.input}
        />
        <button type="submit" style={styles.button}>Agregar Usuario</button>
      </form>

      <table style={styles.table}>
        <thead>
          <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Contraseña</th>
            <th>ID Rol</th>
            <th>Acción</th>
          </tr>
        </thead>
        <tbody>
          {users.map(({ id, name, password, roleId }) => (
            <tr key={id}>
              <td>{id}</td>
              <td>{name}</td>
              <td>{password}</td>
              <td>{roleId}</td>
              <td>
                <button onClick={() => handleDeleteUser(id)} style={styles.deleteButton}>
                  Eliminar
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

// 🎨 Estilos simples
const styles = {
  container: {
    padding: '20px',
    fontFamily: 'Arial, sans-serif'
  },
  form: {
    marginBottom: '20px',
    display: 'flex',
    gap: '10px',
    flexWrap: 'wrap'
  },
  input: {
    padding: '8px',
    width: '200px',
    border: '1px solid #ccc',
    borderRadius: '4px'
  },
  button: {
    padding: '8px 16px',
    backgroundColor: '#007bff',
    color: 'white',
    border: 'none',
    borderRadius: '4px'
  },
  table: {
    width: '100%',
    borderCollapse: 'collapse'
  },
  deleteButton: {
    backgroundColor: '#dc3545',
    color: 'white',
    border: 'none',
    padding: '6px 12px',
    borderRadius: '4px',
    cursor: 'pointer'
  }
};

export default Users;
