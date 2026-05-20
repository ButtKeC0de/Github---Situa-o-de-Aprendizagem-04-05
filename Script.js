document.getElementById('formLogin').addEventListener('submit', function(event) {
    event.preventDefault(); 

    const emailDigitado = document.getElementById('email').value.trim();
    const senhaDigitada = document.getElementById('senha').value;
    const termosAceitos = document.getElementById('termos').checked;

    if (!termosAceitos) {
        alert("Você precisa aceitar os Termos de Uso para continuar.");
        return;
    }

    const usuariosCadastrados = JSON.parse(localStorage.getItem('usuarios')) || [];

    const usuarioValido = usuariosCadastrados.find(usuario => 
        usuario.email === emailDigitado && usuario.senha === senhaDigitada
    );

    if (usuarioValido) {
        alert(`Bem-vindo de volta! Login realizado com sucesso.`);
    } else {
        alert("Email ou senha incorretos. Verifique os dados ou cadastre-se.");
    }
});

document.getElementById('text_log').addEventListener('click', function() {
    window.location.href = "cadastro.html"; 
});