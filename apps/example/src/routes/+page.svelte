<script>
  import { onMount } from "svelte";

  onMount(async () => {
    await import("player/interactive");
  });
</script>

<ar-element-interactive options="box.glb, box_second.glb"></ar-element-interactive>
