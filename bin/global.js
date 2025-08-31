import { PokemonCard } from '../../packages/js/packages-pokemon-card/src/index.js';

// Definir custom element
if (!customElements.get('packages-pokemon-card')) {
  customElements.define('packages-pokemon-card', PokemonCard);
}

// Crear una tarjeta de prueba
const card = document.createElement('packages-pokemon-card');
card.data = {
  name: 'pikachu',
  image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
  height: 4,
  weight: 60,
  types: ['electric']
};

document.body.appendChild(card);
