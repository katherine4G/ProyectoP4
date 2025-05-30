const Input = ({type = "text", value, onChange, placeholder = " ", style="", name=""}) =>{
    return(
        <input
            type={type}
            name={name}
            value={value}
            placeholder={placeholder}
            onChange={onChange}
            className={style}
        />
    );
};

export default Input;