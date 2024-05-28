Web Components sind eine Reihe an Web APIs, welche es ermöglichen abgekapselte und wiederverwendbare Komponenten in Webdokumenten sowie Webanwendungen zu erstellen. Die Technologie besteht aus mehreren Komponenten, welche teilweise einzelnd oder in Kombination verwendet werden können. Die drei Kernkomponenten sind Custom Elements, Shadow DOM und HTML Templates @web-components-introduction.

=== Custom Elements
Custom Elements ermöglichen es, eigene voll funktionsfähige DOM-Elemente zu erstellen. Durch die Definition eines Custom Elements kann ein Element korrekt konstruiert werden und es wird festgelegt, wie sich Elemente dieser Klasse bei Änderungen verhalten sollen @web-components-introduction @html-spec.

Ein Custom Element wird als JavaScript-Klasse definiert, die von einem HTMLElement abgeleitet wird. Die Klasse besitzt verschiedene vordefinierte Methoden, die das Verhalten des Elements definieren. Die Methode „connectedCallback“ ermöglicht das Ausführen von Code, wenn das Element dem Dokument hinzugefügt wird, während die Methode „disconnectedCallback“ das Verhalten beim Entfernen des Elements definiert @html-spec.

In @customElement-listing wird eine einfache Klasse „MyCustomElement“ definiert, die von HTMLElement abgeleitet ist. Hierbei werden die zuvor erläuterten Methoden „connectedCallback“ und „disconnectedCallback“ implementiert und anschließend die Klasse über die Methode „customElements.define“ registriert. Durch die Registrierung wird das Custom Element als benutzerdefiniertes DOM-Element verfügbar @html-spec.

#let code = ```js
class MyCustomElement extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {
  }

  disconnectedCallback() {
  }
}

customElements.define("my-custom-element", MyCustomElement);
```

#figure(
  code,
  caption: [Definition eines Custom Elements in JavaScript]
) <customElement-listing>

=== Shadow DOM
Shadow DOM ist ein wesentlicher Bestandteil der Webkomponenten-Technologie, der es ermöglicht, die internen Implementierungsdetails von Webkomponenten zu kapseln und somit den Stil und das Verhalten dieser Komponenten vor äußeren Einflüssen zu schützen. Durch die Verwendung des Shadow DOM kannn ein separates DOM für jede Komponente erstellt werden. Dieser Mechanismus sorgt dafür, dass die Strukturen, Stile und Skripte innerhalb des Shadow DOM nicht mit dem restlichen Dokument kollidieren oder versehentlich beeinflusst werden @web-components-introduction @dom-spec.

Um die Verwendung von Shadow DOM zu verdeutlichen, wurde die zuvor definierte "MyCustomElement" Klasse in @shadowDom-listing erweitert. In der „connectedCallback“-Funktion der Klasse wird ein Shadow Root über die Methode „attachShadow“ an die Instanz des Custom Elements angehängt. Anschließend wird ein span-HTML-Element als Wrapper erstellt und diesem eine Klasse zugewiesen. Ein Style-Element wird erstellt und der Style des Wrappers definiert. Abschließend werden das Style- und das Wrapper-Element dem Shadow Root hinzugefügt. Dadurch wird eine isolierte DOM-Struktur sowie ein eigener Stil für das Custom Element erstellt.

#let code = ```js
class MyCustomElement extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {
    const shadow = this.attachShadow({ mode: "open" });
    const wrapper = document.createElement("span");
    wrapper.setAttribute("class", "wrapper");

    const style = document.createElement("style");

    style.textContent = `
      .wrapper {
        position: relative;
      }
    `;

    shadow.appendChild(style);
    shadow.appendChild(wrapper);
  }
}
```

#figure(
  code,
  caption: [Erweiterung des Custom Elements mit Shadow DOM]
) <shadowDom-listing>

=== HTML Templates
HTML Templates sind eine weitere wichtige Technologie innerhalb der Web Components-Spezifikation, die zur Strukturierung von wiederverwendbaren HTML-Blöcken innerhalb von Webanwendungen verwendet wird. Sie ermöglichen es Markup zu definieren, das im Dokument inaktiv bleibt, bis es durch JavaScript instanziiert und als Teil einer Webkomponente verwendet wird @web-components-introduction @html-spec. Für diese Arbeit sind HTML Templates von geringer Relevanz und werden daher nicht weiter erläutert.