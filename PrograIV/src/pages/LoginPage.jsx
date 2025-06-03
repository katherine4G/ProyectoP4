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

  return (
    <div className="min-h-screen flex items-center justify-center bg-[#214084]">
      <div className="w-[320px] h-[320px] bg-[#527fe1] rounded-2xl flex flex-col justify-center gap-4 p-6">
        <h1 className="text-center text-white text-xl font-bold">¡Bienvenido!</h1>

        <Input
          type="text"
          value={idUser}
          onChange={(e) => setIdUser(e.target.value)}
          name="idUser"
          placeholder="Iniciar sesión"
          className="w-[300px] mx-auto py-3 px-4 rounded bg-[#396ad6] text-black text-center font-semibold outline-none border-none"
        />

        <Input
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          name="password"
          placeholder="Contraseña"
          className="w-[300px] mx-auto py-3 px-4 rounded bg-[#396ad6] text-black text-center font-semibold outline-none border-none"
        />

        <Button
          onClick={loginLogic}
          labelText="Iniciar sesión"
          className="block mx-auto w-[300px] py-3 rounded-xl bg-[#f4cba0] text-black font-semibold hover:bg-[#eabf96] transition-colors"
        />

        <Button
          onClick={handleRegister}
          labelText="Registrarme"
          className="block mx-auto w-[300px] py-3 rounded-xl bg-[#f4cba0] text-black font-semibold hover:bg-[#eabf96] transition-colors"
        />
      </div>
    </div>
  );
};

export default LoginPage;
