const btnAceitar = document.getElementById('btnAceitar');

btnAceitar.addEventListener('click', function () {

    localStorage.setItem('termosAceitos', 'true');

    window.close();

});
