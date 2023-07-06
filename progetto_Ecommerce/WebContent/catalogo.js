const catalogo = [
    {
      nome: "Mini-PC MSI Cubi 5 10M-640EU",
<<<<<<< HEAD
      immagine: "logo3.jpg",
=======
      immagine: "MINI1.jpg",
>>>>>>> branch 'master' of https://github.com/PassaroF/e-commerce.git
      prezzo: 729.90
    },
    {
      nome: "Prodotto 2",
      descrizione: "Descrizione del prodotto 2",
      immagine: "prodotto2.jpg",
      prezzo: 29.99
    },
    {
      nome: "Prodotto 3",
      descrizione: "Descrizione del prodotto 3",
      immagine: "prodotto3.jpg",
      prezzo: 39.99
    }
  ];
  
  const catalogoContainer = document.getElementById("catalogo");
  
  catalogo.forEach((prodotto) => {
    const prodottoElement = document.createElement("div");
    prodottoElement.classList.add("prodotto");
  
    const nomeElement = document.createElement("h3");
    nomeElement.innerText = prodotto.nome;
    prodottoElement.appendChild(nomeElement);

    const immagineElement = document.createElement("img");
    immagineElement.src = prodotto.immagine;
    prodottoElement.appendChild(immagineElement);
  
    const prezzoElement = document.createElement("p");
    prezzoElement.innerText = `Prezzo: $${prodotto.prezzo.toFixed(2)}`;
    prodottoElement.appendChild(prezzoElement);
  
    catalogoContainer.appendChild(prodottoElement);
  });