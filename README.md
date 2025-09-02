# Web Component – PokemonCard

`PokemonCard` is a **custom web component** that displays Pokémon cards with detailed information such as **name, height, weight, image, and types**, using **TailwindCSS** for styling and responsive effects. Ideal for portfolios, demos, and educational projects.

---

## Project Demo

[https://landing-page-async-javascript/](https://landing-page-async-javascript.pablogarciajc.com/)

[See project on GitHub](https://github.com/PabloGarciaJC/landing-page-async-javascript)

---

## Main Features

- Display **complete Pokémon information**: name, height, weight, and official image.  
- Show **types** with custom colors based on species.  
- **Responsive effects and animations** on hover using TailwindCSS.  
- Compatible with **grid layouts**, adapting to mobile, tablet, and desktop.  
- **Reusable component** through dynamic (`data`) properties.  

---

## Technologies Used

| Technology | Purpose |
|------------|---------|
| Semantic HTML5 | Content structure |
| TailwindCSS | Fast and responsive styling |
| Web Components / Custom Elements | Encapsulation and reusability |
| Modern JavaScript (ES6+) | Dynamic rendering logic |

---

## Component Usage

```javascript
import { PokemonCard } from './src/index.js';

if (!customElements.get('pokemon-card')) {
  customElements.define('pokemon-card', PokemonCard);
}

const container = document.getElementById('pokemon-container');

const pikachu = {
  name: 'pikachu',
  image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
  height: 4,
  weight: 60,
  types: ['electric']
};

const card = document.createElement('pokemon-card');
card.data = pikachu;
container.appendChild(card);
