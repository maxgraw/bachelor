<script>
  import { onMount } from "svelte";

  onMount(async () => {
    await import("ar-player");
  });
</script>

<h1>Product 1</h1>

<ar-element model="./Duck.gltf" editable.color="red, blue, yellow"></ar-element>
