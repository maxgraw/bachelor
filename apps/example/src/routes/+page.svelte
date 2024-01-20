<script>
  import { onMount } from "svelte";

  onMount(async () => {
    await import("ar-player");
  });
</script>

<ar-element model="./Duck.gltf"></ar-element>