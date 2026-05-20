document.getElementById('formCadastro').addEventListener('submit', function(event) {
    event.preventDefault();

    const email = document.getElementById('emailCadastro').value.trim();
    const senha = document.getElementById('senhaCadastro').value;
    const confirmaSenha = document.getElementById('confirmaSenha').value;

    if (senha !== confirmaSenha) {
        alert("As senhas não coincidem!");
        return;
    }

    const usuariosCadastrados = JSON.parse(localStorage.getItem('usuarios')) || [];

    const usuarioExiste = usuariosCadastrados.some(usuario => usuario.email === email);

    if (usuarioExiste) {
        alert("Este email já está cadastrado!");
        return;
    }

    usuariosCadastrados.push({ email: email, senha: senha });

    localStorage.setItem('usuarios', JSON.stringify(usuariosCadastrados));

    alert("Cadastro realizado com sucesso!");
    window.location.href = "index.html";
});

document.getElementById('text_log').addEventListener('click', function() {
    window.location.href = "login.html";
});