<script>
  import { onMount } from "svelte";

  onMount(async () => {
    await import("ar-player/interactive");
  });
</script>

<h1>Product 1</h1>

<ar-element-interactive model="./Duck.gltf" editable.color="red, blue, yellow"
></ar-element-interactive>
