const Input = ({type = "text", value, onChange, placeholder = " ", className="", name=""}) =>{
    return(
        <input
            type={type}
            name={name}
            value={value}
            placeholder={placeholder}
            onChange={onChange}
            className={className}
        />
    );
};

export default Input;