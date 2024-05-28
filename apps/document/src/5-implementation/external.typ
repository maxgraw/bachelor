In der Konzeption der Anwendung wurde bereits die Integration in das Shop-System von Maximilian Patzke berücksichtigt. Es wurde festgelegt, dass die Integration über eine interne Schnittstelle erfolgen soll. Hierbei wurde die Anwendung um das Menü "Einkaufen" erweitert. In der handleSelect-Funktion musste, wie bereits zuvor definiert, nur eine weitere Abfrage hinzugefügt werden, welche die handleShop-Funktion bei einem Tippen auf das Menü "Einkaufen" aufruft.

Wie in @figure-handleShop dargestellt, beendet die Funktion die aktuelle XR-Session und leitet den Nutzer auf die Shop-Seite weiter. Hierbei wird ein dynamischer Link erstellt, der die ausgewählten Elemente in den Warenkorb legt. Die Schnittstelle basiert auf der URL-Ebene des Shopsystems. Um die korrekten Möbelstücke in den Warenkorb zu legen, werden die zuvor definierten Metadaten verwendet.

#let code = ```js
export const handleShop = async (config) => {
	// End the current XR session
	await config.renderer.xr.getSession().end();

	// Create a new URL
	const url = new URL("", "https://woocommerce.maxpaszke.de");
	url.searchParams.set("add-to-cart", "232");

	// Add the selected items to the cart
	for (const item of config.options) {
		const quantity = config.selection.children.filter(
			(child) => child.userData.id === item.userData.id,
		).length;

		if (quantity === 0) continue;

		url.searchParams.set(`quantity[${item.userData.id}]`, quantity);
	}

	// Redirect the user to the shop page
	window.location.href = url.href;
};
```

#figure(
  code,
  caption: [Auszug aus der Funktion "handleShop" vom @appendix-handleShop]
) <figure-handleShop>

Um die Evaluation der Anwendung innerhalb der Arbeit von Maximilian Patzke zu ermöglichen und die Bewertung dieser Arbeit nicht zu beeinträchtigen, wurde, wie bereits zuvor beschrieben, eine eigene Web Component Klasse "ShopARElement" erstellt. Diese Klasse wurde in die zuvor beschriebene SvelteKit-Anwendung importiert und unter dem Pfad #link("https://ar.maxgraw.com/shop") veröffentlicht.