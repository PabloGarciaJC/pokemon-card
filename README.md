# Componente Web – PokemonCard

`PokemonCard` es un **componente web personalizado** que permite mostrar tarjetas de Pokémon con información detallada de **nombre, altura, peso, imagen y tipos**, utilizando **TailwindCSS** para estilos y efectos responsivos. Ideal para portafolios, demos y proyectos educativos.

---

## Demo del Proyecto

[https://landing-page-async-javascript/](https://landing-page-async-javascript.pablogarciajc.com/)

[Ver proyecto aplicado en GitHub](https://github.com/PabloGarciaJC/landing-page-async-javascript)

---

## Funcionalidades principales

- Mostrar **información completa** del Pokémon: nombre, altura, peso e imagen oficial.  
- Mostrar **tipos** con colores personalizados según la especie.  
- **Efectos responsivos y animaciones** al pasar el mouse (`hover`) usando TailwindCSS.  
- Compatible con **grid layouts**, adaptándose a móviles, tablets y escritorio.  
- Componente **reutilizable** mediante propiedades (`data`) de manera dinámica.  

---

## Tecnologías utilizadas

| Tecnología | Uso |
|------------|-----|
| HTML5 semántico | Estructura de contenido |
| TailwindCSS | Estilos rápidos y responsivos |
| Web Components / Custom Elements | Encapsulación y reutilización |
| JavaScript moderno (ES6+) | Lógica de renderizado dinámico |

---

## Uso del Componente

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
