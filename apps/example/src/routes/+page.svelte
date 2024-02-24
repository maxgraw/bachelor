<script>
  import { onMount } from "svelte";

  onMount(async () => {
    await import("player/interactive");
  });
</script>

<ar-element-interactive></ar-element-interactive>
