<script>
  import { onMount } from "svelte";

  onMount(async () => {
    await import("ar-player");
  });

  $: selectedColor = "red";
</script>

<h1>Product 1</h1>

<ul>
  <li>
    <button on:click={() => (selectedColor = "red")}>Red</button>
    <button on:click={() => (selectedColor = "blue")}>Blue</button>
    <button on:click={() => (selectedColor = "yellow")}>Yellow</button>
  </li>
</ul>

{JSON.stringify(selectedColor)}

<ar-element model="./Duck.gltf" color={selectedColor}></ar-element>
