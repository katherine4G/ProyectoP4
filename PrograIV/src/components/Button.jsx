

const Button = ({ onClick, labelText = "", className = "", disabled = false }) => {
  return (
    <button
      onClick={onClick}
      className={className}
      disabled={disabled}
    >
      {labelText}
    </button>
  );
}
export default Button;