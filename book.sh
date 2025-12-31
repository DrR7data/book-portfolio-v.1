#!/bin/bash

# setup-project.sh
# Script para crear la estructura completa del libro interactivo

set -e  # Detener script si hay error

echo "========================================="
echo "  Configurando proyecto de libro EPUB interactivo"
echo "========================================="

# Crear directorios necesarios
echo "📁 Creando directorios..."
mkdir -p sounds images chapters

# Crear archivos de configuración
echo "📝 Creando archivos de configuración..."

# _quarto.yml
cat > _quarto.yml << 'EOF'
project:
  type: book

book:
  title: "Alicia en el País de las Maravillas"
  subtitle: "Edición Interactiva"
  author: "Lewis Carroll"
  date: "2025"
  cover-image: "cover.png"
  
  chapters:
    - index.qmd
    - front-matter.qmd
    - intro.qmd
    - c1-down-the-rabbit-hole.qmd
    - c2-the-pool-of-tears.qmd
    - c3-a-caucus-race.qmd
    - c4-the-rabbit-sends-bill.qmd
    - summary.qmd
    - glossary.qmd
    - references.qmd
    - colophon.qmd

resources:
  - sounds/
  - images/
  - styles.css
  - epub-styles.css

format:
  html:
    theme: cosmo
    css: styles.css
    toc: true
    toc-depth: 3
    comments:
      hypothesis: true
  
  pdf:
    documentclass: scrreprt
    
  docx: default
  
  epub:
    css: 
      - styles.css
      - epub-styles.css
    cover-image: cover.png
    toc: true
    number-sections: true
    include-inline-css: true
    page-progression-direction: ltr
    identifier: "alicia-wonderland-interactive-2025"
    publisher: "Edición Digital Interactiva"
    rights: "© 2025 - Licencia Interactiva"
EOF
echo "✅ _quarto.yml creado"

# styles.css
cat > styles.css << 'EOF'
/* Estilos principales del libro interactivo */

/* Tooltips para definiciones */
.glossary-term {
  border-bottom: 1px dotted #2c5282;
  color: #2c5282;
  cursor: help;
  position: relative;
  text-decoration: none;
  transition: all 0.2s ease;
}

.glossary-term:hover {
  background-color: #f0fff4;
  border-bottom-color: #38a169;
}

.glossary-term::after {
  content: attr(data-definition);
  position: absolute;
  bottom: 100%;
  left: 50%;
  transform: translateX(-50%);
  background: #2d3748;
  color: white;
  padding: 8px 12px;
  border-radius: 6px;
  font-size: 0.9em;
  max-width: 250px;
  white-space: nowrap;
  visibility: hidden;
  opacity: 0;
  transition: opacity 0.3s;
  z-index: 1000;
  pointer-events: none;
}

.glossary-term:hover::after {
  visibility: visible;
  opacity: 1;
}

/* Elementos de sonido */
.sound-trigger {
  display: inline-flex;
  align-items: center;
  cursor: pointer;
  padding: 2px 8px 2px 4px;
  margin: 0 2px;
  border-radius: 16px;
  background: linear-gradient(135deg, #f7fafc, #edf2f7);
  border: 1px solid #e2e8f0;
  transition: all 0.2s ease;
  font-size: 0.95em;
  vertical-align: middle;
}

.sound-trigger:hover {
  background: linear-gradient(135deg, #bee3f8, #90cdf4);
  border-color: #63b3ed;
  transform: translateY(-1px);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.sound-icon {
  display: inline-block;
  width: 18px;
  height: 18px;
  margin-right: 6px;
  background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%234a5568"><path d="M3 9v6h4l5 5V4L7 9H3zm13.5 3c0-1.77-1.02-3.29-2.5-4.03v8.05c1.48-.73 2.5-2.25 2.5-4.02zM14 3.23v2.06c2.89.86 5 3.54 5 6.71s-2.11 5.85-5 6.71v2.06c4.01-.91 7-4.49 7-8.77s-2.99-7.86-7-8.77z"/></svg>');
  background-size: contain;
  background-repeat: no-repeat;
  filter: brightness(0.8);
}

.sound-trigger:hover .sound-icon {
  filter: brightness(1);
}

/* Notas interactivas */
.interactive-note {
  background: #fef3c7;
  border-left: 4px solid #d97706;
  padding: 1rem;
  margin: 1.5rem 0;
  border-radius: 0 8px 8px 0;
  font-size: 0.95em;
}

.interactive-note::before {
  content: "💡";
  margin-right: 8px;
  font-size: 1.1em;
}

/* Efectos de hover */
.highlight-on-hover {
  transition: all 0.3s ease;
  padding: 0 2px;
  border-radius: 3px;
}

.highlight-on-hover:hover {
  background-color: #fffacd;
  box-shadow: 0 0 0 2px #fefcbf;
}
EOF
echo "✅ styles.css creado"

# epub-styles.css
cat > epub-styles.css << 'EOF'
/* Estilos específicos para EPUB */

.glossary-term {
  border-bottom: 1px dotted #4a5568;
  text-decoration: none;
  color: inherit;
}

.glossary-term[title] {
  cursor: help;
}

.sound-trigger {
  border: 1px solid #cbd5e0;
  background-color: #f7fafc;
  border-radius: 12px;
  padding: 2px 6px;
  display: inline-flex;
  align-items: center;
}

.sound-trigger::before {
  content: "🔊";
  margin-right: 4px;
  font-size: 0.9em;
}

@media (prefers-color-scheme: dark) {
  .interactive-note {
    background: #2d3748;
    border-left-color: #d69e2e;
    color: #e2e8f0;
  }
  
  .sound-trigger {
    background-color: #4a5568;
    border-color: #718096;
    color: #e2e8f0;
  }
}

audio {
  display: none;
}

p {
  line-height: 1.6;
  margin: 1em 0;
}

@media print {
  .sound-trigger,
  .interactive-note,
  .glossary-term {
    border: none;
    background: none;
  }
  
  .sound-trigger::before {
    content: "[SONIDO] ";
    font-size: 0.8em;
    color: #666;
  }
}
EOF
echo "✅ epub-styles.css creado"

# Crear archivos QMD básicos
echo "📚 Creando archivos de contenido..."

# index.qmd
cat > index.qmd << 'EOF'
---
title: "Alicia en el País de las Maravillas"
subtitle: "Edición Interactiva Digital"
author: "Lewis Carroll"
date: "2025"
---

```{r, echo=FALSE, warning=FALSE, message=FALSE}
# Portada interactiva
library(ggplot2)
set.seed(123)
data <- data.frame(
  x = runif(100, 0, 10),
  y = runif(100, 0, 10)
)

# Gráfico decorativo
ggplot(data, aes(x, y)) +
  geom_point(alpha = 0.3, color = "purple") +
  theme_void() +
  labs(title = "")