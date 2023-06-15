const catalogo = [
    {
      nome: "Prodotto 1",
      descrizione: "Descrizione del prodotto 1",
      immagine: "prodotto1.jpg",
      prezzo: 19.99
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
  
    const immagineElement = document.createElement("img");
    immagineElement.src = prodotto.immagine;
    prodottoElement.appendChild(immagineElement);
  
    const nomeElement = document.createElement("h3");
    nomeElement.innerText = prodotto.nome;
    prodottoElement.appendChild(nomeElement);
  
    const descrizioneElement = document.createElement("p");
    descrizioneElement.innerText = prodotto.descrizione;
    prodottoElement.appendChild(descrizioneElement);
  
    const prezzoElement = document.createElement("p");
    prezzoElement.innerText = `Prezzo: $${prodotto.prezzo.toFixed(2)}`;
    prodottoElement.appendChild(prezzoElement);
  
    catalogoContainer.appendChild(prodottoElement);
  });