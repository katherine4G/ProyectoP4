import { useState } from "react";
import { Button, Input } from "../components/index";

const LoginPage = () => {
  const [idUser, setIdUser] = useState("");
  const [password, setPassword] = useState("");

  const loginLogic = () => {
    if (!idUser || !password) {
      alert("Debe completar todos los campos");
      return;
    }
    console.log("Cédula:", idUser);
    console.log("Contraseña:", password);
  };

  const handleRegister = () => {
    alert("Redirigir a página de registro (aún no implementado)");
  };

  // 🎨 Estilos
const containerStyle = "min-h-screen flex items-center justify-center bg-[#283a65]";
const boxStyle = "flex flex-col bg-[#1e3264] mt-16 p-10 pb-6 rounded-2xl w-full max-w-sm space-y-5 shadow-lg";


const headingStyle = "text-center text-2xl font-bold text-white mb-2";
const inputStyle = "w-[250px] mx-auto py-3 px-4 rounded-xl bg-[#6b74a8] text-white placeholder-[#ffffff] placeholder-opacity-100 text-center font-semibold focus:outline-none focus:ring-2 focus:ring-white";
const buttonStyle = "block mx-auto w-full max-w-xs py-3 rounded-xl bg-[#f4cba0] text-black font-semibold hover:bg-[#eebf92] transition";
const buttonSecondary = "w-full py-3 rounded-xl bg-[#f4cba0] text-black font-semibold hover:bg-[#eebf92] transition";

  return (
    <div className={containerStyle}>
      <div className={boxStyle}>
        <Input
          type="text"
          value={idUser}
          onChange={(e) => setIdUser(e.target.value)}
          name="idUser"
          placeholder="Iniciar sesión"
          style={inputStyle}
        />

        <Input
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          name="password"
          placeholder="Contraseña"
          style={inputStyle}
        />

        <Button
          onClick={loginLogic}
          labelText="Iniciar sesión"
          style={buttonStyle}
        />

        <Button
          onClick={handleRegister}
          labelText="Registrarme"
          style={buttonSecondary}
        />
      </div>
    </div>
  );
};

export default LoginPage;
