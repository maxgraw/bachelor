<script>
  import { onMount } from "svelte";

  onMount(async () => {
    await import("ar-player/base");
  });
</script>

<base-ar-element model="./Duck.gltf"></base-ar-element>
