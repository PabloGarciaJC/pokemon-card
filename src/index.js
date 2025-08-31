// src/index.js

const typeColors = {
  fire: '#f56565',
  water: '#4299e1',
  grass: '#48bb78',
  electric: '#ecc94b',
  bug: '#68d391',
  poison: '#9f7aea',
  flying: '#7f9cf5',
  ground: '#ed8936',
  psychic: '#ed64a6',
  rock: '#a0aec0',
  dragon: '#667eea',
  ice: '#7fdbff',
  ghost: '#6b46c1',
  dark: '#1a202c',
  steel: '#718096',
  fairy: '#fbb6ce',
  normal: '#a0aec0'
};

export class PokemonCard extends HTMLElement {
  constructor() {
    super();
    this._data = null;
  }

  set data(val) {
    this._data = val;
    this.render();
  }

  get data() {
    return this._data;
  }

  connectedCallback() {
    this.render();
  }

  render() {
    const d = this._data || { name: '', image: '', height: '', weight: '', types: [] };

    this.innerHTML = `
      <article class="group relative p-4 rounded-xl shadow-lg hover:shadow-2xl transition bg-white/90"
               style="border: 3px solid; border-image: linear-gradient(to right, #7e5bef, #9f7aea, #d946ef) 1;">
        <div class="w-full bg-gray-200 aspect-square rounded-lg overflow-hidden flex items-center justify-center">
          <img src="${d.image}" alt="${d.name}" class="w-full h-full object-contain transition-transform duration-300 ease-out group-hover:scale-110 rounded-lg">
        </div>
        <div class="mt-3">
          <h3 class="text-base font-extrabold text-gray-900 capitalize">${d.name}</h3>
          <p class="text-gray-700 text-sm mt-1">Altura: ${d.height} | Peso: ${d.weight}</p>
          <div class="mt-2 flex flex-wrap gap-2">
            ${d.types.map(t => `<span class="inline-flex items-center px-3 py-0.5 rounded-full text-xs font-semibold capitalize"
              style="background-color: ${typeColors[t] || '#ccc'}; color: white;">${t}</span>`).join(' ')}
          </div>
        </div>
      </article>
    `;
  }
}

// Registrar el componente
if (!customElements.get('pokemon-card')) {
  customElements.define('pokemon-card', PokemonCard);
}
