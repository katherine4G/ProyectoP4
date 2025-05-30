

const Button = ({ onClick, labelText = "", style = "", disabled = false }) => {
  return (
    <button
      onClick={onClick}
      className={style}
      disabled={disabled}
    >
      {labelText}
    </button>
  );
}
export default Button;