const trens = document.querySelectorAll(".trem");

trens.forEach(trem =>{

    trem.addEventListener("click", () =>{

 const id = trem.dataset.id;

    window.location.href ='detalhes.html?id=${id}';
    });

});


const pesquisa = document.getElementById("pesquisa");

pesquisa.addEventListener("input", () => {

    const valor = pesquisa.value.toLowerCase();

    trens.forEach(trem => {

        const id = trem.dataset.id;

        if(id.includes(valor)){
            trem.style.display = "block";
        }else{
            trem.style.display = "none";
        }

    });

});