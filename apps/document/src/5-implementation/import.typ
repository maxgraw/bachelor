Wie im Kapitel der Konzeption festgelegt, sollen die Modelle und Metadaten mithilfe von verschachtelten Komponenten geladen werden. Hierbei ermöglicht der zuvor definierte Web Component "ar-element-interactive" das Laden von 3D-Modellen und Metadaten. Der Component "ar-option" definiert ein Möbelstück und erhählt den Dateipfad des 3D-Modells sowie die Metadaten des Möbelstücks wie in @figure-html dargestellt. Dadurch können ohne interne Anpassungen neue Möbelstücke hinzugefügt werden oder Modelle und Metadaten verändert werden.

#let code = ```html
<ar-element-interactive>
  <ar-option
		model="one_one_center_scale.glb"
		name="1x1" id="17"
	/>
  <ar-option
		model="two_one_center_scale.glb"
		name="2x1" 
		id="18"
	/>
</ar-element-interactive>
```

#figure(
  code,
  caption: [Implementierung der "ar-element-interactive" Komponente mit zwei "ar-option" Komponenten]
) <figure-html>

Nach der Initialisierung der "ar-element-interactive" Komponente werden die "ar-option" Komponenten mithilfe der in @figure-loadOptions dargestellten Funktion geladen. Bei dieser Funktion handelt es sich um einen Auszug der vollständigen Funktion, die in @appendix-loadOptions dargestellt ist. Als Parameter wird ein Array der "ar-option" Komponenten übergeben. Anschließend werden mithilfe des von Three.js bereitgestellten GLTFLoaders die Modelle asynchron geladen. Die Modelle werden in Three.js 3D-Objekte umgewandelt und die definierten Metadaten den Objekten hinzugefügt. Hierbei kann die von Three.js bereitgestellte "userData"-Eigenschaft verwendet werden, unter der benutzerdefinierte Daten gespeichert werden können, die von Three.js ignoriert werden. Abschließend werden die Modelle in einer Variablen der Klasse namens "options" gespeichert und für die gesamte Klasse zugänglich gemacht.

#let code = ```js
export async function loadOptions(options) {
	const loader = new GLTFLoader();

	// Load all models asynchronously
	const gltfs = Promise.all(
		[...options].map((option) =>
			loader.loadAsync(option.getAttribute("model")),
		),
	);

	// Wait for all models to load
	const models = await gltfs;

	// Process each loaded model
	models.forEach((gltf, index) => {
		const model = gltf.scene.children[0];
		model.userData.name = [...options][index].getAttribute("name");
		this.options.push(model);
	});
}
```

#figure(
  code,
  caption: [Auszug der "loadOptions" Funktion zum Laden von Modellen und Metadaten]
) <figure-loadOptions>